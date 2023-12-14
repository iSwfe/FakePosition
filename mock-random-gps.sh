#!/bin/bash
set -e

pwd=quan
# 26.578[100-560] 106.736[360-460]
latitude=26.578
longitude=106.736
latBegin=100
latEnd=560
lngBegin=360
lngEnd=460


randomNum() {
    begin=$1
    end=$2
    echo $((RANDOM % (end - begin + 1) + begin))
}

# 随机生成经纬度后缀
latVal=$(randomNum "$latBegin" "$latEnd")
lngVal=$(randomNum "$lngBegin" "$lngEnd")

latitude=${latitude}${latVal}
longitude=${longitude}${lngVal}
echo "random-gps: $latitude $longitude"
echo

echo "$pwd" | sudo -S ./change_ios_position.sh $latitude $longitude

#pgrep -f simulate-location | xargs kill -9

