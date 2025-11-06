#!/bin/bash

# go to directory of command
# cd "$(dirname "$0")"

# 函数: print_usage
# 说明: 打印脚本使用方法与示例
print_usage() {
    echo "> 用法: $(basename "$0") <输出目录>"
    echo "> 示例: $(basename "$0") ./screencaps"
}

# 函数: validate_args
# 说明: 校验入参数目；不满足时报错并提示正确调用示例
validate_args() {
    # 支持查看帮助
    if [ "${1-}" = "-h" ] || [ "${1-}" = "--help" ]; then
        print_usage
        exit 0
    fi

    if [ "$#" -ne 1 ]; then
        echo "> 参数错误: 需要 1 个参数（输出目录）"
        print_usage
        exit 1
    fi
}

# 先校验入参
validate_args "$@"

# 函数: timestamp
# 说明: 返回当前时间戳，格式 yyMMdd_HHmmss，用于生成截图文件名
timestamp() {
    date +"%y%m%d_%H%M%S"
}

# 函数: save_screencap
# 参数: $1 输出目录, $2 设备序列号
# 说明: 检查输出目录，生成包含设备ID与时间戳的文件名，并保存截图
save_screencap() {
    local out_dir="$1"
    local device_id="$2"
    if [ ! -d "$out_dir" ]; then
        mkdir -p "$out_dir"
    fi
    local filename="${device_id}_$(timestamp).png"
    adb -s "$device_id" exec-out screencap -p > "$out_dir/$filename"
    echo "> saved: $out_dir/$filename"
}

devices=$(adb devices | grep -E 'device$' | awk -F ' ' '{print $1}')

echo "> choose your device: "
echo ""
 
select opt in $devices "exit"; do
    case $opt in
    "exit")
        echo ""
        echo "> exit"
        break
        ;;
    *)
        if [ -z $opt ]; then
            echo ""
            echo "> unknown option $REPLY"
            break
        fi
        echo ""
        echo "> you choose the device: $opt"
        
        # 将截图保存为时间戳文件名：$opt_yyMMdd_HHmmss.png
        save_screencap "$1" "$opt"

        # adb -s "$opt" shell screencap -p sdcard/screen.png
        # if [ ! -d $1 ]; then
        #     mkdir -p $1
        # fi
        # adb -s "$opt" pull sdcard/screen.png $1 
        break
        ;;    
    esac
done
