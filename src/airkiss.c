/******************************* airkiss **************************/
//includes
#include "autoconf.h"
#include "platform_stdlib.h"
#include "wifi_conf.h"
#include "osdep_service.h"
#include "airkiss.h"
#include "lwip_netconf.h"
#include "udp.h"
#include <sockets.h>

/* ------------------------ FreeRTOS includes ----------------------------- */
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"

/* ------------------------ lwIP includes --------------------------------- */
#include "lwip/api.h"
#include "lwip/tcpip.h"
#include "lwip/ip.h"
#include "lwip/memp.h"
#include "lwip/stats.h"
#include "netif/loopif.h"

/* ------------------------ Project includes ------------------------------ */
#include <string.h>
#include "main.h"

#include "webserver.h"
#include "wlan_intf.h"


#define CONFIG_READ_FLASH	1


#ifdef CONFIG_READ_FLASH

#ifndef CONFIG_PLATFORM_AMEBA_X

#include <flash/stm32_flash.h>
#if defined(STM32F2XX)
#include <stm32f2xx_flash.h>
#elif defined(STM32F4XX)	 
#include <stm32f4xx_flash.h>
#elif defined(STM32f1xx)	 
#include <stm32f10x_flash.h>
#endif

#else
#include "flash_api.h"
#include "device_lock.h"
#define DATA_SECTOR     AP_SETTING_SECTOR
#define BACKUP_SECTOR	(0x00008000)

#endif
#endif




//macros
#define CHANNEL_SWITCH_TIME 100	//channel switch time,units:ms


//extern
extern void wifi_enter_promisc_mode();
//gloable 
const airkiss_config_t akconf ={
	(airkiss_memset_fn)&memset,
	(airkiss_memcpy_fn)&memcpy,
	(airkiss_memcmp_fn)&memcmp,
	(airkiss_printf_fn)&printf
};

unsigned char cur_channel = 1;
unsigned char lock_channel = 1;
static _timer timer_handler;
airkiss_context_t *akcontext = NULL;

static int airkiss_finished = 0;
static u8 security_type;
static u8 ak_rx_flag = 0;
u8 airkiss_connection_done = 0;

static char broadcast_addr[6] = {0xff,0xff,0xff,0xff,0xff,0xff};
static u8 gbssid[ETH_ALEN];

//for airkiss send notification
int g_UDPBCServerFd = -1;
struct sockaddr_in g_stUDPBCAddr;

#define DEVICE_TYPE "gh_390b83082bdd" 
#define DEVICE_ID "00E04C479520"
#define AIRKISS_LAN_PORT 12476
#define AIRKISS_BIND_PORT 12476




#define MAX_SOFTAP_SSID_LEN      32
#define MAX_PASSWORD_LEN          64
#define MAX_CHANNEL_NUM             13

#if INCLUDE_uxTaskGetStackHighWaterMark
	static volatile unsigned portBASE_TYPE uxHighWaterMark_web = 0;
#endif

/* ------------------------ Prototypes ------------------------------------ */
static void     vProcessConnection( struct netconn *pxNetCon );

/*------------------------------------------------------------------------------*/
/*                            GLOBALS                                          */
/*------------------------------------------------------------------------------*/
rtw_wifi_setting_t air_wifi_setting = {RTW_MODE_NONE, {0}, 0, RTW_SECURITY_OPEN, {0}};




#ifndef WLAN0_NAME
  #define WLAN0_NAME		"wlan0"
#endif

#ifndef WLAN1_NAME
  #define WLAN1_NAME      	"wlan1"
#endif 



static void AIR_LoadWifiSetting()
{
    const char *ifname = WLAN0_NAME;
    if(rltk_wlan_running(WLAN1_IDX))
    {
      //STA-AP_MODE
      ifname = WLAN1_NAME;
    }
    wifi_get_setting(ifname,&air_wifi_setting);
    printf("\r\nLoadWifiSetting(): air_wifi_setting.ssid=%s\n", air_wifi_setting.ssid); 
    printf("\r\nLoadWifiSetting(): air_wifi_setting.channel=%d\n", air_wifi_setting.channel);
    printf("\r\nLoadWifiSetting(): air_wifi_setting.security_type=%d\n", air_wifi_setting.security_type); 
    printf("\r\nLoadWifiSetting(): air_wifi_setting.password=%s\n", air_wifi_setting.password); 
}

#if CONFIG_READ_FLASH
#ifndef CONFIG_PLATFORM_AMEBA_X



int AIR_LoadWifiConfigT()
{
   rtw_wifi_config_t local_config;
    uint32_t address;
#ifdef STM32F10X_XL
    address = 0x08080000;   //bank2 domain
#else
    uint16_t sector_nb = FLASH_Sector_11;
    address = flash_SectorAddress(sector_nb);
#endif
    printf("\r\nLoadWifiConfig(): Read from FLASH!\n"); 
    flash_Read(address, (char *)&local_config, sizeof(local_config));
    
    printf("\r\nLoadWifiConfig(): local_config.boot_mode=0x%x\n", local_config.boot_mode); 
    printf("\r\nLoadWifiConfig(): local_config.ssid=%s\n", local_config.ssid); 
    printf("\r\nLoadWifiConfig(): local_config.channel=%d\n", local_config.channel);
    printf("\r\nLoadWifiConfig(): local_config.security_type=%d\n", local_config.security_type); 
    printf("\r\nLoadWifiConfig(): local_config.password=%s\n", local_config.password);

    if(local_config.boot_mode == 0x77665502)
    {
        air_wifi_setting.mode = RTW_MODE_STA;
        if(local_config.ssid_len > 32)
            local_config.ssid_len = 32;
        memcpy(air_wifi_setting.ssid, local_config.ssid, local_config.ssid_len);
        air_wifi_setting.ssid[local_config.ssid_len] = '\0';
        air_wifi_setting.channel = local_config.channel;
        air_wifi_setting.security_type = local_config.security_type;
        if(local_config.password_len > 64)
            local_config.password_len = 64;
        memcpy(air_wifi_setting.password, local_config.password, local_config.password_len);
        air_wifi_setting.password[local_config.password_len] = '\0';
        
        int ret = -1;
        ret = wifi_connect(air_wifi_setting.ssid, air_wifi_setting.security_type, 
				   air_wifi_setting.password, local_config.ssid_len, 
				   local_config.password_len, 
				   0,NULL);
        if(ret == 0)
        {
           printf("\r\n wifi_auto_connect ok !!\r\n");
            #if CONFIG_LWIP_LAYER
                        printf("\r\n-------DHCP in here---------- \r\n");
			/* If not rise priority, LwIP DHCP may timeout */
			vTaskPrioritySet(NULL, tskIDLE_PRIORITY + 3);	
			/* Start DHCP Client */
			dhcpflag = LwIP_DHCP(0, DHCP_START);
			vTaskPrioritySet(NULL, tskIDLE_PRIORITY + 1);	
                        printf("\r\n-------DHCP end in here---------- \r\n");
#endif
              return 0;
        }
        else
        {
            printf("\r\n wifi_auto_connect failed !!\r\n");
              return 1;
        }
       
    }
    else
    {
        AIR_LoadWifiSetting();
        return 1;
    }
     return -1;
}

void AIR_LoadWifiConfig()
{
    rtw_wifi_config_t local_config;
    uint32_t address;
#ifdef STM32F10X_XL
    address = 0x08080000;   //bank2 domain
#else
    uint16_t sector_nb = FLASH_Sector_11;
    address = flash_SectorAddress(sector_nb);
#endif
    printf("\r\nLoadWifiConfig(): Read from FLASH!\n"); 
    flash_Read(address, (char *)&local_config, sizeof(local_config));
    
    printf("\r\nLoadWifiConfig(): local_config.boot_mode=0x%x\n", local_config.boot_mode); 
    printf("\r\nLoadWifiConfig(): local_config.ssid=%s\n", local_config.ssid); 
    printf("\r\nLoadWifiConfig(): local_config.channel=%d\n", local_config.channel);
    printf("\r\nLoadWifiConfig(): local_config.security_type=%d\n", local_config.security_type); 
    printf("\r\nLoadWifiConfig(): local_config.password=%s\n", local_config.password);

    if(local_config.boot_mode == 0x77665502)
    {
        air_wifi_setting.mode = RTW_MODE_AP;
        if(local_config.ssid_len > 32)
            local_config.ssid_len = 32;
        memcpy(air_wifi_setting.ssid, local_config.ssid, local_config.ssid_len);
        air_wifi_setting.ssid[local_config.ssid_len] = '\0';
        air_wifi_setting.channel = local_config.channel;
        air_wifi_setting.security_type = local_config.security_type;
        if(local_config.password_len > 64)
            local_config.password_len = 64;
        memcpy(air_wifi_setting.password, local_config.password, local_config.password_len);
        air_wifi_setting.password[local_config.password_len] = '\0';
    }
    else
    {
        AIR_LoadWifiSetting();
    }
}

int AIR_StoreApInfo()
{
	rtw_wifi_config_t wifi_config;
	uint32_t address;
#ifdef STM32F10X_XL
	address = 0x08080000;	//bank2 domain
#else
	uint16_t sector_nb = FLASH_Sector_11;
	address = flash_SectorAddress(sector_nb);
#endif
        
         int aireraseflag = -1;
    // clean wifi_config first
    aireraseflag=AIR_EraseApinfo();
    printf("\r\n -----aireraseflag = %d ---\r\n",aireraseflag);
	// clean wifi_config first
	memset(&wifi_config, 0x00, sizeof(rtw_wifi_config_t));

	wifi_config.boot_mode = 0x77665502;
	memcpy(wifi_config.ssid, air_wifi_setting.ssid, strlen((char*)air_wifi_setting.ssid));
	wifi_config.ssid_len = strlen((char*)air_wifi_setting.ssid);
	wifi_config.security_type = air_wifi_setting.security_type;
	memcpy(wifi_config.password, air_wifi_setting.password, strlen((char*)air_wifi_setting.password));
	wifi_config.password_len= strlen((char*)air_wifi_setting.password);
	wifi_config.channel = air_wifi_setting.channel;

	printf("\n\rWritting boot mode 0x77665502 and Wi-Fi setting to flash ...");
#ifdef STM32F10X_XL
	FLASH_ErasePage(address);
#else
	flash_EraseSector(sector_nb);
#endif
	flash_Wrtie(address, (char *)&wifi_config, sizeof(rtw_wifi_config_t));

	return 0;
}


#else

int AIR_LoadWifiConfigT()
{
  flash_t flash;

    rtw_wifi_config_t local_config;
    uint32_t address;

    address = DATA_SECTOR;

    
    //memset(&local_config,0,sizeof(rtw_wifi_config_t));
    printf("\r\nLoadWifiConfig(): Read from FLASH!\n"); 
   // flash_Read(address, &local_config, sizeof(local_config));

    device_mutex_lock(RT_DEV_LOCK_FLASH);
    flash_stream_read(&flash, address, sizeof(rtw_wifi_config_t),(uint8_t *)(&local_config));
	device_mutex_unlock(RT_DEV_LOCK_FLASH);

    printf("\r\nLoadWifiConfig(): local_config.boot_mode=0x%x\n", local_config.boot_mode); 
    printf("\r\nLoadWifiConfig(): local_config.ssid=%s\n", local_config.ssid); 
    printf("\r\nLoadWifiConfig(): local_config.channel=%d\n", local_config.channel);
    printf("\r\nLoadWifiConfig(): local_config.security_type=%d\n", local_config.security_type); 
    printf("\r\nLoadWifiConfig(): local_config.password=%s\n", local_config.password);

    if(local_config.boot_mode == 0x77665502)
    {
        air_wifi_setting.mode = RTW_MODE_STA;
        if(local_config.ssid_len > 32)
            local_config.ssid_len = 32;
        memcpy(air_wifi_setting.ssid, local_config.ssid, local_config.ssid_len);
        air_wifi_setting.ssid[local_config.ssid_len] = '\0';
        air_wifi_setting.channel = local_config.channel;
        if(local_config.security_type == 1)
          air_wifi_setting.security_type = RTW_SECURITY_WPA2_AES_PSK;
        else
          air_wifi_setting.security_type = RTW_SECURITY_OPEN;
        if(local_config.password_len > 64)
            local_config.password_len = 64;
        memcpy(air_wifi_setting.password, local_config.password, local_config.password_len);
        air_wifi_setting.password[local_config.password_len] = '\0';
        
        //需要添加连接wifi热点的代码
           int ret = -1;
           int dhcpflag = -1;
        ret = wifi_connect(air_wifi_setting.ssid, air_wifi_setting.security_type, 
				   air_wifi_setting.password, local_config.ssid_len, 
				   local_config.password_len, 
				   0,NULL);
        
          if(ret == 0)
        {
           printf("\r\n wifi_auto_connect ok !!\r\n");
          
           
#if CONFIG_LWIP_LAYER

                         printf("\r\n-------DHCP in here---------- \r\n");
			/* If not rise priority, LwIP DHCP may timeout */
			vTaskPrioritySet(NULL, tskIDLE_PRIORITY + 3);	
			/* Start DHCP Client */
			dhcpflag = LwIP_DHCP(0, DHCP_START);
			vTaskPrioritySet(NULL, tskIDLE_PRIORITY + 1);	
                       printf("\r\n-------DHCP end in here---------- \r\n");
#endif
              return 0;
        }
        else
        {
            printf("\r\n wifi_auto_connect failed !!\r\n");
              return 1;
        }
        
    }
    else
    {
        AIR_LoadWifiSetting();
        
        //设置进入Airkiss模式
          return 1;
    }
     return -1;
}

void AIR_LoadWifiConfig()
{


    flash_t flash;

    rtw_wifi_config_t local_config;
    uint32_t address;

    address = DATA_SECTOR;

    
    //memset(&local_config,0,sizeof(rtw_wifi_config_t));
    printf("\r\nLoadWifiConfig(): Read from FLASH!\n"); 
   // flash_Read(address, &local_config, sizeof(local_config));

    device_mutex_lock(RT_DEV_LOCK_FLASH);
    flash_stream_read(&flash, address, sizeof(rtw_wifi_config_t),(uint8_t *)(&local_config));
	device_mutex_unlock(RT_DEV_LOCK_FLASH);

    printf("\r\nLoadWifiConfig(): local_config.boot_mode=0x%x\n", local_config.boot_mode); 
    printf("\r\nLoadWifiConfig(): local_config.ssid=%s\n", local_config.ssid); 
    printf("\r\nLoadWifiConfig(): local_config.channel=%d\n", local_config.channel);
    printf("\r\nLoadWifiConfig(): local_config.security_type=%d\n", local_config.security_type); 
    printf("\r\nLoadWifiConfig(): local_config.password=%s\n", local_config.password);

    if(local_config.boot_mode == 0x77665502)
    {
        air_wifi_setting.mode = RTW_MODE_AP;
        if(local_config.ssid_len > 32)
            local_config.ssid_len = 32;
        memcpy(air_wifi_setting.ssid, local_config.ssid, local_config.ssid_len);
        air_wifi_setting.ssid[local_config.ssid_len] = '\0';
        air_wifi_setting.channel = local_config.channel;
        if(local_config.security_type == 1)
          air_wifi_setting.security_type = RTW_SECURITY_WPA2_AES_PSK;
        else
          air_wifi_setting.security_type = RTW_SECURITY_OPEN;
        if(local_config.password_len > 64)
            local_config.password_len = 64;
        memcpy(air_wifi_setting.password, local_config.password, local_config.password_len);
        air_wifi_setting.password[local_config.password_len] = '\0';
        
        //需要添加连接wifi热点的代码
        
    }
    else
    {
        AIR_LoadWifiSetting();
        
        //设置进入Airkiss模式
    }

}

int AIR_StoreApInfo()
{

    flash_t flash;

    rtw_wifi_config_t wifi_config;
    uint32_t address;
    uint32_t data,i = 0;

    int aireraseflag = -1;
    // clean wifi_config first
    aireraseflag=AIR_EraseApinfo();
    printf("\r\n -----aireraseflag = %d ---\r\n",aireraseflag);
    memset(&wifi_config, 0x00, sizeof(rtw_wifi_config_t));

    address = DATA_SECTOR;

    wifi_config.boot_mode = 0x77665502;
    memcpy(wifi_config.ssid, air_wifi_setting.ssid, strlen((char*)air_wifi_setting.ssid));
    wifi_config.ssid_len = strlen((char*)air_wifi_setting.ssid);
    wifi_config.security_type = air_wifi_setting.security_type;
    if(air_wifi_setting.security_type !=0)
        wifi_config.security_type = 1;
    else
        wifi_config.security_type = 0;
    memcpy(wifi_config.password, air_wifi_setting.password, strlen((char*)air_wifi_setting.password));
    wifi_config.password_len= strlen((char*)air_wifi_setting.password);
    wifi_config.channel = air_wifi_setting.channel;
    printf("\n\rWritting boot mode 0x77665502 and Wi-Fi setting to flash ...");
    //printf("\n\r &wifi_config = 0x%x",&wifi_config);

   flash_read_word(&flash,address,&data);

   
    if(data == ~0x0){
	  device_mutex_lock(RT_DEV_LOCK_FLASH);
      flash_stream_write(&flash, address,sizeof(rtw_wifi_config_t), (uint8_t *)&wifi_config);
	  device_mutex_unlock(RT_DEV_LOCK_FLASH);
    }else{
    //flash_EraseSector(sector_nb);
      
        device_mutex_lock(RT_DEV_LOCK_FLASH);
        flash_erase_sector(&flash,BACKUP_SECTOR);
        for(i = 0; i < 0x1000; i+= 4){
            flash_read_word(&flash, DATA_SECTOR + i, &data);
            if(i < sizeof(rtw_wifi_config_t))
            {
                 memcpy(&data,(char *)(&wifi_config) + i,4);
                 //printf("\n\r Wifi_config + %d = 0x%x",i,(void *)(&wifi_config + i));
                 //printf("\n\r Data = %d",data);
            }
            flash_write_word(&flash, BACKUP_SECTOR + i,data);
        }
        flash_read_word(&flash,BACKUP_SECTOR + 68,&data);
        //printf("\n\r Base + BACKUP_SECTOR + 68 wifi channel = %d",data);
        //erase system data
        flash_erase_sector(&flash, DATA_SECTOR);
        //write data back to system data
        for(i = 0; i < 0x1000; i+= 4){
            flash_read_word(&flash, BACKUP_SECTOR + i, &data);
            flash_write_word(&flash, DATA_SECTOR + i,data);
        }
                  //erase backup sector
           flash_erase_sector(&flash, BACKUP_SECTOR);
        }
        device_mutex_unlock(RT_DEV_LOCK_FLASH);
	//flash_Wrtie(address, (char *)&wifi_config, sizeof(rtw_wifi_config_t));
	//flash_stream_write(&flash, address,sizeof(rtw_wifi_config_t), (uint8_t *)&wifi_config);
	//flash_stream_read(&flash, address, sizeof(rtw_wifi_config_t),data);
        //flash_stream_read(&flash, address, sizeof(rtw_wifi_config_t),data);
	//printf("\n\r Base + 0x000FF000 +4  wifi config  = %s",data[4]);
        //printf("\n\r Base + 0x000FF000 +71 wifi channel = %d",data[71]);

	return 0;
}

int AIR_EraseApinfo(){
	flash_t flash;
	uint32_t address;

	address = DATA_SECTOR;
	device_mutex_lock(RT_DEV_LOCK_FLASH);
	flash_erase_sector(&flash, address);
	device_mutex_unlock(RT_DEV_LOCK_FLASH);
	return 0;
}
#endif

#endif


/*
	airkiss active send:
	send udp packets to 255.255.255.255(12476)
	packet is generated by airkiss_lan_pack.
	
	called about every 5s

*/
int airkiss_send_active_lan_discovery_packets(int client_socket_fd, int send_times,u8 *device_mac)
{
#if CONFIG_LWIP_LAYER

	int ret = -1;
	struct sockaddr_in to_addr;
	u8 lan_buf[200]; 
	u16 lan_buf_len = sizeof(lan_buf);
#if 1
	if (send_times != 1) {
		airkiss_printf(AIRKISS_ERROR, "airkiss_send_active_lan_discovery_packets fail!\n"); 
		return -1;
	}

#else
	if (send_times >= 50) {
		airkiss_printf(AIRKISS_ERROR, "send more than 50 times multiples 100ms delay, will exceed 5s!\n"); 
		return -1;
	}
#endif

	ret = airkiss_lan_pack(AIRKISS_LAN_SSDP_NOTIFY_CMD, DEVICE_TYPE, device_mac, 0, 0, lan_buf, &lan_buf_len, &akconf); 
	if (ret != AIRKISS_LAN_PAKE_READY) { 
		airkiss_printf(AIRKISS_ERROR, "airkiss pack lan packet error!"); 
		return -1; 
	} 


	FD_ZERO(&to_addr);
	to_addr.sin_family = AF_INET;
	to_addr.sin_port = htons(AIRKISS_LAN_PORT);
	to_addr.sin_addr.s_addr =inet_addr("255.255.255.255");


	while (send_times-- > 0) {
		airkiss_printf(AIRKISS_INFO, "airkiss_send_active_lan_discovery_packets !\n"); 
		sendto(client_socket_fd, (unsigned char *)lan_buf, lan_buf_len, 0, (struct sockaddr *) &to_addr, sizeof(struct sockaddr));
		vTaskDelay(100);	/* delay 100 ms */
	}


#else
	airkiss_printf(AIRKISS_ERROR, "airkiss_send_active_lan_discovery_packets fail!\n"); 
#endif

	return 0;
}




void airkiss_lan_server_reply(int client_socket_fd, struct sockaddr_in addr, char *pdata, unsigned short len,u8* device_mac) 
{ 
	airkiss_lan_ret_t ret = -1;
	airkiss_lan_ret_t pack_ret; 
	u8 lan_buf[200]; 
	u16 lan_buf_len = sizeof(lan_buf);



	ret = airkiss_lan_recv(pdata, len, &akconf); 

	switch (ret){ 
	case AIRKISS_LAN_SSDP_REQ: 
		addr.sin_port = htons(AIRKISS_LAN_PORT);
		lan_buf_len = sizeof(lan_buf); 
		pack_ret = airkiss_lan_pack(AIRKISS_LAN_SSDP_RESP_CMD,  DEVICE_TYPE, device_mac, 0, 0, lan_buf, &lan_buf_len, &akconf); 
		if (pack_ret != AIRKISS_LAN_PAKE_READY) { 
			airkiss_printf(AIRKISS_ERROR, "Pack lan packet error!"); 
			return; 
		} 
		
		airkiss_printf(AIRKISS_INFO, "airkiss_lan_server_reply !\n"); 
		sendto(client_socket_fd, (unsigned char *)lan_buf, lan_buf_len, 0, (struct sockaddr *) &addr, sizeof(struct sockaddr));
		break; 
	default: 
		airkiss_printf(AIRKISS_ERROR, "Pack is not ssdq req!"); 
	break; 
	} 
} 


int airkiss_lan_server_create(int client_socket_fd,u8 *device_mac)
{
	int server_sock_fd,len;  
	struct sockaddr_in addr;  
	int sock_timeout_val = 1000; /* 1000 ms */
	int timeout_times = 0;
	int addr_len = sizeof(struct sockaddr_in);  
	char buffer[256] = {0};  


	printf("%s\n", __FUNCTION__);

	if((server_sock_fd = socket(AF_INET,SOCK_DGRAM,0)) < 0){  
		airkiss_printf(AIRKISS_ERROR, "create sock error!"); 
		return -1;
	}

	memset(&addr, 0, sizeof(addr));  
	addr.sin_family=AF_INET;  
	addr.sin_port=htons(AIRKISS_BIND_PORT);  
	addr.sin_addr.s_addr=htonl(INADDR_ANY) ;  

	if (bind(server_sock_fd, (struct sockaddr *)&addr, sizeof(addr))<0) {
		airkiss_printf(AIRKISS_ERROR, "bind sock error!"); 
		return -1;
	}

	setsockopt(server_sock_fd, SOL_SOCKET, SO_RCVTIMEO, &sock_timeout_val, sizeof(sock_timeout_val));

	while(1) {  
	  	memset(&buffer, 0, sizeof(buffer));  
		len = recvfrom(server_sock_fd, buffer, sizeof(buffer), 0 , (struct sockaddr *)&addr ,&addr_len);  

		if (-1 == len) {
			/* timeout happens */
			timeout_times++;
			if (5 == timeout_times) {
				timeout_times = 0;
				airkiss_send_active_lan_discovery_packets(server_sock_fd, 1, device_mac);
			}
		} else {
			/* packet received, filter and send back */ 
			airkiss_printf(AIRKISS_INFO, "receive size=%d, from %s\n", len, inet_ntoa( addr.sin_addr));  
			airkiss_lan_server_reply(server_sock_fd, addr, buffer, len, device_mac);
		}
	}

}

/* this is a task */
void airkiss_lan_discovery_start(void* param)
{
	int airkiss_sock_active = -1;
	u8 *dev_mac = (u8 *)param;

#if 0/*use one socket*/
	airkiss_sock_active = socket(PF_INET, SOCK_DGRAM, IP_PROTO_UDP);
	if (airkiss_sock_active == -1) {
		airkiss_printf(AIRKISS_ERROR, "airkiss socket create fail\n");  
		vTaskDelete(NULL);
	}
#endif
	airkiss_printf(AIRKISS_INFO, "airkiss_lan_discovery_start\n");  
	airkiss_lan_server_create(airkiss_sock_active,dev_mac);
	vTaskDelete(NULL);
}


int airkiss_createudpbroadcast(int udp_port)
{

	int ret = 0;
	int udpbufsize = 2;
	struct sockaddr_in g_stUDPBCServerAddr;

	if (g_UDPBCServerFd == -1) {
		
		g_UDPBCServerFd = socket(AF_INET, SOCK_DGRAM, 0);
		
		if (g_UDPBCServerFd < 0) {
			printf("UDP BC socket create error,g_UDPBCServerFd = %d\r\n",g_UDPBCServerFd);
			g_UDPBCServerFd = -1;
			ret = -1;
			return ret;
		}

		g_stUDPBCAddr.sin_family = AF_INET;
		g_stUDPBCAddr.sin_port = htons(udp_port);
		g_stUDPBCAddr.sin_addr.s_addr = htonl(0xffffffff);

		g_stUDPBCServerAddr.sin_family = AF_INET;
		g_stUDPBCServerAddr.sin_port = htons(udp_port);
		g_stUDPBCServerAddr.sin_addr.s_addr = htonl(INADDR_ANY);

		if (setsockopt(g_UDPBCServerFd, SOL_SOCKET, SO_BROADCAST, &udpbufsize,sizeof(int))!= 0) {
			ret = -1;
			printf("UDP BC Server setsockopt error\n");
			return ret;
		}
		if (bind(g_UDPBCServerFd, (struct sockaddr *)&g_stUDPBCServerAddr, sizeof(g_stUDPBCServerAddr))!= 0) {
			printf("UDP BC Server bind error\n");
			close(g_UDPBCServerFd);
			g_UDPBCServerFd = -1;
			ret = -1;
			return ret;
		}

	}
	printf("UDP BC Server socketid:%d on port:%d\n", g_UDPBCServerFd,udp_port);
	return ret;
}

int airkiss_send_notification(u8 random)
{
	int i = 0, ret = 0;
	if(airkiss_createudpbroadcast(10000) == -1){
		ret = -1;
		printf("create udp socket fail!\r\n");
		return ret;
	}
		
	for (i = 0; i <= 20; i++) {
		if (g_UDPBCServerFd > -1) {
			ret = sendto(g_UDPBCServerFd, (char*)&random, 1, 0 ,(struct sockaddr*)&g_stUDPBCAddr, sizeof(g_stUDPBCAddr));			
		}
	}
	close(g_UDPBCServerFd);
	g_UDPBCServerFd = 0;
	return ret;
}


void airkiss_deinit_content()
{
	
	int i = 0;
	
	//free airkiss context at last
	if(akcontext){
		rtw_free(akcontext);
		akcontext = NULL;
	}
	
	rtw_del_timer(&timer_handler);
	
}


int airkiss_finish(unsigned char security_type,  rtw_network_info_t * wifi,airkiss_context_t *context)
{
	int ret = 0;
	int retry = 3;
	unsigned char pscan_config = 1;
	airkiss_result_t result;
	rtw_security_t security_mode;
        //ADD BY shadow for test
	wifi_set_promisc(RTW_PROMISC_DISABLE,NULL,0);
        
        //end
	ret = airkiss_get_result(context, &result);
            AIR_LoadWifiConfig();
        
	if (ret == 0) {
          printf("\r\n-------airkiss stop1 in here---------- \r\n");
		if(wifi){
                  printf("\r\n-------airkiss stop2 in here---------- \r\n");
  		/*memcpy profile information to 3rd party variables*/
  	 	wifi->password_len = result.pwd_length;
	 	wifi->ssid.len = result.ssid_length;
	 	rtw_memcpy(wifi->ssid.val, result.ssid, result.ssid_length);
	 	rtw_memcpy(wifi->password, result.pwd, result.pwd_length);
	 	rtw_memcpy(wifi->bssid.octet, gbssid, ETH_ALEN);
  		}
                
                memset(&air_wifi_setting.ssid,0x00,sizeof(air_wifi_setting.ssid));
                memset(&air_wifi_setting.password,0x00,sizeof(air_wifi_setting.password));
                air_wifi_setting.security_type = security_type;
                rtw_memcpy(air_wifi_setting.ssid,result.ssid, result.ssid_length);
                rtw_memcpy(air_wifi_setting.password,result.pwd,result.pwd_length);
                 air_wifi_setting.mode=RTW_MODE_STA;
                int airflag = -1;
                
                airflag =  AIR_StoreApInfo();
                printf("\r\n -------airflag = %d  ---\r\n",airflag);
                printf("\r\n ---storeapinfo  ssid =%s  passwd = %s ---\r\n",air_wifi_setting.ssid,air_wifi_setting.password);
		airkiss_printf(AIRKISS_INFO,"\r\n airkiss get result ok,ssid = %s, pwd = %s,ssid length = %d,pwd length = %d,random = 0x%02x",
			       result.ssid, result.pwd, result.ssid_length,result.pwd_length,result.random);
	}
	else{
                 printf("\r\n-------airkiss stop3 in here---------- \r\n");
		airkiss_printf(AIRKISS_ERROR,"\r\n airkiss result not get!");
		return -1;
	}
	//ap security type
	switch(security_type){
          printf("\r\n-------airkiss stop4 in here---------- \r\n");
	case RTW_ENCRYPTION_OPEN:
		security_mode = RTW_SECURITY_OPEN;
		break;
	case RTW_ENCRYPTION_WEP40:
	case RTW_ENCRYPTION_WEP104:
		security_mode = RTW_SECURITY_WEP_PSK;
		break;
	case RTW_ENCRYPTION_WPA_TKIP:
	case RTW_ENCRYPTION_WPA_AES:
	case RTW_ENCRYPTION_WPA2_TKIP:
	case RTW_ENCRYPTION_WPA2_AES:
	case RTW_ENCRYPTION_WPA2_MIXED:
		security_mode = RTW_SECURITY_WPA2_AES_PSK;
		break;
	case RTW_ENCRYPTION_UNKNOWN:
	case RTW_ENCRYPTION_UNDEF:
	default:
          printf("\r\n-------airkiss stop5 in here---------- \r\n");
		airkiss_printf(AIRKISS_ERROR,"\r\n unknow security mode,connect fail!");
	}
	
	if(wifi){
  		wifi->security_type = security_mode;
                printf("\r\n-------airkiss stop6 in here---------- \r\n");
  	}
	while(retry){
          printf("\r\n-------airkiss stop7 in here---------- \r\n");
		if(wifi_set_pscan_chan(&lock_channel, &pscan_config, 1) < 0){
			airkiss_printf(AIRKISS_ERROR,"\n\rERROR: wifi set partial scan channel fail");
                        printf("\r\n-------airkiss stop8 in here---------- \r\n");
			break;
		}
		airkiss_printf(AIRKISS_INFO,"wifi_connect\n");
                printf("\r\n-------airkiss stop9 in here---------- \r\n");
		ret = wifi_connect(result.ssid, security_mode, 
				   result.pwd, result.ssid_length, 
				   result.pwd_length, 
				   0,NULL);
		if(ret == 0){
			airkiss_printf(AIRKISS_INFO,"\n\r Connect ok!");
                        printf("\r\n-------airkiss stop10 in here---------- \r\n");
#if CONFIG_LWIP_LAYER
                         printf("\r\n-------airkiss stop11 in here---------- \r\n");
			/* If not rise priority, LwIP DHCP may timeout */
			vTaskPrioritySet(NULL, tskIDLE_PRIORITY + 3);	
			/* Start DHCP Client */
			ret = LwIP_DHCP(0, DHCP_START);
			vTaskPrioritySet(NULL, tskIDLE_PRIORITY + 1);	
                         printf("\r\n-------airkiss stop12 in here---------- \r\n");
#endif
			break;
		}
		retry--;
	}
 
	airkiss_deinit_content();
         printf("\r\n-------airkiss stop13 in here---------- \r\n");
	//airkiss send notification
	if(airkiss_send_notification(result.random) == -1)
        {
          printf("\r\n ----result random = 0x%02x  \r\n",result.random);
          printf("\r\n-------airkiss stop14 in here---------- \r\n");
		airkiss_printf(AIRKISS_ERROR, "airkiss send notifacation fail\r\n");
        }
        
       

#if 1
	  /*set airkiss_connection_done*/
printf("\r\n-------airkiss stop15 in here---------- \r\n");
	if(wifi) {
		airkiss_connection_done = 1;
                printf("\r\n-------airkiss stop16 in here---------- \r\n");
	}
#endif  
printf("\r\n-------airkiss stop17 in here---------- \r\n");
#if CONFIG_INIC_CMD_RSP
	inic_c2h_wifi_info("ATWX", ret);
        printf("\r\n-------airkiss stop18 in here---------- \r\n");
#endif
printf("\r\n-------airkiss stop19 in here---------- \r\n");
                AIR_LoadWifiConfig();
         
	return 0;
	
}
void timer_handler_func(void *FunctionContext)
{
	
	if(ak_rx_flag){
		rtw_set_timer(&timer_handler, CHANNEL_SWITCH_TIME - 50);
	} else {
		if(cur_channel >= 13)
			cur_channel = 1;
		else
			cur_channel ++;
		wifi_set_channel(cur_channel);
		/* inform airkiss we have changed channel */
		airkiss_change_channel(akcontext);
		rtw_set_timer(&timer_handler, CHANNEL_SWITCH_TIME);
	}
	
	// wifi_set_channel(8);
	airkiss_printf(AIRKISS_INFO,"\r\n wifi switch channel to %d",cur_channel);
}

static int rtl_promisc_is_ap(unsigned short i_fc)
{
	if ((i_fc & DS_FRAME_MASK) == GET_AP_FRAME)
		return 1;
	else
		return 0;
}

static int rtl_promisc_is_sta(unsigned short i_fc)
{
	if ((i_fc & DS_FRAME_MASK) == GET_STA_FRAME)
		return 1;
	else
		return 0;
}



static void rtl_frame_recv_handle(char *buf, int len) {
	
	int ret = 0;
	int fixed_channel;
	char scanned_ssid[50] = {0};
	char *current_bssid = NULL;
	int scanned_ssid_len = 0;
	
	//set this flag prevent airkiss_recv interruptted by timer,since timer has higher priority
	ak_rx_flag = 1;
	if (airkiss_finished) {
		ak_rx_flag = 0;
		return;
	}
	
	ret = airkiss_recv(akcontext, buf, len);
	if(ret == AIRKISS_STATUS_CHANNEL_LOCKED){  
		lock_channel = cur_channel;
		rtw_cancel_timer(&timer_handler);
		airkiss_printf(AIRKISS_INFO,"\r\n AirKiss locked to channel[%d]\n",lock_channel);
		
		current_bssid = buf + 4 + ETH_ALEN;
		
		/*printf("current bssid = %02x:%02x:%02x:%02x:%02x:%02x\n", 
		current_bssid[0],current_bssid[1],current_bssid[2],
		current_bssid[3],current_bssid[4],current_bssid[5]);
		*/
		fixed_channel = promisc_get_fixed_channel(current_bssid, scanned_ssid, &scanned_ssid_len);
		if (fixed_channel != 0) {
			airkiss_printf(AIRKISS_INFO,"AirKiss force fixed to channel[%d]\r\n",fixed_channel);
			airkiss_printf(AIRKISS_INFO,"AirKiss ssid scanned[%s]\r\n",scanned_ssid);
			wifi_set_channel(fixed_channel);
		}
		
	}
	else if(ret == AIRKISS_STATUS_COMPLETE){

		//will loop and stuck here, so dont quit.
		//printf("______________________________quit promisc fail on V03 12876!\n");
		//wifi_set_promisc(RTW_PROMISC_DISABLE,NULL,0);

	
		airkiss_finished = 1;
		airkiss_printf(AIRKISS_INFO,"quit promisc mode!\r\n");
	} 
	//release flag
	ak_rx_flag = 0;
	
}



void wifi_promisc_rx(unsigned char* buf, unsigned int len, void* user_data)
{
	unsigned char ret = 0;
	//	int index = 0;
	ieee80211_frame_info_t *promisc_info;
	promisc_info = user_data;
	
	if (airkiss_finished)
		return;
	
	security_type = promisc_info->encrypt;
	if (rtl_promisc_is_ap(promisc_info->i_fc)) {
		if (memcmp(promisc_info->i_addr1, broadcast_addr, ETH_ALEN) != 0)
			return;
	}
	
	if (rtl_promisc_is_sta(promisc_info->i_fc)) {
		if (memcmp(promisc_info->i_addr3, broadcast_addr, ETH_ALEN) != 0)
			return;
	}
	
	
	rtl_frame_recv_handle(buf, len);
	
}

void airkiss_process(void *param)
{
	rtw_network_info_t *wifi = NULL;
	wifi = (rtw_network_info_t *)param;
	u32 start_time = xTaskGetTickCount();
	
	while(!airkiss_finished ){
		vTaskDelay(15);
	}

	if(!airkiss_finished)
		airkiss_printf(AIRKISS_ERROR,"\n\rAirkiss timeout!");
	else {
		airkiss_printf(AIRKISS_INFO,"\r\nairkiss complete!");
		
		airkiss_finish(security_type, wifi,akcontext);

	}
	vTaskDelete(NULL);
}

int airkiss_init_content(airkiss_context_t **content)
{
	
	int ret = 0;
	
	//free airkiss context if still exists
	if(*content){
		rtw_free(*content);
		*content = NULL;
	}
	
	//init airkiss context
	*content = (airkiss_context_t *)rtw_malloc(sizeof(airkiss_context_t));
	if(!(*content)){
		airkiss_printf(AIRKISS_ERROR,"\n\rAlloc airkiss context failed!");
		ret = -1;
		return ret;
	}
	
	//init airkiss
	ret = airkiss_init(*content,&akconf);
	if(ret < 0){
		airkiss_printf(AIRKISS_ERROR,"Airkiss init failed!\r\n");
		return ret;
	}
	
#if AIRKISS_ENABLE_CRYPT
	airkiss_set_key(*content, key, strlen(key));
#endif
	
	return 0;
}

int airkiss_start(rtw_network_info_t *wifi)
{
	char ret = 0;
	
	airkiss_finished = 0;
	
#if AIRKISS_ENABLE_CRYPT
	const char *key = "wechatiothardwav";
#endif
	if(xTaskCreate(airkiss_process, (char const *)"AirKiss", 1512, wifi, tskIDLE_PRIORITY + 3, NULL) != pdPASS)
		airkiss_printf(AIRKISS_ERROR,"\n\r%s xTaskCreate failed", __FUNCTION__);

	//get airkiss version
	airkiss_printf(AIRKISS_INFO,"\n\rAirkiss version %s",airkiss_version());
	if (airkiss_init_content(&akcontext) < 0)
		airkiss_printf(AIRKISS_ERROR,"airkiss init fail!\n");
	
	//set wifi to station mode,enable promisc mode and timer to change channel
	wifi_enter_promisc_mode();
	
	/* enable all 802.11 packets*/
	wifi_set_promisc(RTW_PROMISC_ENABLE_2, wifi_promisc_rx, 1);
	
	//init timer handler,and set timer hanler funcion
	rtw_init_timer(&timer_handler, NULL, &timer_handler_func, NULL, "airkiss_timer");
	//set channel
	wifi_set_channel(cur_channel);
	//set timer to CHANNEL_SWITCH_TIME(ms)	
	rtw_set_timer(&timer_handler, CHANNEL_SWITCH_TIME);
	
	return ret;
}
/*********************************************************/
