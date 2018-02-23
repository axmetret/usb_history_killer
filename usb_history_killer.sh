############
#!/bin/bash#
###r00_Hx###
#
#Path usb log
#
LOG1='/etc/log.d/conf/logfiles/kernel.conf'
LOG2='/var/log/messages'
LOG3='/var/log/dmesg'
LOG4='/var/log/kernel'
LOG5='/var/log'
LOG6='/etc/log.d'
#
CLEAR="CLEAR ALL!"
#
func_search () #Funcion search USB logs 
 {
   echo 'Log:'$LOG5
   grep -ril 'usb' $LOG5 || echo $CLEAR
   
   echo 'Log:'$LOG6 
   grep -ril 'usb' $LOG6 || echo $CLEAR
 }

func_delete () #Funcion delete logs USB
 {
  for path in $LOG1 $LOG2 $LOG3 $LOG4
   do
    grep '' -I -i  $path | sed '/usb/d' |  sed '/USB/d' > $path
   done
 }

func_only_clear () #Funcion deleting infomation a file
 {
  echo 'Enter the file:' && read file
  grep '' -I -i $file | sed '/usb/d' | sed '/USB/d' > $file
  echo $CLEAR 
 }

func_help () #Help
 {
  echo
  echo "||||||||||||||||||||||||||||||||||||||||||||||||||||"
  echo "|The script that searches for and removes usb logs.|"
  echo "|./uhk [command]                                   |"
  echo "|command:                                          |" 
  echo "|-c: Delete infomation the logs.                   |"
  echo "|-s: Search usb infomation logs.                   |" 
  echo "|-h: Call of help.                                 |"
  echo "|--clear: Delete only the file of infomation USB.  |"
  echo "|__________________________________________________|"
  echo "|______________r00_Hx__version:0.01________________|"
  echo "||||||||||||||||||||||||||||||||||||||||||||||||||||"
  echo
 }
#
while [ -n "$1" ]
 do
  case "$1" in 
   -s) func_search ;;
   -c) func_delete ;;
   -h) func_help ;;
   --clear) func_only_clear ;;
   *) echo "Error, pleas enter ./uhk -h" ;;
  esac
 shift
done
