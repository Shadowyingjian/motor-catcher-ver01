#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\common\\example\\get_beacon_frame\\example_get_beacon_frame.c"





 
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"




 




#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\inc\\platform_autoconf.h"


 




 



 








 
#line 32 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\inc\\platform_autoconf.h"



 
#line 42 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\inc\\platform_autoconf.h"



 
#line 52 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\inc\\platform_autoconf.h"



 
#line 62 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\inc\\platform_autoconf.h"



 





 





 





 





 





 





 





 





 





 





 




 





 







 





 






 





 




 




 




 







 




 




 




 






 




 




 




 




 








 
#line 11 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"
 




 
#line 27 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"

 




 
#line 41 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"



 


 



 










 







#line 83 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"

 
#line 96 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"

 
#line 106 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"

 


 


 





 







 



 
#line 143 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"



 







 



 

#line 174 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"
 

 


 


 


 


 

   
 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 
#line 255 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"

 
#line 270 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"

 


#line 286 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"

 
#line 302 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"











 





 





















 

 


 
#line 358 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"

 
#line 379 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"

 






 





 

 
#line 403 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"






 


	 
 


 


 


 


 
















#line 450 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_opts.h"

#line 8 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\common\\example\\get_beacon_frame\\example_get_beacon_frame.c"
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\example\\get_beacon_frame/example_get_beacon_frame.h"








 

typedef struct beacon_info_str{
	
	unsigned char frame_ctl[2];
	unsigned char duration_id[2];
	unsigned char addr1[6];
	unsigned char addr2[6];
	unsigned char addr3[6];
	unsigned char seq_ctl[2];
	
	unsigned char timestamp[8];
}BEACON_INFO_T;

void example_get_beacon_frame(void);
int get_beacon_frame_func(BEACON_INFO_T beacon_frame);

#line 9 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\common\\example\\get_beacon_frame\\example_get_beacon_frame.c"
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"





 









#line 22 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"

#line 150 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"

#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdio.h"
 
 




  #pragma system_include


#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"
 
 

 


  #pragma system_include







 























 






#line 67 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"











 

#line 99 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"









#line 11 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdio.h"
#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"
 
 





  #pragma system_include


#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"
 
 

 


  #pragma system_include







 























 






#line 67 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"

#line 12 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"

                 









  


                 




















 


   
#line 59 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"





#line 70 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"

                 
#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Defaults.h"



























 





  #pragma system_include


 
#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\INC\\c\\DLib_Config_Normal.h"
 
 





  #pragma system_include


 

#line 40 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Defaults.h"
   
#line 47 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Defaults.h"

 
#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Product.h"




   #pragma system_include







 




 


 



 



 


 




 
#line 45 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Product.h"

 


 


 






 




 


 


 
#line 99 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Product.h"







#line 51 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Defaults.h"











 












 
























 













 























































































































 






 














 
























 


















 
















 








 















 

#line 351 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Defaults.h"













 













 












 














 












 












 












 












 

















 

















 






















 















 








 














 

#line 566 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Defaults.h"












 












 












 












 












 












 












 












 












 










 







 












 







 








 



















































 
















 




#line 812 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Defaults.h"





 

#line 826 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Defaults.h"


   
#line 836 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Defaults.h"

#line 844 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Defaults.h"
  







 









 








 







 






 

#line 899 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Defaults.h"




 







 






 















 

   
#line 943 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Defaults.h"









 

  #pragma language = save 
  #pragma language = extended





  #pragma language = restore










 








 







 
#line 997 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Defaults.h"





 







#line 73 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"











                 




















 
#line 147 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"





                 


 




 
 
#line 170 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"

 




 






 






 
#line 233 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"











                 
#line 292 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"









#line 308 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"








#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\xencoding_limits.h"
 
 





  #pragma system_include


#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"
 
 

 


  #pragma system_include







 























 






#line 67 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"

#line 12 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\xencoding_limits.h"
#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"
 
 

#line 707 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"




 
#line 13 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\xencoding_limits.h"

                                 


#line 24 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\xencoding_limits.h"




#line 42 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\xencoding_limits.h"

                                 














#line 317 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"



                 

                 
#line 335 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"

                 
#line 360 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"

                 
                 




#line 382 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"


                 

                                 







  #pragma language=save
  #pragma language=extended
  typedef long long _Longlong;
  typedef unsigned long long _ULonglong;
  #pragma language=restore
#line 405 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"






  typedef unsigned short int _Wchart;
  typedef unsigned short int _Wintt;


#line 424 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"

#line 432 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"

                 


typedef signed int  _Ptrdifft;
typedef unsigned int     _Sizet;

 


                 
#line 454 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"
  typedef _VA_LIST __Va_list;



__intrinsic __nounwind void __iar_Atexit(void (*)(void));



  typedef struct
  {        
    unsigned int _Wchar;
    unsigned int _State;
  } _Mbstatet;
#line 477 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"










typedef struct
{        

  _Longlong _Off;     



  _Mbstatet _Wstate;
} _Fpost;







                 

#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Threads.h"













 





  #pragma system_include






 






















































































 

 



#line 157 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Threads.h"

  
 

   





  


#line 176 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Threads.h"





#line 187 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Threads.h"





  #pragma language=save 
  #pragma language=extended
  __intrinsic __nounwind void __iar_dlib_perthread_initialize(void  *);
  __intrinsic __nounwind void  *__iar_dlib_perthread_allocate(void);
  __intrinsic __nounwind void __iar_dlib_perthread_destroy(void);
  __intrinsic __nounwind void __iar_dlib_perthread_deallocate(void  *);









  #pragma segment = "__DLIB_PERTHREAD" 
  #pragma segment = "__DLIB_PERTHREAD_init" 


























#line 242 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Threads.h"

   
  void  *__iar_dlib_perthread_access(void  *);
  #pragma language=restore



























     
  









   






  





  
  typedef void *__iar_Rmtx;
  

  
  __intrinsic __nounwind void __iar_system_Mtxinit(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_system_Mtxdst(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_system_Mtxlock(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_system_Mtxunlock(__iar_Rmtx *m);

  __intrinsic __nounwind void __iar_file_Mtxinit(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_file_Mtxdst(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_file_Mtxlock(__iar_Rmtx *m);
  __intrinsic __nounwind void __iar_file_Mtxunlock(__iar_Rmtx *m);

  
 
  __intrinsic __nounwind void __iar_clearlocks(void);


#line 323 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Threads.h"

  





  

#line 341 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Threads.h"

  typedef unsigned _Once_t;



  













#line 506 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"

#line 516 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"

                 
#line 524 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"


                 

  
  
    
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Locale(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Malloc(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Stream(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Debug(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_StaticGuard(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock(unsigned int);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Locale(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Malloc(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Stream(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Debug(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_StaticGuard(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock(unsigned int);

  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Initdynamicfilelock(__iar_Rmtx *);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Dstdynamicfilelock(__iar_Rmtx *);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Lockdynamicfilelock(__iar_Rmtx *);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlockdynamicfilelock(__iar_Rmtx *);
  
  
#line 564 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"

                 
#line 572 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"

#line 690 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"

                 





#line 705 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\yvals.h"






 
#line 12 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdio.h"
#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ysizet.h"
 
 





  #pragma system_include


#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"
 
 

 


  #pragma system_include







 























 






#line 67 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"

#line 12 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ysizet.h"



                 




typedef _Sizet size_t;




typedef unsigned int __data_size_t;











#line 13 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdio.h"
#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ystdio.h"
 
 




  #pragma system_include







#line 58 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ystdio.h"
  

 

__intrinsic __nounwind int remove(const char *);
__intrinsic __nounwind int rename(const char *, const char *);














 
#line 14 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdio.h"



 
#pragma rtmodel="__dlib_file_descriptor","0"

                 








#line 66 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdio.h"

#line 88 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdio.h"

#line 99 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdio.h"










                 
typedef _Fpost fpos_t;

                 
#pragma language=save
#pragma language=extended

#line 125 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdio.h"

#line 177 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdio.h"


              
_Pragma("function_effects = no_read(1)")    __intrinsic __nounwind char * __gets(char *, int);
_Pragma("function_effects = no_read(1)")    __intrinsic __nounwind char * gets(char *);
_Pragma("function_effects = no_write(1)")    __intrinsic __nounwind void perror(const char *);
_Pragma("function_effects = no_write(1)")    _Pragma("__printf_args") _Pragma("library_default_requirements _Printf = unknown") __intrinsic __nounwind int printf(const char *, ...);
_Pragma("function_effects = no_write(1)")    __intrinsic __nounwind int puts(const char *);
_Pragma("function_effects = no_write(1)")    _Pragma("__scanf_args") _Pragma("library_default_requirements _Scanf = unknown")  __intrinsic __nounwind int scanf(const char *, ...);
_Pragma("function_effects = no_read(1), no_write(2)") _Pragma("__printf_args") _Pragma("library_default_requirements _Printf = unknown") __intrinsic __nounwind int sprintf(char *, 
                                                 const char *, ...);
_Pragma("function_effects = no_write(1,2)") _Pragma("__scanf_args") _Pragma("library_default_requirements _Scanf = unknown")  __intrinsic __nounwind int sscanf(const char *, 
                                                const char *, ...);
             __intrinsic __nounwind char * tmpnam(char *);
              
             __intrinsic __nounwind int __ungetchar(int);
_Pragma("function_effects = no_write(1)")    _Pragma("__printf_args") _Pragma("library_default_requirements _Printf = unknown") __intrinsic __nounwind int vprintf(const char *,
                                                 __Va_list);

  _Pragma("function_effects = no_write(1)")    _Pragma("__scanf_args") _Pragma("library_default_requirements _Scanf = unknown")  __intrinsic __nounwind int vscanf(const char *, 
                                                  __Va_list);
  _Pragma("function_effects = no_write(1,2)") _Pragma("__scanf_args") _Pragma("library_default_requirements _Scanf = unknown")  __intrinsic __nounwind int vsscanf(const char *, 
                                                   const char *, 
                                                   __Va_list);

_Pragma("function_effects = no_read(1), no_write(2)")  _Pragma("__printf_args") _Pragma("library_default_requirements _Printf = unknown") __intrinsic __nounwind int vsprintf(char *, 
                                                   const char *,
                                                   __Va_list);
               
_Pragma("function_effects = no_write(1)")      __intrinsic __nounwind size_t __write_array(const void *, size_t, size_t);

  _Pragma("function_effects = no_read(1), no_write(3)") _Pragma("__printf_args") _Pragma("library_default_requirements _Printf = unknown") __intrinsic __nounwind int snprintf(char *, size_t, 
                                                    const char *, ...);
  _Pragma("function_effects = no_read(1), no_write(3)") _Pragma("__printf_args") _Pragma("library_default_requirements _Printf = unknown") __intrinsic __nounwind int vsnprintf(char *, size_t,
                                                     const char *, 
                                                     __Va_list);


              __intrinsic __nounwind int getchar(void);
              __intrinsic __nounwind int putchar(int);



#pragma language=restore

#line 238 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdio.h"




#line 292 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdio.h"




 
#line 162 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"
#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdlib.h"
 
 





  #pragma system_include


#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"
 
 

 


  #pragma system_include







 























 






#line 67 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"

#line 12 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdlib.h"
#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ysizet.h"
 
 

#line 30 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ysizet.h"







#line 14 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdlib.h"


 
#pragma rtmodel="__dlib_full_locale_support",   "0"





extern int __aeabi_MB_CUR_MAX(void);


#line 34 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdlib.h"





                 













                 


  typedef _Wchart wchar_t;


typedef struct
{        
  int quot;
  int rem;
} div_t;

typedef struct
{        
  long quot;
  long rem;
} ldiv_t;



    #pragma language=save
    #pragma language=extended
    typedef struct
    {      
      _Longlong quot;
      _Longlong rem;
    } lldiv_t;
    #pragma language=restore



                 
  
__intrinsic __nounwind int atexit(void (*)(void));

  __intrinsic __noreturn __nounwind void _Exit(int) ;

__intrinsic __noreturn __nounwind void exit(int) ;
__intrinsic __nounwind char * getenv(const char *);
__intrinsic __nounwind int system(const char *);



             __intrinsic __noreturn __nounwind void abort(void) ;
_Pragma("function_effects = no_state, no_errno")     __intrinsic __nounwind int abs(int);
             __intrinsic __nounwind void * calloc(size_t, size_t);
_Pragma("function_effects = no_state, no_errno")     __intrinsic __nounwind div_t div(int, int);
             __intrinsic __nounwind void free(void *);
_Pragma("function_effects = no_state, no_errno")     __intrinsic __nounwind long labs(long);
_Pragma("function_effects = no_state, no_errno")     __intrinsic __nounwind ldiv_t ldiv(long, long);


    #pragma language=save
    #pragma language=extended
    _Pragma("function_effects = no_state, no_errno") __intrinsic __nounwind long long llabs(long long);
    _Pragma("function_effects = no_state, no_errno") __intrinsic __nounwind lldiv_t lldiv(long long, long long);
    #pragma language=restore


             __intrinsic __nounwind void * malloc(size_t);
_Pragma("function_effects = no_write(1)")    __intrinsic __nounwind int mblen(const char *, size_t);
_Pragma("function_effects = no_read(1), no_write(2)") __intrinsic __nounwind size_t mbstowcs(wchar_t *, 
                                          const char *, size_t);
_Pragma("function_effects = no_read(1), no_write(2)") __intrinsic __nounwind int mbtowc(wchar_t *, const char *, 
                                     size_t);
             __intrinsic __nounwind int rand(void);
             __intrinsic __nounwind void srand(unsigned int);
             __intrinsic __nounwind void * realloc(void *, size_t);
_Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind long strtol(const char *, 
                                      char **, int);
_Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind unsigned long strtoul(const char *, char **, int);
_Pragma("function_effects = no_read(1), no_write(2)") __intrinsic __nounwind size_t wcstombs(char *, 
                                          const wchar_t *, size_t);
_Pragma("function_effects = no_read(1)")    __intrinsic __nounwind int wctomb(char *, wchar_t);


    #pragma language=save
    #pragma language=extended
    _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind long long strtoll(const char *, char **, int);
    _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind unsigned long long strtoull(const char *, 
                                                          char **, int);
    #pragma language=restore





#line 188 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdlib.h"



    _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind unsigned long __iar_Stoul(const char *, char **, 
                                                        int);
    _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind float         __iar_Stof(const char *, char **, long);
    _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind double        __iar_Stod(const char *, char **, long);
    _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind long double   __iar_Stold(const char *, char **, 
                                                          long);
    _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind long          __iar_Stolx(const char *, char **, int, 
                                                        int *);
    _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind unsigned long __iar_Stoulx(const char *, char **,
                                                         int, int *);
    _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind float         __iar_Stofx(const char *, char **, 
                                                        long, int *);
    _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind double        __iar_Stodx(const char *, char **, 
                                                        long, int *);
    _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind long double   __iar_Stoldx(const char *, char **, 
                                                         long, int *);

      #pragma language=save
      #pragma language=extended
      _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind _Longlong   __iar_Stoll(const char *, char **, 
                                                        int);
      _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind _ULonglong   __iar_Stoull(const char *, char **, 
                                                          int);
      _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind _Longlong    __iar_Stollx(const char *, char **, 
                                                          int, int *);
      _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind _ULonglong   __iar_Stoullx(const char *, char **, 
                                                           int, int *);
      #pragma language=restore








typedef int _Cmpfun(const void *, const void *);

_Pragma("function_effects = no_write(1,2)") __intrinsic void * bsearch(const void *, 
                                                   const void *, size_t,
                                                   size_t, _Cmpfun *);
             __intrinsic void qsort(void *, size_t, size_t, 
                                               _Cmpfun *);
             __intrinsic void __qsortbbl(void *, size_t, size_t, 
                                                    _Cmpfun *);
_Pragma("function_effects = no_write(1)")    __intrinsic __nounwind double atof(const char *);
_Pragma("function_effects = no_write(1)")    __intrinsic __nounwind int atoi(const char *);
_Pragma("function_effects = no_write(1)")    __intrinsic __nounwind long atol(const char *);


    #pragma language=save
    #pragma language=extended
    _Pragma("function_effects = no_write(1)") __intrinsic __nounwind long long atoll(const char *);
    #pragma language=restore

  _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind float strtof(const char *, 
                                         char **);
  _Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind long double strtold(const char *, char **);

_Pragma("function_effects = no_write(1), no_read(2)") __intrinsic __nounwind double strtod(const char *, 
                                        char **);
                                        

                                        
               __intrinsic __nounwind size_t __iar_Mbcurmax(void);

  _Pragma("function_effects = no_state, no_errno")     __intrinsic __nounwind int __iar_DLib_library_version(void);

  


#line 276 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdlib.h"



  
  typedef void _Atexfun(void);
  
#line 304 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdlib.h"


                 
    #pragma inline=no_body
    double atof(const char *_S)
    {       
      return (__iar_Stod(_S, 0, 0));
    }

    #pragma inline=no_body
    int atoi(const char *_S)
    {       
      return ((int)__iar_Stoul(_S, 0, 10));
    }

    #pragma inline=no_body
    long atol(const char *_S)
    {       
      return ((long)__iar_Stoul(_S, 0, 10));
    }



        #pragma language=save
        #pragma language=extended
        #pragma inline=no_body
        long long atoll(const char *_S)
        {       



            return ((long long)__iar_Stoull(_S, 0, 10));

        }
        #pragma language=restore



    #pragma inline=no_body
    double strtod(const char * _S, char ** _Endptr)
    {       
      return (__iar_Stod(_S, _Endptr, 0));
    }


      #pragma inline=no_body
      float strtof(const char * _S, char ** _Endptr)
      {       
        return (__iar_Stof(_S, _Endptr, 0));
      }

      #pragma inline=no_body
      long double strtold(const char * _S, char ** _Endptr)
      {       
        return (__iar_Stold(_S, _Endptr, 0));
      }


    #pragma inline=no_body
    long strtol(const char * _S, char ** _Endptr, 
                int _Base)
    {       
      return (__iar_Stolx(_S, _Endptr, _Base, 0));
    }

    #pragma inline=no_body
    unsigned long strtoul(const char * _S, char ** _Endptr, 
                          int _Base)
    {       
      return (__iar_Stoul(_S, _Endptr, _Base));
    }



        #pragma language=save
        #pragma language=extended
        #pragma inline=no_body
        long long strtoll(const char * _S, char ** _Endptr,
                          int _Base)
        {       



            return (__iar_Stoll(_S, _Endptr, _Base));

        }

        #pragma inline=no_body
        unsigned long long strtoull(const char * _S, 
                                    char ** _Endptr, int _Base)
        {       



            return (__iar_Stoull(_S, _Endptr, _Base));

        }
        #pragma language=restore





  #pragma inline=no_body
  int abs(int i)
  {       
    return (i < 0 ? -i : i);
  }

  #pragma inline=no_body
  long labs(long i)
  {       
    return (i < 0 ? -i : i);
  }



      #pragma language=save
      #pragma language=extended
      #pragma inline=no_body
      long long llabs(long long i)
      {       
        return (i < 0 ? -i : i);
      }
      #pragma language=restore



#line 465 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdlib.h"




#line 494 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdlib.h"




 
#line 163 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"
#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\string.h"
 
 




  #pragma system_include


#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"
 
 

 


  #pragma system_include







 























 






#line 67 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"

#line 11 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\string.h"
#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ysizet.h"
 
 

#line 30 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ysizet.h"







#line 13 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\string.h"

#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Product_string.h"








 





  #pragma system_include




  
  

  





 


  




 



#line 47 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\DLib_Product_string.h"



  


 


  #pragma inline=forced_no_body
  __intrinsic __nounwind void * memcpy(void * _D, const void * _S, size_t _N)
  {
    __aeabi_memcpy(_D, _S, _N);
    return _D;
  }


  #pragma inline=forced_no_body
  __intrinsic __nounwind void * memmove(void * _D, const void * _S, size_t _N)
  {
    __aeabi_memmove(_D, _S, _N);
    return _D;
  }


  #pragma inline=forced_no_body
  __intrinsic __nounwind void * memset(void * _D, int _C, size_t _N)
  {
    __aeabi_memset(_D, _N, _C);
    return _D;
  }

  
  



#line 16 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\string.h"



                 




                 

_Pragma("function_effects = no_state, no_errno, no_write(1,2)")   __intrinsic __nounwind int        memcmp(const void *, const void *,
                                                size_t);
_Pragma("function_effects = no_state, no_errno, no_read(1), no_write(2), returns 1") __intrinsic __nounwind void *     memcpy(void *, 
                                                const void *, size_t);
_Pragma("function_effects = no_state, no_errno, no_read(1), no_write(2), returns 1") __intrinsic __nounwind void *     memmove(void *, const void *, size_t);
_Pragma("function_effects = no_state, no_errno, no_read(1), returns 1")    __intrinsic __nounwind void *     memset(void *, int, size_t);
_Pragma("function_effects = no_state, no_errno, no_write(2), returns 1")    __intrinsic __nounwind char *     strcat(char *, 
                                                const char *);
_Pragma("function_effects = no_state, no_errno, no_write(1,2)")   __intrinsic __nounwind int        strcmp(const char *, const char *);
_Pragma("function_effects = no_write(1,2)")     __intrinsic __nounwind int        strcoll(const char *, const char *);
_Pragma("function_effects = no_state, no_errno, no_read(1), no_write(2), returns 1") __intrinsic __nounwind char *     strcpy(char *, 
                                                const char *);
_Pragma("function_effects = no_state, no_errno, no_write(1,2)")   __intrinsic __nounwind size_t     strcspn(const char *, const char *);
                 __intrinsic __nounwind char *     strerror(int);
_Pragma("function_effects = no_state, no_errno, no_write(1)")      __intrinsic __nounwind size_t     strlen(const char *);
_Pragma("function_effects = no_state, no_errno, no_write(2), returns 1")    __intrinsic __nounwind char *     strncat(char *, 
                                                 const char *, size_t);
_Pragma("function_effects = no_state, no_errno, no_write(1,2)")   __intrinsic __nounwind int        strncmp(const char *, const char *, 
                                                 size_t);
_Pragma("function_effects = no_state, no_errno, no_read(1), no_write(2), returns 1") __intrinsic __nounwind char *     strncpy(char *, 
                                                 const char *, size_t);
_Pragma("function_effects = no_state, no_errno, no_write(1,2)")   __intrinsic __nounwind size_t     strspn(const char *, const char *);
_Pragma("function_effects = no_write(2)")        __intrinsic __nounwind char *     strtok(char *, 
                                                const char *);
_Pragma("function_effects = no_write(2)")        __intrinsic __nounwind size_t     strxfrm(char *, 
                                                 const char *, size_t);


  _Pragma("function_effects = no_write(1)")      __intrinsic __nounwind char *   strdup(const char *);
  _Pragma("function_effects = no_write(1,2)")   __intrinsic __nounwind int      strcasecmp(const char *, const char *);
  _Pragma("function_effects = no_write(1,2)")   __intrinsic __nounwind int      strncasecmp(const char *, const char *, 
                                                   size_t);
  _Pragma("function_effects = no_state, no_errno, no_write(2)")    __intrinsic __nounwind char *   strtok_r(char *, const char *, char **);
  _Pragma("function_effects = no_state, no_errno, no_write(1)")    __intrinsic __nounwind size_t   strnlen(char const *, size_t);




#line 81 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\string.h"
  _Pragma("function_effects = no_state, no_errno, no_write(1)")    __intrinsic __nounwind void *memchr(const void *_S, int _C, size_t _N);
  _Pragma("function_effects = no_state, no_errno, no_write(1)")    __intrinsic __nounwind char *strchr(const char *_S, int _C);
  _Pragma("function_effects = no_state, no_errno, no_write(1,2)") __intrinsic __nounwind char *strpbrk(const char *_S, const char *_P);
  _Pragma("function_effects = no_state, no_errno, no_write(1)")    __intrinsic __nounwind char *strrchr(const char *_S, int _C);
  _Pragma("function_effects = no_state, no_errno, no_write(1,2)") __intrinsic __nounwind char *strstr(const char *_S, const char *_P);




                 


                 

_Pragma("function_effects = no_state, no_errno, no_write(1)")    __intrinsic __nounwind void *__iar_Memchr(const void *, int, size_t);
_Pragma("function_effects = no_state, no_errno, no_write(1)")    __intrinsic __nounwind char *__iar_Strchr(const char *, int);
               __intrinsic __nounwind char *__iar_Strerror(int, char *);
_Pragma("function_effects = no_state, no_errno, no_write(1,2)") __intrinsic __nounwind char *__iar_Strpbrk(const char *, const char *);
_Pragma("function_effects = no_state, no_errno, no_write(1)")    __intrinsic __nounwind char *__iar_Strrchr(const char *, int);
_Pragma("function_effects = no_state, no_errno, no_write(1,2)") __intrinsic __nounwind char *__iar_Strstr(const char *, const char *);


                 
#line 168 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\string.h"
                 
    #pragma inline
    void *memchr(const void *_S, int _C, size_t _N)
    {
      return (__iar_Memchr(_S, _C, _N));
    }

    #pragma inline
    char *strchr(const char *_S, int _C)
    {
      return (__iar_Strchr(_S, _C));
    }

    #pragma inline
    char *strpbrk(const char *_S, const char *_P)
    {
      return (__iar_Strpbrk(_S, _P));
    }

    #pragma inline
    char *strrchr(const char *_S, int _C)
    {
      return (__iar_Strrchr(_S, _C));
    }

    #pragma inline
    char *strstr(const char *_S, const char *_P)
    {
      return (__iar_Strstr(_S, _P));
    }


  #pragma inline
  char *strerror(int _Err)
  {
    return (__iar_Strerror(_Err, 0));
  }

#line 451 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\string.h"






#line 479 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\string.h"




 
#line 164 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"
	#include <stdarg.h>  
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\diag.h"







 




#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_autoconf.h"


 




 



 








 
#line 32 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_autoconf.h"



 
#line 42 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_autoconf.h"



 
#line 52 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_autoconf.h"



 
#line 62 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_autoconf.h"



 





 





 





 





 





 





 





 





 





 





 




 





 







 





 






 





 




 




 




 







 




 




 




 






 




 




 




 




 








 
#line 14 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\diag.h"
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"


















 




#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdint.h"
 
 




  #pragma system_include


#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"
 
 

 


  #pragma system_include







 























 






#line 67 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"

#line 11 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdint.h"



 

  typedef signed char   int8_t;
  typedef unsigned char uint8_t;



  typedef signed short int   int16_t;
  typedef unsigned short int uint16_t;



  typedef signed int   int32_t;
  typedef unsigned int uint32_t;



  #pragma language=save
  #pragma language=extended
  typedef signed long long int   int64_t;
  typedef unsigned long long int uint64_t;
  #pragma language=restore



 
typedef signed char   int_least8_t;
typedef unsigned char uint_least8_t;

typedef signed short int   int_least16_t;
typedef unsigned short int uint_least16_t;

typedef signed int   int_least32_t;
typedef unsigned int uint_least32_t;

 

  #pragma language=save
  #pragma language=extended
  typedef signed long long int int_least64_t;
  #pragma language=restore


  #pragma language=save
  #pragma language=extended
  typedef unsigned long long int uint_least64_t;
  #pragma language=restore




 
typedef signed int   int_fast8_t;
typedef unsigned int uint_fast8_t;

typedef signed int   int_fast16_t;
typedef unsigned int uint_fast16_t;

typedef signed int   int_fast32_t;
typedef unsigned int uint_fast32_t;


  #pragma language=save
  #pragma language=extended
  typedef signed long long int int_fast64_t;
  #pragma language=restore


  #pragma language=save
  #pragma language=extended
  typedef unsigned long long int uint_fast64_t;
  #pragma language=restore


 
#pragma language=save
#pragma language=extended
typedef signed long long int   intmax_t;
typedef unsigned long long int uintmax_t;
#pragma language=restore


 
typedef signed long int   intptr_t;
typedef unsigned long int uintptr_t;

 



typedef int __data_intptr_t; typedef unsigned int __data_uintptr_t;


 






























































































 

































#line 258 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdint.h"




 
#line 25 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"






















		













typedef unsigned int	        uint;
typedef	signed int		        sint;


typedef signed long long        __int64_t;
typedef unsigned long long      __uint64_t;


#line 77 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"





typedef unsigned char           BOOL;


typedef unsigned char           bool;








typedef struct { volatile int counter; } atomic_t;

typedef enum _RTK_STATUS_ {
    _EXIT_SUCCESS = 0,
    _EXIT_FAILURE = 1
}RTK_STATUS, *PRTK_STATUS;

#line 107 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"


typedef void * PVOID;


typedef     uint32_t dma_addr_t;

typedef     void (*proc_t)(void*);

typedef     unsigned int __kernel_size_t;
typedef     int __kernel_ssize_t;

typedef 	__kernel_size_t	SIZE_T;	
typedef	    __kernel_ssize_t	SSIZE_T;

























#line 178 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"







#line 201 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"











 




#line 228 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"

#line 241 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"







 




















































#line 307 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"






#line 319 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"





#line 331 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"

		


		


	


	
#line 348 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"
	
#line 355 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"

#line 363 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"
			









#line 379 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"

#line 386 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"

#line 394 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"








#line 411 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"




typedef unsigned char	BOOLEAN,*PBOOLEAN,boolean;







 








								
								
								
								
								

								
								
#line 449 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"












#line 480 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\fwlib\\include\\basic_types.h"







typedef struct _RAM_START_FUNCTION_ {
    void (*RamStartFun) (void);
	void (*RamWakeupFun) (void);
}RAM_START_FUNCTION, *PRAM_START_FUNCTION;

typedef struct _RAM_FUNCTION_START_TABLE_ {
	void (*RamStartFun) (void);
	void (*RamWakeupFun) (void);
	void (*RamPatchFun0) (void);
	void (*RamPatchFun1) (void);
	void (*RamPatchFun2) (void);
	void (*FlashStartFun) (void);
}RAM_FUNCTION_START_TABLE, *PRAM_FUNCTION_START_TABLE;

#line 15 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\diag.h"

#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stddef.h"
 
 




  #pragma system_include


#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"
 
 

 


  #pragma system_include







 























 






#line 67 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"

#line 11 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stddef.h"
#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ysizet.h"
 
 

#line 30 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ysizet.h"







#line 13 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stddef.h"



                 








                 




  typedef _Ptrdifft ptrdiff_t;









#line 49 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stddef.h"





 
#line 17 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\diag.h"
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\app\\monitor\\include\\rtl_trace.h"















 







 




 



 

 
typedef enum {
	MODULE_OS		= 0,   
	MODULE_BOOT		= 1,   
	MODULE_GDMA	= 2,   
	MODULE_GPIO		= 3,   
	MODULE_TIMER	= 4,   
	MODULE_I2C		= 5,   
	MODULE_I2S		= 6,   
	MODULE_PWM		= 7,   
	MODULE_SDIO		= 8,   
	MODULE_SPI		= 9,   
	MODULE_FLASH	= 10,  
	MODULE_UART		= 11,  
	MODULE_USOC		= 12,  
	MODULE_IPSEC	= 13,  
	MODULE_ADC		= 14,  
	MODULE_EFUSE	= 15,  
	MODULE_MONIT	= 16,  
	MODULE_MISC		= 17,  

	MODULE_NUMs            
} MODULE_DEFINE;

 
typedef enum {
	LEVEL_ERROR	= 0,  
	LEVEL_WARN	= 1,  
	LEVEL_INFO		= 2,  
	LEVEL_TRACE	= 3,  
	LEVEL_NUMs		= 4   
} LEVEL_DEFINE;


 



 

 
 
extern uint32_t ConfigDebug[];
 


















 
void LOG_MASK_MODULE(uint32_t module, uint32_t level, uint32_t new_status);
void LOG_MASK(uint32_t config[]);
void LOG_PRINTF(uint32_t module, uint32_t level, uint32_t line, const char*fmt, ...);



 
#line 120 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\app\\monitor\\include\\rtl_trace.h"



 



 



 


 
#line 18 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\diag.h"

extern uint32_t ConfigDebugClose;
extern uint32_t ConfigDebugErr;
extern uint32_t ConfigDebugInfo;
extern uint32_t ConfigDebugWarn;

extern uint32_t CfgSysDebugErr;
extern uint32_t CfgSysDebugInfo;
extern uint32_t CfgSysDebugWarn;










#line 57 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\diag.h"

extern  uint32_t DiagPrintf(const char *fmt, ...);
uint32_t DiagSPrintf(uint8_t *buf, const char *fmt, ...);
int prvDiagPrintf(const char *fmt, ...);
int prvDiagSPrintf(char *buf, const char *fmt, ...);






























#line 100 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\diag.h"








































#line 153 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\diag.h"

#line 161 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\diag.h"

typedef enum {
	DBG_CFG_ERR=0,
	DBG_CFG_WARN=1,
	DBG_CFG_INFO=2
} DBG_CFG_TYPE;

typedef struct {
	uint8_t cmd_name[16];
	uint32_t	cmd_type;
} DBG_CFG_CMD;

typedef enum _CONSOLE_OP_STAGE_ {
	ROM_STAGE = 0,
	RAM_STAGE = 1
}CONSOLE_OP_STAGE;

#line 166 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\strproc.h"







 




#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stddef.h"
 
 
#line 39 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stddef.h"

#line 49 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stddef.h"





 
#line 14 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\strproc.h"
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\va_list.h"







 




#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_autoconf.h"


 




 



 








 
#line 32 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_autoconf.h"



 
#line 42 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_autoconf.h"



 
#line 52 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_autoconf.h"



 
#line 62 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\platform_autoconf.h"



 





 





 





 





 





 





 





 





 





 





 




 





 







 





 






 





 




 




 




 







 




 




 




 






 




 




 




 




 








 
#line 14 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\va_list.h"


#line 36 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\va_list.h"

#line 15 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\strproc.h"

#line 24 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\strproc.h"

extern  SIZE_T _strlen(const char *s);
extern  int _strcmp(const char *cs, const char *ct);
extern  char *_strncpy(char *dest, const char *src, size_t count);
extern  char *_strcpy(char *dest, const char *src);
extern  size_t _strlen(const char *s);
extern  size_t _strnlen(const char *s, size_t count);
extern  int _strncmp(const char *cs, const char *ct, size_t count);
extern  int _sscanf(const char *buf, const char *fmt, ...);
extern  char *_strsep(char **s, const char *ct);
extern  char *skip_spaces(const char *str);
extern  int skip_atoi(const char **s);
extern  int _vsscanf(const char *buf, const char *fmt, va_list args);
extern  unsigned long long simple_strtoull(const char *cp, char **endp, unsigned int base);
extern  long simple_strtol(const char *cp, char **endp, unsigned int base);
extern  long long simple_strtoll(const char *cp, char **endp, unsigned int base);
extern  unsigned long simple_strtoul(const char *cp, char **endp, unsigned int base);
extern  const char *_parse_integer_fixup_radix(const char *s, unsigned int *base);
extern  unsigned int _parse_integer(const char *s, unsigned int base, unsigned long long *p);
extern  uint64_t div_u64(uint64_t dividend, uint32_t divisor);
extern  int64_t div_s64(int64_t dividend, int32_t divisor);
extern  uint64_t div_u64_rem(uint64_t dividend, uint32_t divisor, uint32_t *remainder);
extern  int64_t div_s64_rem(int64_t dividend, int32_t divisor, int32_t *remainder);
extern  char *_strpbrk(const char *cs, const char *ct);
extern  char *_strchr(const char *s, int c);


extern  void
prvStrCpy(
      uint8_t  *pDES,
      const uint8_t  *pSRC
);

extern  uint32_t
prvStrLen(
      const   uint8_t  *pSRC
);

extern   uint8_t
prvStrCmp(
      const   uint8_t  *string1,
      const   uint8_t  *string2
);

extern  uint8_t*
StrUpr(
      uint8_t  *string
);

extern  int prvAtoi(
	 const char * s
);

extern   char * prvStrStr(
	 const char * str1, 
	 const char * str2
);

extern  char* prvStrtok(
	 char *str, 
	 const char* delim
);





 
static inline char _tolower(const char c)
{
    return c | 0x20;
}

 
static inline int isodigit(const char c)
{
    return c >= '0' && c <= '7';
}
#line 108 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\strproc.h"

#line 167 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\rtl_lib\\memproc.h"







 






 
extern  void *_memset( void *s, int c, SIZE_T n );
extern  void *_memcpy( void *s1, const void *s2, SIZE_T n );
extern  int _memcmp( const void *av, const void *bv, SIZE_T len );



#line 168 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\std_lib\\include\\rtl_lib.h"




 
 








extern int __rtl_errno;


void init_rom_libgloss_ram_map(void);






extern int rtl_printf( const char* fmt, ...);
extern int rtl_vprintf(const char *fmt, va_list ap);
extern int rtl_sprintf(char* str, const char* fmt, ...);
extern int rtl_snprintf(char* str, size_t size, const char* fmt, ...);
extern int rtl_vsnprintf(char *str, size_t size, const char *fmt, va_list ap);





extern void * rtl_memchr(const void * src_void , int c , size_t length);
extern int rtl_memcmp(const void * m1 , const void * m2 , size_t n);
extern void * rtl_memcpy(void * dst0 , const void * src0 , size_t len0);
extern void * rtl_memmove( void * dst_void , const void * src_void , size_t length);
extern void * rtl_memset(void * m , int c , size_t n);
extern char * rtl_strcat(char * s1 , const char * s2);
extern char * rtl_strchr(const char *s1 , int i);
extern int rtl_strcmp(const char *s1 ,	const char *s2);
extern char* rtl_strcpy(char *dst0 , const char *src0);
extern size_t rtl_strlen(const char *str);
extern char * rtl_strncat(char * s1 , const char * s2 , size_t n);
extern int rtl_strncmp(const char *s1 , const char *s2 , size_t n);
extern char * rtl_strncpy(char * dst0 , const char * src0 , size_t count);
extern char * rtl_strstr(const char *searchee , const char *lookfor);
extern char * rtl_strsep(char **source_ptr , const char *delim);
extern char * rtl_strtok(char * s , const char * delim);






extern double rtl_fabs(double);
extern float rtl_fabsf(float a);
extern float rtl_cos_f32(float a);
extern float rtl_sin_f32(float a);

extern float rtl_fadd(float a, float b);
extern float rtl_fsub(float a, float b);
extern float rtl_fmul(float a, float b);
extern float rtl_fdiv(float a, float b);

extern int rtl_fcmplt(float a, float b);
extern int rtl_fcmpgt(float a, float b);








extern double rtl_ftod(float f);

extern double rtl_ddiv(double a, double b);






typedef union
{
  float value;
  uint32_t 	word;
} ieee_float_shape_type;

 

#line 100 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\std_lib\\include\\rtl_lib.h"

 

#line 109 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\std_lib\\include\\rtl_lib.h"

static inline
float rtl_nanf(void)
{
	float x;

	do { ieee_float_shape_type sf_u; sf_u . word = (0x7fc00000); (x) = sf_u . value; } while (0);
	return x;
}






extern int rtl_sscanf_patch_test(void);
extern int rtl_lib_test( uint16_t argc,  uint8_t *argv[]);
extern int rtl_math_test( uint16_t argc,  uint8_t *argv[]);
extern int rtl_string_test( uint16_t argc,  uint8_t *argv[]);
















#line 171 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\std_lib\\libc\\rom\\string\\rom_libc_string.h"




 





#line 27 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\soc\\realtek\\8711b\\swlib\\std_lib\\libc\\rom\\string\\rom_libc_string.h"





extern  void * __rtl_memchr_v1_00(const void * src_void , int c , size_t length);
extern  int __rtl_memcmp_v1_00(const void * m1 , const void * m2 , size_t n);
extern  void * __rtl_memcpy_v1_00(void *  dst0 , const void *  src0 , size_t len0);
extern  void * __rtl_memmove_v1_00( void * dst_void , const void * src_void , size_t length);
extern  void * __rtl_memset_v1_00(void * m , int c , size_t n);
extern  char * __rtl_strcat_v1_00(char * s1 , const char * s2);
extern  char * __rtl_strchr_v1_00(const char *s1 , int i);
extern  int __rtl_strcmp_v1_00(const char *s1 ,	const char *s2);
extern  char* __rtl_strcpy_v1_00(char *dst0 , const char *src0);
extern  size_t __rtl_strlen_v1_00(const char *str);
extern  char * __rtl_strncat_v1_00(char * s1 , const char * s2 , size_t n);
extern  int __rtl_strncmp_v1_00(const char *s1 , const char *s2 , size_t n);
extern  char * __rtl_strncpy_v1_00(char * dst0 , const char * src0 , size_t count);
extern  char * __rtl_strstr_v1_00(const char *searchee , const char *lookfor);
extern  char * __rtl_strsep_v1_00(register char **source_ptr , register const char *delim);
extern  char * __rtl_strtok_v1_00(register char * s , register const char * delim);

#line 172 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"


#line 196 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"
	
#line 218 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"
	
#line 227 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"
	



	
#line 240 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"
	
	
	






extern void *pvPortMalloc( size_t xWantedSize );
extern void vPortFree( void *pv );
#line 259 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\common\\api\\platform/platform_stdlib.h"


#line 10 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\common\\example\\get_beacon_frame\\example_get_beacon_frame.c"
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\FreeRTOS.h"































































 






 
#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stddef.h"
 
 
#line 39 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stddef.h"

#line 49 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stddef.h"





 
#line 73 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\FreeRTOS.h"













 
#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdint.h"
 
 
#line 235 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdint.h"

#line 258 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdint.h"




 
#line 88 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\FreeRTOS.h"





 
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\FreeRTOSConfig.h"


































































 

#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdint.h"
 
 
#line 235 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdint.h"

#line 258 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\stdint.h"




 
#line 73 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\FreeRTOSConfig.h"
extern uint32_t SystemCoreClock; 
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\inc\\platform_autoconf.h"


 




 



 








 
#line 32 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\inc\\platform_autoconf.h"



 
#line 42 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\inc\\platform_autoconf.h"



 
#line 52 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\inc\\platform_autoconf.h"



 
#line 62 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\inc\\platform_autoconf.h"



 





 





 





 





 





 





 





 





 





 





 




 





 







 





 






 





 




 




 




 







 




 




 




 






 




 




 




 




 








 
#line 76 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\FreeRTOSConfig.h"











 

#line 108 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\FreeRTOSConfig.h"






#line 127 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\FreeRTOSConfig.h"







extern void freertos_pre_sleep_processing(unsigned int *expected_idle_time);
extern void freertos_post_sleep_processing(unsigned int *expected_idle_time);
extern int  freertos_ready_to_sleep();

 


 


 




 






                                                        



 





 
#line 176 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\FreeRTOSConfig.h"

 
#line 184 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\inc\\FreeRTOSConfig.h"



 





 




 


 





#line 95 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\FreeRTOS.h"

 
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\projdefs.h"































































 







 
typedef void (*TaskFunction_t)( void * );

 










 








#line 98 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\FreeRTOS.h"

 
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\portable.h"































































 



 







 










































































































































































#line 254 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\portable.h"

#line 262 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\portable.h"







#line 276 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\portable.h"











































 
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\portable\\IAR\\ARM_CM4F\\portmacro.h"































































 

















 

 
#line 92 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\portable\\IAR\\ARM_CM4F\\portmacro.h"

typedef uint32_t StackType_t;
typedef long BaseType_t;
typedef unsigned long UBaseType_t;





	typedef uint32_t TickType_t;


 

 



 

 
extern void vPortYield( void );





 

 






	 




	 



	 

#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\intrinsics.h"








 




#line 1 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"
 
 

 


  #pragma system_include







 























 






#line 67 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\ycheck.h"

#line 15 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\intrinsics.h"


  #pragma system_include




 









#pragma language=save
#pragma language=extended

__intrinsic __nounwind void    __no_operation(void);

__intrinsic __nounwind void    __disable_interrupt(void);
__intrinsic __nounwind void    __enable_interrupt(void);

typedef unsigned long __istate_t;

__intrinsic __nounwind __istate_t __get_interrupt_state(void);
__intrinsic __nounwind void __set_interrupt_state(__istate_t);



 
__intrinsic __nounwind unsigned long __get_PSR( void );
__intrinsic __nounwind unsigned long __get_IPSR( void );
__intrinsic __nounwind unsigned long __get_MSP( void );
__intrinsic __nounwind void          __set_MSP( unsigned long );
__intrinsic __nounwind unsigned long __get_PSP( void );
__intrinsic __nounwind void          __set_PSP( unsigned long );
__intrinsic __nounwind unsigned long __get_PRIMASK( void );
__intrinsic __nounwind void          __set_PRIMASK( unsigned long );
__intrinsic __nounwind unsigned long __get_CONTROL( void );
__intrinsic __nounwind void          __set_CONTROL( unsigned long );



 
__intrinsic __nounwind unsigned long __get_FAULTMASK( void );
__intrinsic __nounwind void          __set_FAULTMASK(unsigned long);
__intrinsic __nounwind unsigned long __get_BASEPRI( void );
__intrinsic __nounwind void          __set_BASEPRI( unsigned long );

#line 74 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\intrinsics.h"

__intrinsic __nounwind void __disable_fiq(void);
__intrinsic __nounwind void __enable_fiq(void);


 

__intrinsic __nounwind unsigned long __SWP( unsigned long, volatile unsigned long * );
__intrinsic __nounwind unsigned char __SWPB( unsigned char, volatile unsigned char * );

typedef unsigned long __ul;





 
__intrinsic __nounwind void          __MCR( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1, __ul src,
                                 unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );
__intrinsic __nounwind unsigned long __MRC( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1,
                                 unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );
__intrinsic __nounwind void          __MCR2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1, __ul src,
                                  unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );
__intrinsic __nounwind unsigned long __MRC2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1,
                                  unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 );

 
__intrinsic __nounwind void __LDC( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src);
__intrinsic __nounwind void __LDCL( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src);
__intrinsic __nounwind void __LDC2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src);
__intrinsic __nounwind void __LDC2L( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src);

 
__intrinsic __nounwind void __STC( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst);
__intrinsic __nounwind void __STCL( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst);
__intrinsic __nounwind void __STC2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst);
__intrinsic __nounwind void __STC2L( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst);

 
__intrinsic __nounwind void __LDC_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src,
                              unsigned __constrange(0,255) option);

__intrinsic __nounwind void __LDCL_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __LDC2_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __LDC2L_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul const *src,
                                unsigned __constrange(0,255) option);

 
__intrinsic __nounwind void __STC_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst,
                              unsigned __constrange(0,255) option);

__intrinsic __nounwind void __STCL_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __STC2_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __STC2L_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __ul *dst,
                                unsigned __constrange(0,255) option);


 
__intrinsic __nounwind unsigned long __get_APSR( void );
__intrinsic __nounwind void          __set_APSR( unsigned long );






 
__intrinsic __nounwind unsigned long __get_FPSCR( void );
__intrinsic __nounwind void __set_FPSCR( unsigned long );

 
__intrinsic __nounwind unsigned char __CLZ( unsigned long );

 

__intrinsic __nounwind signed long __QADD( signed long, signed long );
__intrinsic __nounwind signed long __QDADD( signed long, signed long );
__intrinsic __nounwind signed long __QSUB( signed long, signed long );
__intrinsic __nounwind signed long __QDSUB( signed long, signed long );

__intrinsic __nounwind signed long __QDOUBLE( signed long );

__intrinsic __nounwind int         __QFlag( void );
__intrinsic __nounwind void __reset_Q_flag( void );


__intrinsic __nounwind int         __QCFlag( void );
__intrinsic __nounwind void __reset_QC_flag( void );

__intrinsic __nounwind signed long __SMUL( signed short, signed short );

 
__intrinsic __nounwind unsigned long __REV( unsigned long );
__intrinsic __nounwind signed long __REVSH( short );

__intrinsic __nounwind unsigned long __REV16( unsigned long );
__intrinsic __nounwind unsigned long __RBIT( unsigned long );

__intrinsic __nounwind unsigned char  __LDREXB( volatile unsigned char const * );
__intrinsic __nounwind unsigned short __LDREXH( volatile unsigned short const * );
__intrinsic __nounwind unsigned long  __LDREX ( volatile unsigned long const * );
__intrinsic __nounwind unsigned long long __LDREXD( volatile unsigned long long const * );

__intrinsic __nounwind unsigned long  __STREXB( unsigned char, volatile unsigned char * );
__intrinsic __nounwind unsigned long  __STREXH( unsigned short, volatile unsigned short * );
__intrinsic __nounwind unsigned long  __STREX ( unsigned long, volatile unsigned long * );
__intrinsic __nounwind unsigned long  __STREXD( unsigned long long, volatile unsigned long long * );

__intrinsic __nounwind void __CLREX( void );

__intrinsic __nounwind void __SEV( void );
__intrinsic __nounwind void __WFE( void );
__intrinsic __nounwind void __WFI( void );
__intrinsic __nounwind void __YIELD( void );

__intrinsic __nounwind void __PLI( volatile void const * );
__intrinsic __nounwind void __PLD( volatile void const * );
__intrinsic __nounwind void __PLDW( volatile void const * );

__intrinsic __nounwind   signed long __SSAT     (unsigned long val,
                                      unsigned int __constrange( 1, 32 ) sat );
__intrinsic __nounwind unsigned long __USAT     (unsigned long val,
                                      unsigned int __constrange( 0, 31 ) sat );




 
__intrinsic __nounwind unsigned long __SEL( unsigned long op1, unsigned long op2 );

__intrinsic __nounwind unsigned long __SADD8    (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __SADD16   (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __SSUB8    (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __SSUB16   (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __SADDSUBX (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __SSUBADDX (unsigned long pair1, unsigned long pair2);

__intrinsic __nounwind unsigned long __SHADD8   (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __SHADD16  (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __SHSUB8   (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __SHSUB16  (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __SHADDSUBX(unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __SHSUBADDX(unsigned long pair1, unsigned long pair2);

__intrinsic __nounwind unsigned long __QADD8    (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __QADD16   (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __QSUB8    (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __QSUB16   (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __QADDSUBX (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __QSUBADDX (unsigned long pair1, unsigned long pair2);

__intrinsic __nounwind unsigned long __UADD8    (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __UADD16   (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __USUB8    (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __USUB16   (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __UADDSUBX (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __USUBADDX (unsigned long pair1, unsigned long pair2);

__intrinsic __nounwind unsigned long __UHADD8   (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __UHADD16  (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __UHSUB8   (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __UHSUB16  (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __UHADDSUBX(unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __UHSUBADDX(unsigned long pair1, unsigned long pair2);

__intrinsic __nounwind unsigned long __UQADD8   (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __UQADD16  (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __UQSUB8   (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __UQSUB16  (unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __UQADDSUBX(unsigned long pair1, unsigned long pair2);
__intrinsic __nounwind unsigned long __UQSUBADDX(unsigned long pair1, unsigned long pair2);

__intrinsic __nounwind unsigned long __USAD8(unsigned long x, unsigned long y );
__intrinsic __nounwind unsigned long __USADA8(unsigned long x, unsigned long y,
                                   unsigned long acc );

__intrinsic __nounwind unsigned long __SSAT16   (unsigned long pair,
                                      unsigned int __constrange( 1, 16 ) sat );
__intrinsic __nounwind unsigned long __USAT16   (unsigned long pair,
                                      unsigned int __constrange( 0, 15 ) sat );

__intrinsic __nounwind long __SMUAD (unsigned long x, unsigned long y);
__intrinsic __nounwind long __SMUSD (unsigned long x, unsigned long y);
__intrinsic __nounwind long __SMUADX(unsigned long x, unsigned long y);
__intrinsic __nounwind long __SMUSDX(unsigned long x, unsigned long y);

__intrinsic __nounwind long __SMLAD (unsigned long x, unsigned long y, long sum);
__intrinsic __nounwind long __SMLSD (unsigned long x, unsigned long y, long sum);
__intrinsic __nounwind long __SMLADX(unsigned long x, unsigned long y, long sum);
__intrinsic __nounwind long __SMLSDX(unsigned long x, unsigned long y, long sum);

__intrinsic __nounwind long long __SMLALD (unsigned long pair1,
                                 unsigned long pair2,
                                 long long acc);

__intrinsic __nounwind long long __SMLALDX(unsigned long pair1,
                                 unsigned long pair2,
                                 long long acc);

__intrinsic __nounwind long long __SMLSLD (unsigned long pair1,
                                 unsigned long pair2,
                                 long long acc);

__intrinsic __nounwind long long __SMLSLDX(unsigned long pair1,
                                 unsigned long pair2,
                                 long long acc);

__intrinsic __nounwind unsigned long __PKHBT(unsigned long x,
                                  unsigned long y,
                                  unsigned __constrange(0,31) count);
__intrinsic __nounwind unsigned long __PKHTB(unsigned long x,
                                  unsigned long y,
                                  unsigned __constrange(0,32) count);

__intrinsic __nounwind long __SMLABB(unsigned long x, unsigned long y, long acc);
__intrinsic __nounwind long __SMLABT(unsigned long x, unsigned long y, long acc);
__intrinsic __nounwind long __SMLATB(unsigned long x, unsigned long y, long acc);
__intrinsic __nounwind long __SMLATT(unsigned long x, unsigned long y, long acc);

__intrinsic __nounwind long __SMLAWB(long x, unsigned long y, long acc);
__intrinsic __nounwind long __SMLAWT(long x, unsigned long y, long acc);

__intrinsic __nounwind long __SMMLA (long x, long y, long acc);
__intrinsic __nounwind long __SMMLAR(long x, long y, long acc);
__intrinsic __nounwind long __SMMLS (long x, long y, long acc);
__intrinsic __nounwind long __SMMLSR(long x, long y, long acc);

__intrinsic __nounwind long __SMMUL (long x, long y);
__intrinsic __nounwind long __SMMULR(long x, long y);

__intrinsic __nounwind long __SMULBB(unsigned long x, unsigned long y);
__intrinsic __nounwind long __SMULBT(unsigned long x, unsigned long y);
__intrinsic __nounwind long __SMULTB(unsigned long x, unsigned long y);
__intrinsic __nounwind long __SMULTT(unsigned long x, unsigned long y);

__intrinsic __nounwind long __SMULWB(long x, unsigned long y);
__intrinsic __nounwind long __SMULWT(long x, unsigned long y);

__intrinsic __nounwind long __SXTAB (long x, unsigned long y);
__intrinsic __nounwind long __SXTAH (long x, unsigned long y);
__intrinsic __nounwind unsigned long __UXTAB (unsigned long x, unsigned long y);
__intrinsic __nounwind unsigned long __UXTAH (unsigned long x, unsigned long y);

__intrinsic __nounwind unsigned long long __UMAAL(unsigned long x,
                                       unsigned long y,
                                       unsigned long a,
                                       unsigned long b);

__intrinsic __nounwind long long __SMLALBB(unsigned long x,
                                 unsigned long y,
                                 long long acc);

__intrinsic __nounwind long long __SMLALBT(unsigned long x,
                                 unsigned long y,
                                 long long acc);

__intrinsic __nounwind long long __SMLALTB(unsigned long x,
                                 unsigned long y,
                                 long long acc);

__intrinsic __nounwind long long __SMLALTT(unsigned long x,
                                 unsigned long y,
                                 long long acc);

__intrinsic __nounwind unsigned long __UXTB16(unsigned long x);
__intrinsic __nounwind unsigned long __UXTAB16(unsigned long acc, unsigned long x);

__intrinsic __nounwind unsigned long __SXTB16(unsigned long x);
__intrinsic __nounwind unsigned long __SXTAB16(unsigned long acc, unsigned long x);







 

#line 366 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\intrinsics.h"

#line 374 "D:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 7.0\\arm\\inc\\c\\intrinsics.h"

 
__intrinsic __nounwind void __DMB(void);
__intrinsic __nounwind void __DSB(void);
__intrinsic __nounwind void __ISB(void);




#pragma language=restore





#line 140 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\portable\\IAR\\ARM_CM4F\\portmacro.h"



 

 
extern void vPortEnterCritical( void );
extern void vPortExitCritical( void );
extern uint32_t ulPortSetInterruptMask( void );
extern void vPortClearInterruptMask( uint32_t ulNewMask );

#line 157 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\portable\\IAR\\ARM_CM4F\\portmacro.h"
 

 

	extern void vPortSuppressTicksAndSleep( TickType_t xExpectedIdleTime );



 



 


 






 




 
#pragma diag_suppress=Pe191
#pragma diag_suppress=Pa082







#line 322 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\portable.h"






























#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\mpu_wrappers.h"































































 





 
#line 144 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\mpu_wrappers.h"










#line 353 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\portable.h"






 



	StackType_t *pxPortInitialiseStack( StackType_t *pxTopOfStack, TaskFunction_t pxCode, void *pvParameters ) ;


 
typedef struct HeapRegion
{
	uint8_t *pucStartAddress;
	size_t xSizeInBytes;
} HeapRegion_t;











 
void vPortDefineHeapRegions( const HeapRegion_t * const pxHeapRegions );




 
void *pvPortMalloc( size_t xSize ) ;
void vPortFree( void *pv ) ;
void vPortInitialiseBlocks( void ) ;
size_t xPortGetFreeHeapSize( void ) ;
size_t xPortGetMinimumEverFreeHeapSize( void ) ;




 
BaseType_t xPortStartScheduler( void ) ;





 
void vPortEndScheduler( void ) ;







 











#line 101 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\FreeRTOS.h"





 















































































































































#line 256 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\FreeRTOS.h"

 


























































 

	
 




	
 




	
 




	
 














	
 




	



 




	


 




	


 




	


 







 





























































































































































































































#line 633 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\FreeRTOS.h"






























































































 




#line 748 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\FreeRTOS.h"

	
 












#line 11 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\common\\example\\get_beacon_frame\\example_get_beacon_frame.c"
#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\task.h"































































 









#line 1 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\list.h"































































 



























 
































 









 
struct xLIST_ITEM
{
	 TickType_t xItemValue;			 
	struct xLIST_ITEM *  pxNext;		 
	struct xLIST_ITEM *  pxPrevious;	 
	void * pvOwner;										 
	void *  pvContainer;				 
};
typedef struct xLIST_ITEM ListItem_t;					 

struct xMINI_LIST_ITEM
{
	 TickType_t xItemValue;
	struct xLIST_ITEM *  pxNext;
	struct xLIST_ITEM *  pxPrevious;
};
typedef struct xMINI_LIST_ITEM MiniListItem_t;



 
typedef struct xLIST
{
	 UBaseType_t uxNumberOfItems;
	ListItem_t *  pxIndex;		 
	MiniListItem_t xListEnd;						 
} List_t;







 








 








 









 








 







 







 







 








 




 





















 
#line 280 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\list.h"

















 










 







 






 











 
void vListInitialise( List_t * const pxList );









 
void vListInitialiseItem( ListItem_t * const pxItem );











 
void vListInsert( List_t * const pxList, ListItem_t * const pxNewListItem );



















 
void vListInsertEnd( List_t * const pxList, ListItem_t * const pxNewListItem );













 
UBaseType_t uxListRemove( ListItem_t * const pxItemToRemove );







#line 75 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\task.h"







 















 
typedef void * TaskHandle_t;




 
typedef BaseType_t (*TaskHookFunction_t)( void * );

 
typedef enum
{
	eRunning = 0,	 
	eReady,			 
	eBlocked,		 
	eSuspended,		 
	eDeleted		 
} eTaskState;



 
typedef struct xTIME_OUT
{
	BaseType_t xOverflowCount;
	TickType_t  xTimeOnEntering;
} TimeOut_t;



 
typedef struct xMEMORY_REGION
{
	void *pvBaseAddress;
	uint32_t ulLengthInBytes;
	uint32_t ulParameters;
} MemoryRegion_t;



 
typedef struct xTASK_PARAMETERS
{
	TaskFunction_t pvTaskCode;
	const char * const pcName;	 
	uint16_t usStackDepth;
	void *pvParameters;
	UBaseType_t uxPriority;
	StackType_t *puxStackBuffer;
	MemoryRegion_t xRegions[ 1 ];
} TaskParameters_t;


 
typedef struct xTASK_STATUS
{
	TaskHandle_t xHandle;			 
	const char *pcTaskName;			   
	UBaseType_t xTaskNumber;		 
	eTaskState eCurrentState;		 
	UBaseType_t uxCurrentPriority;	 
	UBaseType_t uxBasePriority;		 
	uint32_t ulRunTimeCounter;		 



	uint16_t usStackHighWaterMark;	 
} TaskStatus_t;

 
typedef enum
{
	eAbortSleep = 0,		 
	eStandardSleep,			 
	eNoTasksWaitingTimeout	 
} eSleepModeStatus;






 









 













 













 









 









 




 







 
















































































 




































































 















































 
void vTaskAllocateMPURegions( TaskHandle_t xTask, const MemoryRegion_t * const pxRegions ) ;







































 
void vTaskDelete( TaskHandle_t xTaskToDelete ) ;



 














































 
void vTaskDelay( const TickType_t xTicksToDelay ) ;

























































 
void vTaskDelayUntil( TickType_t * const pxPreviousWakeTime, const TickType_t xTimeIncrement ) ;













































 
UBaseType_t uxTaskPriorityGet( TaskHandle_t xTask ) ;
















 
eTaskState eTaskGetState( TaskHandle_t xTask ) ;








































 
void vTaskPrioritySet( TaskHandle_t xTask, UBaseType_t uxNewPriority ) ;

















































 
void vTaskSuspend( TaskHandle_t xTaskToSuspend ) ;















































 
void vTaskResume( TaskHandle_t xTaskToResume ) ;



























 
BaseType_t xTaskResumeFromISR( TaskHandle_t xTaskToResume ) ;



 



























 
void vTaskStartScheduler( void ) ;






















































 
void vTaskEndScheduler( void ) ;

















































 
void vTaskSuspendAll( void ) ;




















































 
BaseType_t xTaskResumeAll( void ) ;



 









 
TickType_t xTaskGetTickCount( void ) ;














 
TickType_t xTaskGetTickCountFromISR( void ) ;












 
UBaseType_t uxTaskGetNumberOfTasks( void ) ;












 
char *pcTaskGetTaskName( TaskHandle_t xTaskToQuery ) ;  



















 
UBaseType_t uxTaskGetStackHighWaterMark( TaskHandle_t xTask ) ;






 
#line 1141 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\project\\zairkiss\\EWARM-RELEASE\\..\\..\\..\\component\\os\\freertos\\freertos_v8.1.2\\Source\\include\\task.h"











 
BaseType_t xTaskCallApplicationTaskHook( TaskHandle_t xTask, void *pvParameter ) ;







 
TaskHandle_t xTaskGetIdleTaskHandle( void );

































































































 
UBaseType_t uxTaskGetSystemState( TaskStatus_t * const pxTaskStatusArray, const UBaseType_t uxArraySize, uint32_t * const pulTotalRunTime );













































 
void vTaskList( char * pcWriteBuffer ) ;  




















































 
void vTaskGetRunTimeStats( char *pcWriteBuffer ) ;  



 















 
BaseType_t xTaskIncrementTick( void ) ;































 
void vTaskPlaceOnEventList( List_t * const pxEventList, const TickType_t xTicksToWait ) ;
void vTaskPlaceOnUnorderedEventList( List_t * pxEventList, const TickType_t xItemValue, const TickType_t xTicksToWait ) ;











 
void vTaskPlaceOnEventListRestricted( List_t * const pxEventList, const TickType_t xTicksToWait ) ;
























 
BaseType_t xTaskRemoveFromEventList( const List_t * const pxEventList ) ;
BaseType_t xTaskRemoveFromUnorderedEventList( ListItem_t * pxEventListItem, const TickType_t xItemValue ) ;








 
void vTaskSwitchContext( void ) ;




 
TickType_t uxTaskResetEventItemValue( void ) ;



 
TaskHandle_t xTaskGetCurrentTaskHandle( void ) ;



 
void vTaskSetTimeOutState( TimeOut_t * const pxTimeOut ) ;




 
BaseType_t xTaskCheckForTimeOut( TimeOut_t * const pxTimeOut, TickType_t * const pxTicksToWait ) ;




 
void vTaskMissedYield( void ) ;




 
BaseType_t xTaskGetSchedulerState( void ) ;




 
void vTaskPriorityInherit( TaskHandle_t const pxMutexHolder ) ;




 
BaseType_t xTaskPriorityDisinherit( TaskHandle_t const pxMutexHolder ) ;




 
BaseType_t xTaskGenericCreate( TaskFunction_t pxTaskCode, const char * const pcName, const uint16_t usStackDepth, void * const pvParameters, UBaseType_t uxPriority, TaskHandle_t * const pxCreatedTask, StackType_t * const puxStackBuffer, const MemoryRegion_t * const xRegions ) ;  



 
UBaseType_t uxTaskGetTaskNumber( TaskHandle_t xTask ) ;




 
void vTaskSetTaskNumber( TaskHandle_t xTask, const UBaseType_t uxHandle ) ;








 
void vTaskStepTick( const TickType_t xTicksToJump ) ;














 
eSleepModeStatus eTaskConfirmSleepModeStatus( void ) ;




 
void *pvTaskIncrementMutexHeldCount( void );








#line 12 "F:\\RTLworkSpace\\00009982-sdk-ameba-v4.0c\\sdk-ameba-v4.0c\\component\\common\\example\\get_beacon_frame\\example_get_beacon_frame.c"

typedef int (*get_beacon_frame_func_ptr)(BEACON_INFO_T beacon_frame);
extern get_beacon_frame_func_ptr get_beacon_frame_callback;

int get_beacon_frame_func(BEACON_INFO_T beacon_frame)
{
	rtl_printf("\nbeacon frame_ctl   = %02x %02x\n",beacon_frame.frame_ctl[0],beacon_frame.frame_ctl[1]);
	rtl_printf("\nbeacon duration_id = %02x %02x\n",beacon_frame.duration_id[0],beacon_frame.duration_id[1]);
	rtl_printf("\nbeacon addr1       = %02x:%02x:%02x:%02x:%02x:%02x\n",		beacon_frame.addr1[0],beacon_frame.addr1[1],beacon_frame.addr1[2],beacon_frame.addr1[3],beacon_frame.addr1[4],beacon_frame.addr1[5]);

	rtl_printf("\nbeacon addr2       = %02x:%02x:%02x:%02x:%02x:%02x\n",		beacon_frame.addr2[0],beacon_frame.addr2[1],beacon_frame.addr2[2],beacon_frame.addr2[3],beacon_frame.addr2[4],beacon_frame.addr2[5]);

	rtl_printf("\nbeacon addr3       = %02x:%02x:%02x:%02x:%02x:%02x\n",		beacon_frame.addr3[0],beacon_frame.addr3[1],beacon_frame.addr3[2],beacon_frame.addr3[3],beacon_frame.addr3[4],beacon_frame.addr3[5]);

	rtl_printf("\nbeacon seq_ctl     = %02x %02x\n",beacon_frame.seq_ctl[0],beacon_frame.seq_ctl[1]);
	rtl_printf("\nbeacon timestamp   = %02x %02x %02x %02x %02x %02x %02x %02x\n",		beacon_frame.timestamp[0],beacon_frame.timestamp[1],beacon_frame.timestamp[2],beacon_frame.timestamp[3],beacon_frame.timestamp[4],beacon_frame.timestamp[5],beacon_frame.timestamp[6],beacon_frame.timestamp[7]);


	return 0;
}

void get_beacon_frame_thread(void *param)
{
    vTaskDelay(10000);
    
	get_beacon_frame_callback = get_beacon_frame_func;
	vTaskDelete(0);
	return;
}

void example_get_beacon_frame(void)
{
    if(xTaskGenericCreate( ( get_beacon_frame_thread ), ( ((const char*)"get_beacon_frame_thread") ), ( 256 ), ( 0 ), ( ( ( UBaseType_t ) 0U ) ), ( 0 ), ( 0 ), ( 0 ) ) != ( ( ( BaseType_t ) 1 ) ))
        rtl_printf("\n\r%s xTaskCreate(get_beacon_frame_thread) failed", __FUNCTION__);
    return;
}
