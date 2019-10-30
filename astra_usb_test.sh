############
#!/bin/bash#
###r00_Hx###
#
CLEAR="CLEAR ALL!"
#
STORY='history_usb' # All usb info
PFILES='pathpiles1' # All path in log usb files
#
func_search () # Funcion output info log usb
{
echo "______SKAN:______" && dmesg | grep -i "usb"
grep -ril 'usb' /var/log > $PFILES
echo "Files skan:" && cat $PFILES
  while read FILE; do
    echo "$FILE" >> $STORY
    cat $FILE | grep -i 'usb' >> $STORY
done < $PFILES
cat $PFILES
}
#
func_delete () # Funcion delete logs USB
{
  for path in $PFILES
    do
      grep '' $path | sed '/usb/d' | sed '/USB/d' > data.backup
      cp data.backup $path; rm data.backup
      echo $CLEAR
done
}
func_only_clear () # Funcion deleting infomation a file
{
echo 'Enter the file:' && read file;
grep '' $file | sed '/usb/d' | sed '/USB/d' > data.backup;
cp data.backup $file; rm data.backup
echo $CLEAR
}
func_help () # Help
{
echo
echo "|The script that searches for and removes usb logs."
echo "|./uhk [command]"
echo "|command:" 
echo "|-a: Delete infomation the logs."
echo "|-c: Delete only the file of infomation USB."
echo "|-h: Call of help."
echo "|-s: Search usb infomation logs." 
echo "|__________________________________________________"
echo "|______________r00_Hx__version:0.20________________"
}
#
while [ -n "$1" ]
do
case "$1" in 
-p) func_search ;;
-a) func_delete ;;
-s) func_only_clear ;;
-h) func_help ;;
*) echo "Error, please enter ./astra_usb_test -h" ;;
esac
shift
done
