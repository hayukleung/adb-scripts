# Scripts for ADB usage

## 前提

1. 配置 ADB 环境变量
2. 安装了 grep、awk（MacOS\Linux 一般都自带，Windows 用户请使用 Bash Shell）

## 命令解析

|command|description|
|:--:|:--:|
|abi|查看 CPU 架构|
|devices|可选择目标设备的 adb -s 封装|
|exportAPK|导出当前页面对应的 APK 安装包|
|gfxinfo|查看当前页面的渲染情况|
|home|跳转桌面|
|shell|可选择目标设备的 adb -s shell 封装|
|showCurrentActivity|查看当前页面的 activity 类名|
|showCurrentPackageName|查看当前页面对应的包名|

## May Help You

https://apk.support/download-app/com.aefyr.sai

这个 app 可以将谷歌商店拆分的 apk 合并一起安装