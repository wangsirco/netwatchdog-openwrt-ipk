#!/bin/sh

# 可根据泰国本地优化此项
TEST_IP="8.8.8.8"
WAN_INTERFACE="wan"
FAILED_COUNT=0
MAX_FAILED=3
SLEEP_TIME=60
ENABLED=$(uci get netwatchdog.@main[0].enabled 2>/dev/null)

[ "$ENABLED" = "1" ] || exit 0

while true; do
  ping -c 3 -W 2 $TEST_IP >/dev/null
  if [ $? -eq 0 ]; then
    FAILED_COUNT=0
  else
    FAILED_COUNT=$((FAILED_COUNT+1))
    if [ $FAILED_COUNT -ge $MAX_FAILED ]; then
      logger "[NETWATCHDOG] 网络不通，自动重启接口$WAN_INTERFACE"
      /sbin/ifdown $WAN_INTERFACE
      sleep 2
      /sbin/ifup $WAN_INTERFACE
      FAILED_COUNT=0
    fi
  fi
  sleep $SLEEP_TIME
done
