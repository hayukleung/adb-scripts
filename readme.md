# Scripts for ADB usage

## 前提

1. 配置 ADB 环境变量
2. 安装了 grep、awk（MacOS\Linux 一般都自带，Windows 用户请使用 Bash Shell）

## 命令解析

|command|description|
|:--:|:--:|
|abi|查看 CPU 架构|
|browser|系统浏览器打开|
|db|查看指定包名、数据库名、表名下的数据库表内容|
|devices||
|exportAPK|导出当前页面对应的 APK 安装包|
|gfxinfo|查看当前页面的渲染情况|
|home|跳转桌面|
|input|键盘输入|
|sadb|带设备选择功能的 adb|
|screencap|截图并导出指定目录|
|screenrecord|开始录制屏幕|
|screenrecordExport|录屏文件导出指定目录|
|screensize|屏幕尺寸|
|settings|跳转系统设置页面|
|shell|可选择目标设备的 adb -s shell 封装|
|showCurrentActivity|查看当前页面的 activity 类名|
|showCurrentPackageName|查看当前页面对应的包名|
|version|查看当前页面对应 APK version name|

## May Help You

https://apk.support/download-app/com.aefyr.sai

这个 app 可以将谷歌商店拆分的 apk 合并一起安装