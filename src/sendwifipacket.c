/*
WIFISendPacket 


*/

#include "FreeRTOS.h"
#include "task.h"
#include <wifi_structures.h>
#include "main.h"
#include "main_test.h"
#include "device.h"
#include <time.h>
#include "timer_api.h"
////for gpio to deepsleep
#include "gpio_api.h"
#include "gpio_irq_api.h"
#include "sleep_ex_api.h"
#include "sys_api.h"
#include "diag.h"




#if CONFIG_WLAN
#include "wifi_conf.h"
#include "wlan_intf.h"
#include "wifi_constants.h"
#endif
#include "lwip_netconf.h"
#include <platform/platform_stdlib.h>
#ifndef CONFIG_INIT_NET
#define CONFIG_INIT_NET 1
#endif 
#ifndef CONFIG_INTERACTIVE_MODE
#define CONFIG_INTERACTIVE_MODE 1
#endif
//#ifndef CONFIG_P2P_NEW
#define CONFIG_P2P_NEW 1
#define CONFIG_ENABLE_P2P 0
//#endif
#define STACKSIZE (512+768)
#define MAX_ARGC 12
static rtw_ap_info_t ap = {0};
static unsigned char password[65] = {0};

xSemaphoreHandle uart_rx_interrupt_sema2 = NULL;

//This for send wifi packet like esp8266
u8 channel = 9 ;

//Access point MAC to deauth
u8 sap[6]={0x00,0x01,0x02,0x03,0x04,0x05};

//Client MAC to deauth
u8 client[6] = {0x06,0x07,0x08,0x09,0x0a,0x0b};

//Sequence number of a packet from ap to client
u16 seq_n = 0;
u16 seq_channel = 1;

//Packet buffer
u8 packet_buffer[64];

u16 probe_req_packet(u8 *buf,u8 *client,u16 seq);
u16 deauth_packet(u8 *buf,u8 *client,u8 *ap,u16 seq)
{
  int i = 0;
  //Type:deauth
  buf[0] = 0xc0;
  buf[1] = 0x00;
  
  //Duration 0 msec,will be written by wifi
  buf[2] = 0x00;
  buf[3] = 0x00;
  
  //Destination
  for(i = 0;i < 6;i++)
  {
    buf[i+4]  =client[i];
  }
  
  //Sender
  for(i = 0;i<6;i++)
  {
    buf[i+10] = sap[i];
    
  }
  
  for(i = 0;i<6;i++)
  {
    buf[i+16] = sap[i];
  }
  
  //seq_n
  buf[22] = seq % 0xff;
  buf[23] = seq / 0xff;
  
  //deauth reason
  buf[24] = 1;
  buf[25] = 0;
  
  return 26;

}

u16 probe_req_packet(u8 *buf,u8 *client,u16 seq)
{
  int i =0;
  //Type :Probe Request
  buf[0] = 0x40;
  buf[1] = 0x00;
  
  //Duration 0 msec,will be re-writted by wifi
  buf[2] = 0x00;
  buf[3] = 0x00;

  //Destination
  for(i=0;i<6;i++)
  {
      buf[i+4]= 0xff;
  }
  
  //Sender
  for(i=0;i<6;i++)
  {
    buf[i+10] = client[i];
  }
  
  
  //Bssid
  for(i=0;i<6;i++)
  {
   buf[i+16] = 0x00;
  }
  
  
  //Seq_n
  buf[22] = seq % 0xff;
  buf[23] = seq / 0xff;
  
  //Timestamp
  
  //SSID ,LEN
  
  buf[24] = 0x00;
  buf[25] = 0x08;
  buf[26] = 0x69;
  buf[27] = 0x6e;
  buf[28] = 0x54;
  buf[29] = 0x68;
  buf[30] = 0x69;
  buf[31] = 0x6e;
  buf[32] = 0x67;
  buf[33] = 0x73;
  return 34;
}

static rtw_network_info_t wifi = {
  {0}, //ssid
  {0}, //bssid
  0, //security
  NULL, //password
  0,
  -1  //key id
};


//Function for monitor
#if CONFIG_LWIP_LAYER
extern struct netif xnetif[NET_IF_NUM];
#endif

//Get MAC information
u8 *gl_mac = NULL;

void getmac(void *arg)
{
   int i = 0;
   u8 *mac = LwIP_GetMAC(&xnetif[0]);
   gl_mac = LwIP_GetMAC(&xnetif[0]);
   u8 *ifname[2] = {WLAN0_NAME,WLAN1_NAME};
   rtw_wifi_setting_t setting;
   for(i=0;i<NET_IF_NUM;i++)
   {
    if(rltk_wlan_running(i))
    {
#if CONFIG_LWIP_LAYER
      mac = LwIP_GetMAC(&xnetif[i]);
      gl_mac = LwIP_GetMAC(&xnetif[i]);
#endif
      printf("\n\r\n WIFI %s Status: Running",ifname[i]);
      printf("\n\r===============\r\n");
      rltk_wlan_statistic(i);
             
        wifi_get_setting((const char *)ifname[i],&setting);
        wifi_show_setting((const char *)ifname[i],&setting);

      printf("\r\nInterface(%s)",ifname[i]);
      printf("\n\r==================");
     for(int x =0;x<6;x++)
     {
        client[x] = mac[x];
     }
      
      printf("\n\r\tMAC => %02x:%02x:%02x:%02x:%02x:%02x", mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]); 
      

    }
   }
}
//add timer
gtimer_t my_timer1;
gtimer_t my_timer2;
volatile uint32_t time2_expired=0;

//timer1 timeout to do something
void timer1_timeout_handler(uint32_t id)
{ 
      //  printf("\r\n-----timer1 out ----\r\n");
         
        //    wifi_set_channel(seq_channel);   //延时一段时间跳频
   

}  

void timer2_timeout_handler(uint32_t id)
{
     time2_expired = 1;
}
            
void wifisendpacket_thread(void *param)
{
#if CONFIG_INIT_NET
#if CONFIG_LWIP_LAYER
    /* Initilaize the LwIP stack */
    LwIP_Init();
#endif
#endif
 #if CONFIG_WIFI_IND_USE_THREAD
   // printf("--------wifi---ind---use--thread----\n");
    wifi_manager_init();
#endif   
    #if CONFIG_WLAN
    wifi_on(RTW_MODE_AP);
#if CONFIG_AUTO_RECONNECT
    //setup reconnection flag
  //  printf("---------config----auto----reconnect---\n");
#endif
    printf("\n\r%s(%d), Available heap 0x%x", __FUNCTION__, __LINE__, xPortGetFreeHeapSize());
#endif
    #if CONFIG_INTERACTIVE_MODE
    /* Initial uart rx swmaphore*/
   // printf("------------config----interactive--mode---\n");
    vSemaphoreCreateBinary(uart_rx_interrupt_sema2);
    xSemaphoreTake(uart_rx_interrupt_sema2, 1 / portTICK_RATE_MS);
    start_interactive_mode();
#endif
    int flag  = -1;
    rtw_bss_info_t *apinfo;
    rtw_security_t *sec;
    rtw_scan_result_t *scanresult = NULL;
    rtw_scan_result_handler_t results_handler;
    flag = wifi_manager_init();
  //  printf("---------------flag = %d ---------\n", flag);
    flag = -1;
    flag = wifi_set_channel(13);
  //  printf("--------------setchannel-flag = %d ---------\n", flag);
    flag = -1;
    flag = wext_set_mode(WLAN0_NAME,3);  //设置AP模式
  //     printf("--------------set_mode-flag = %d ---------\n", flag);
    getmac(param);
     u16 ret = -1;
    u16 size = probe_req_packet(packet_buffer, client, seq_n);
    int s = 0;
    int csleep =0;
    
//    //Inital a peridical timer
//    gtimer_init(&my_timer1,TIMER2);
//    gtimer_start_periodical(&my_timer1,1000000,(void*)timer1_timeout_handler, NULL);
    
    
    //Inital a one-shout timer and re-trigger it in while loop
     gtimer_init(&my_timer2,TIMER3);
     time2_expired = 0;
     gtimer_start_one_shout(&my_timer2,300000,(void*)timer2_timeout_handler,NULL );
     
     while(1)
     {
       if(time2_expired){
        
     //    printf("\r\n----timer2 timeout\r\n");
        ret = -1;
        size = probe_req_packet(packet_buffer, client, seq_n);
        ret = wext_send_mgnt(WLAN0_NAME, packet_buffer,34, 0);
     //   printf("\r\n---we--ret = %d ----\r\n", ret); 
        rtw_mdelay_os(30);
        //  ret = wext_send_mgnt(WLAN0_NAME, packet_buffer,34, 0);
       // printf("\r\n---we--ret = %d ----\r\n", ret); 
       // rtw_mdelay_os(30);
       // ret = wext_send_mgnt(WLAN0_NAME, packet_buffer,34, 0);
      //  printf("\r\n---we--ret = %d ----\r\n", ret); 
      //  rtw_mdelay_os(30);
        
         getmac(param);
         s++;  
         if (s >= 3)
        {
            s = 0;
            
            seq_channel ++;
           if (seq_channel > 13)
           {
                seq_channel = 1;   
                // enter deep sleep     
           deepsleep_ex(DSLEEP_WAKEUP_BY_TIMER, 1000);   
            }

         flag = wifi_set_channel(seq_channel);   //延时一段时间跳频
            
        }
          time2_expired = 0;
        gtimer_start_one_shout(&my_timer2, 300000, (void*)timer2_timeout_handler, NULL);
       }
     }
     
    
      /* Kill init thread after all init tasks done */
    printf("\r\n-------------vtaskdelete------\n");
    vTaskDelete(NULL);

}
             
void SendPacket()
{
   if (xTaskCreate(wifisendpacket_thread, ((const char *)"wifisendpacket"), STACKSIZE, NULL, tskIDLE_PRIORITY + 3 + PRIORITIE_OFFSET, NULL) != pdPASS)
        printf("\n\r%s xTaskCreate(init_thread) failed", __FUNCTION__);
  // if (xTaskCreate(test_thread, ((const char *)"test"), STACKSIZE, NULL, tskIDLE_PRIORITY + 1 + PRIORITIE_OFFSET, NULL) != pdPASS)
   //     printf("\n\r%s xTaskCreate(init_thread) failed", __FUNCTION__);

}

