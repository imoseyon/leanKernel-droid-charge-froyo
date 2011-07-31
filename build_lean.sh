CPU_JOB_NUM=2
TOOLCHAIN=/usr/bin/
TOOLCHAIN_PREFIX=arm-linux-gnueabi-
OPT=0

if test $2; then
  OPT=$2
fi
if [ $OPT -eq 3 ]; then
  sed -i /CONFIG_TUN/d .config
  sed -i /CONFIG_CIFS/d .config
  echo "### DO NOT CTRL-C ####"
fi

#sed -i s/CONFIG_LOCALVERSION=\"-imoseyon-.*\"/CONFIG_LOCALVERSION=\"-imoseyon-${2}\"/ .config
#make ARCH=arm leancharge_defconfig
#make -j$CPU_JOB_NUM ARCH=arm CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX 1>/tmp/compile.log
rm usr/*.o usr/*.lzma

# non-voodoo kernel
if [ $OPT -eq 2 ]; then
  touch initramfs_root.voodoo/imoseyon.novoodoo
else 
  # just in case
  rm -f initramfs_root.voodoo/imoseyon.novoodoo
fi

make -j$CPU_JOB_NUM ARCH=arm CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX 
if [ $OPT -eq 3 ]; then
  sed -i /CONFIG_TUN/d .config
  sed -i /CONFIG_CIFS/d .config
fi
if [ $OPT -eq 2 ]; then
  rm -f initramfs._root.voodoo/imoseyon.novoodoo
fi
cp arch/arm/boot/zImage ../zip/kernel_update
cp .config arch/arm/configs/leancharge_defconfig
cd ../zip
rm *.zip
if [ $OPT -eq 2 ]; then
  zip -r imoseyon_leanKernel_novoodoo_$1.zip *
else 
  zip -r imoseyon_leanKernel_voodoo_$1.zip *
fi
rm /tmp/*.zip
cp *.zip /tmp
