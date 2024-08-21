#!/bin/bash
set -e

pwd=quan
# 106.64[20-40] 26.62[20-60]
longitude=106.64
latitude=26.62
lngBegin=20
lngEnd=40
latBegin=20
latEnd=60


randomNum() {
    begin=$1
    end=$2
    echo $((RANDOM % (end - begin + 1) + begin))
}

# 随机生成经纬度后缀
lngVal=$(randomNum "$lngBegin" "$lngEnd")
latVal=$(randomNum "$latBegin" "$latEnd")

# 组装经纬度
longitude=${longitude}${lngVal}
latitude=${latitude}${latVal}
echo "random-gps: $longitude $latitude"
echo

echo "$pwd" | sudo -S ./change_ios_position.sh $longitude $latitude

#pgrep -f simulate-location | xargs kill -9

