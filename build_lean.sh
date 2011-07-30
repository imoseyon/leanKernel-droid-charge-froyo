CPU_JOB_NUM=2
TOOLCHAIN=/usr/bin/
TOOLCHAIN_PREFIX=arm-linux-gnueabi-

if [ $1 -eq 3 ]; then
  OPT=1
  sed -i /CONFIG_TUN/d .config
  sed -i /CONFIG_CIFS/d .config
  echo "### DO NOT CTRL-C ####"
else
  OPT=$1
fi

#sed -i s/CONFIG_LOCALVERSION=\"-imoseyon-.*\"/CONFIG_LOCALVERSION=\"-imoseyon-${2}\"/ .config
#sed -i "s_define SLEVEL.*_define SLEVEL ${OPT}_" arch/arm/mach-msm/acpuclock-7x30.c
#make ARCH=arm leancharge_defconfig
#make -j$CPU_JOB_NUM ARCH=arm CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX 1>/tmp/compile.log
rm usr/*.o usr/*.lzma
make -j$CPU_JOB_NUM ARCH=arm CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX 
if [ $1 -eq 3 ]; then
  sed -i /CONFIG_TUN/d .config
  sed -i /CONFIG_CIFS/d .config
fi
cp arch/arm/boot/zImage ../zip
cp .config arch/arm/configs/leancharge_defconfig
cd ../zip
rm *.zip
zip -r imoseyon_leanKernel_voodoo_$2.zip *
cp *.zip /tmp
