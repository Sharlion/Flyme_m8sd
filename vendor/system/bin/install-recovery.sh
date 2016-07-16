#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 15685632 8d7edf7759f3df8c5c840fb551101c3704610609 10795008 aba166985dd3c1c9014a941cdbe4348c5e2291d3
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:15685632:8d7edf7759f3df8c5c840fb551101c3704610609; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:10795008:aba166985dd3c1c9014a941cdbe4348c5e2291d3 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 8d7edf7759f3df8c5c840fb551101c3704610609 15685632 aba166985dd3c1c9014a941cdbe4348c5e2291d3:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
