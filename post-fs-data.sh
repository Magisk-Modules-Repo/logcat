#!/system/bin/sh
MODDIR=${0%/*}

lc_ver="v18"
lc_vercode=18

msg[0]="Now just a little more only just a little more..."
msg[1]="It's not a right that I'm due, my duty that is must have been kept..."
msg[2]="Since one day you will disappear, I'll keep every part of you..."
msg[3]="Yes we are time fliers scaling the walls of time climbers, tired of playing hide and seek with time..."
msg[4]="Wherever you are in the world, I'll search for you..."
msg[5]="Mitsuha. Mitsuha. Mitsuha, your name is Mitsuha..."
msg[6]="Someone dear to me. I don't want to forget. I shouldn't forget!"

time=$(date +%Y-%m-%d-%H-%M-%S)

android_sdk=`getprop ro.build.version.sdk`
build_desc=`getprop ro.build.description`
product=`getprop ro.build.product`
manufacturer=`getprop ro.product.manufacturer`
brand=`getprop ro.product.brand`
fingerprint=`getprop ro.build.fingerprint`
arch=`getprop ro.product.cpu.abi`
device=`getprop ro.product.device`
android=`getprop ro.build.version.release`
build=`getprop ro.build.id`

path=/data/local/boot
file=$path/boot-$time.log
num=$(($RANDOM+100000000))
rand=$(($num%7))
mkdir -p $path
rm -rf $file
touch $file
echo "--------- beginning of head">>$file
echo "Log Catcher by MlgmXyysd">>$file
echo "Version: ${lc_ver} (${lc_vercode})">>$file
echo ${msg[$rand]}>>$file
echo "--------- beginning of system info">>$file
echo "Android version: ${android}">>$file
echo "Android sdk: ${android_sdk}">>$file
echo "Android build: ${build}">>$file
echo "Fingerprint: ${fingerprint}">>$file
echo "ROM build description: ${build_desc}">>$file
echo "Architecture: ${arch}">>$file
echo "Device: ${device}">>$file
echo "Manufacturer: ${manufacturer}">>$file
echo "Brand: ${brand}">>$file
echo "Product: ${product}">>$file
logcat -f $file -v long *:V logcatcher-boot-mlgmxyysd:S &

path_err=/data/local/boot_error
file_err=$path_err/error-$time.log
num_err=$(($RANDOM+100000000))
rand_err=$(($num%7))
mkdir -p $path_err
rm -rf $file_err
touch $file_err
echo "--------- beginning of head">>$file_err
echo "Log Catcher by MlgmXyysd">>$file_err
echo "Version: ${lc_ver} (${lc_vercode}) (Error log)">>$file_err
echo ${msg[$rand_err]}>>$file_err
echo "--------- beginning of system info">>$file_err
echo "Android version: ${android}">>$file_err
echo "Android sdk: ${android_sdk}">>$file_err
echo "Android build: ${build}">>$file_err
echo "Fingerprint: ${fingerprint}">>$file_err
echo "ROM build description: ${build_desc}">>$file_err
echo "Architecture: ${arch}">>$file_err
echo "Device: ${device}">>$file_err
echo "Manufacturer: ${manufacturer}">>$file_err
echo "Brand: ${brand}">>$file_err
echo "Product: ${product}">>$file_err
logcat -f $file_err -v long *:W logcatcher-boot-error-mlgmxyysd:S &
