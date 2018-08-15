/*


WORK with airkiss
*/
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h" 

#include "main.h"
#include "main_test.h"

#include "device.h"
#include "gpio_api.h"   // mbed
#include "gpio_irq_api.h"   // mbed
#include "gpio_irq_ex_api.h"
#include "diag.h"


#define GPIO_R_LED_PIN        PA_5
#define GPIO_G_LED_PIN        PA_0
#define GPIO_IRQ_PIN        PA_12


//LED 控制变量声明
int red_led_ctrl;
gpio_t gpio_red_led;

int green_led_ctrl;
gpio_t gpio_green_led;

#ifndef CONFIG_GPIO_LEVEL_IRQ
#define CONFIG_GPIO_LEVEL_IRQ 1
#endif

extern u32 ConfigDebugWarn;

#if CONFIG_WLAN
#include "wifi_conf.h"
#include "wlan_intf.h"
#include "wifi_constants.h"
#endif
#include "lwip_netconf.h"
#include <platform/platform_stdlib.h>

#ifndef CONFIG_INIT_NET
#define CONFIG_INIT_NET             1
#endif
#ifndef CONFIG_INTERACTIVE_MODE
#define CONFIG_INTERACTIVE_MODE     1
#endif

#define STACKSIZE                   (512 + 768)

xSemaphoreHandle uart_rx_interrupt_sema3 = NULL;

#if CONFIG_GPIO_LEVEL_IRQ

#define GPIO_IRQ_LEVEL_PIN PA_12
#define GPIO_SIGNAL_SOURCE PA_5
gpio_irq_t gpio_level;
int current_level = IRQ_LOW;

void gpio_level_irq_handler(uint32_t id,gpio_irq_event event)
{
  uint32_t *level = (uint32_t *)id;
  
  //Disable level irq because the irq will keep triggered when it keeps  in same level.
  gpio_irq_disable(&gpio_level);
  
  //make some software de_bounce here if the signal source is not stable.
  if(*level == IRQ_LOW)
  {
     DBG_8195A("low level event\r\n");
     //Change to listen to high level event.
     *level  =IRQ_HIGH;
     gpio_irq_set(&gpio_level,IRQ_HIGH,1);
     gpio_irq_enable(&gpio_level);
     
  }
  else if(*level == IRQ_HIGH)
  {
     DBG_8195A("high level event\r\n");
     //Change to listen to low level event
     
    *level = IRQ_LOW;
    gpio_irq_set(&gpio_level,IRQ_LOW,1);
    gpio_irq_enable(&gpio_level);
  }
 
  
}



#endif




/*
*  int LED_Blink(PinName ledpin,int delaytime,int times);
*  PinName LED引脚名称
*  delaytime: 延时时间
* times : 重复次数
* success : return 0;
*
*/

int LED_Blink(PinName ledpin,int delaytime,int times)
{
  gpio_t gpio_led;
  //Init led control pin
  gpio_init(&gpio_led,ledpin);
  gpio_dir(&gpio_led,PIN_OUTPUT);   //Direction: Output
  gpio_mode(&gpio_led,PullNone);  //No pull
  int x = 0;
  for(x=0;x<=times;x++)
  {
  gpio_write(&gpio_led,0);
  rtw_mdelay_os(delaytime);
  gpio_write(&gpio_led,1);
  rtw_mdelay_os(delaytime);
  }
  return 0;
}
void workwithairkiss_t(void *arg)
{
	int ret = RTW_SUCCESS;
	
	ret = airkiss_start(NULL);
#if CONFIG_INIC_CMD_RSP
	if(ret != RTW_SUCCESS)
		inic_c2h_msg("ATWX", RTW_ERROR, NULL, 0);
#endif	
        
}

void airkiss_gpio_init_thread(void *param)
{
      wifi_set_autoreconnect(0);
   
      workwithairkiss_t(param);
  /* Kill init thread after all init tasks done */
	vTaskDelete(NULL);

 
}


void gpio_demo_irq_handler (uint32_t id, gpio_irq_event event)
{
    gpio_t *gpio_red_led;

    DBG_8195A("%s==>\n", __FUNCTION__);
    gpio_red_led = (gpio_t *)id;

    red_led_ctrl = !red_led_ctrl;
    gpio_write(gpio_red_led, red_led_ctrl);
    gpio_write(&gpio_green_led, 0);
   
     if(xTaskCreate(airkiss_gpio_init_thread, ((const char*)"airkiss_gpio_init"), STACKSIZE, NULL, tskIDLE_PRIORITY + 2 + PRIORITIE_OFFSET, NULL) != pdPASS)
        printf("\n\r%s xTaskCreate(init_thread) failed", __FUNCTION__);
     
}



void workwithairkiss_init_thread(void *param)
{

  
  gpio_irq_t gpio_btn;

    // Init LED control pin
    gpio_init(&gpio_red_led, GPIO_R_LED_PIN);
    gpio_dir(&gpio_red_led, PIN_OUTPUT);    // Direction: Output
    gpio_mode(&gpio_red_led, PullNone);     // No pull

     gpio_init(&gpio_green_led, GPIO_G_LED_PIN);
    gpio_dir(&gpio_green_led, PIN_OUTPUT);    // Direction: Output
    gpio_mode(&gpio_green_led, PullNone);     // No pull

    // Initial Push Button pin as interrupt source
    gpio_irq_init(&gpio_btn, GPIO_IRQ_PIN, gpio_demo_irq_handler, (uint32_t)(&gpio_red_led));
    gpio_irq_set(&gpio_btn, IRQ_FALL, 1);   // Falling Edge Trigger
    gpio_irq_enable(&gpio_btn);

    red_led_ctrl = 1;
    green_led_ctrl = 1;
    gpio_write(&gpio_red_led, red_led_ctrl);
    gpio_write(&gpio_green_led, green_led_ctrl);
#if CONFIG_INIT_NET
#if CONFIG_LWIP_LAYER
	/* Initilaize the LwIP stack */
	LwIP_Init();
#endif
#endif
#if CONFIG_WIFI_IND_USE_THREAD
	wifi_manager_init();
#endif
#if CONFIG_WLAN
	wifi_on(RTW_MODE_STA);
#if CONFIG_AUTO_RECONNECT
	//setup reconnection flag
         int cflag = -1;
        cflag = wifi_set_autoreconnect(1);
	
        printf("\r\n-------wifi_set_autoreconnect--  cflag= %d--\r\n",cflag);
        cflag  = -1;
        u8 * getmode=NULL;
       cflag = wifi_get_autoreconnect(getmode);
       int getmodelen = sizeof(getmode);
      printf("\r\n-------wifi_get_autoreconnect--  cflag= %d-  length = %d -----data = %s -\r\n",cflag,getmodelen,getmode); 	
      
    // AIR_LoadWifiConfig();

#endif
	printf("\n\r%s(%d), Available heap 0x%x", __FUNCTION__, __LINE__, xPortGetFreeHeapSize());	
#endif

#if CONFIG_INTERACTIVE_MODE
 	/* Initial uart rx swmaphore*/
	vSemaphoreCreateBinary(uart_rx_interrupt_sema3);
	xSemaphoreTake(uart_rx_interrupt_sema3, 1/portTICK_RATE_MS);
	start_interactive_mode();
#endif	

        //在这里判断 flash区域中是否有内容 要是有内容 把SSID 和PASSWORD 读出 添加连接wifi的代码
  /*
        int connectflag = -1;
        connectflag = AIR_LoadWifiConfigT();
        if(connectflag == 0)
        {
         printf("\r\n ======Wifi CONNECT!!!!-----\r\n");
        }
        else if(connectflag== 1)
        {
         printf("\r\n ======Wifi Didn't CONNECT!!!!-----\r\n");
        }
        else
        {
          printf("\r\n -=====Error :: connectflag = %d======\r\n",connectflag);
        }
        
       */ 
         printf("\r\n TimeDelay 3s\r\n");
        rtw_mdelay_os(3000);
        printf("\r\n TimeDelay 5s\r\n");
        rtw_mdelay_os(5000);
        printf("\r\n TimeDelay 5s  end \r\n");
       int ctflag = 1;
       ctflag = wifi_is_connected_to_ap();
       printf("\r\n =======ctflag = %d =======\r\n",ctflag);
       
       if(ctflag == 0)
       {
            printf("\r\n === connect ap is ok !!!\r\n");
            LED_Blink(GPIO_G_LED_PIN,1000,5);
            
       }
       else
       {
            printf("\r\n =====connect ap is failed !!!\r\n");
            LED_Blink(GPIO_R_LED_PIN,1000,5);
            wifi_set_autoreconnect(0);
        }
        
      
       
        //如果 flash 区域中没有内容 就执行airkiss
      
        
	/* Kill init thread after all init tasks done */
	vTaskDelete(NULL);
}

void workwithairkiss()
{
	if(xTaskCreate(workwithairkiss_init_thread, ((const char*)"workwithairkiss_init"), STACKSIZE, NULL, tskIDLE_PRIORITY + 3 + PRIORITIE_OFFSET, NULL) != pdPASS)
		printf("\n\r%s xTaskCreate(init_thread) failed", __FUNCTION__);
}