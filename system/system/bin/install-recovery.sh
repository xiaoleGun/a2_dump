#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:16777216:e8adc3247e96185bd85faead0463d585d1a376a9; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:16777216:fb653154261efb23c7dd97cf189475ea711e1557 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:16777216:e8adc3247e96185bd85faead0463d585d1a376a9 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
