#!/bin/bash

# 检查是否提供了足够的参数
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <Package Name> <SQLite Database File> <Table Name> <Export Directory>"
    exit 1
fi

packageName=$1
dbName=$2
tableName=$3
exportPath=$4

if [ ! -d $exportPath ]; then
    mkdir -p $exportPath
fi

sadb pull /data/data/$packageName/databases/$dbName.db $exportPath

# 从参数中获取数据库文件路径和表名
dbFile="$exportPath/$dbName.db"

# 检查数据库文件是否存在
if [ ! -f "$dbFile" ]; then
    echo "Error: Database file '$dbFile' does not exist."
    exit 1
fi

# 使用 SQLite 命令行工具查询表内容并打印到终端
echo ""
echo "Printing the contents of table '$tableName' from the database '$dbFile':\n"
echo ""
file="$exportPath/${packageName}_${dbName}_${tableName}.txt"
sqlite3 "$dbFile" "SELECT * FROM $tableName;" > $file
cat $file

# 脚本结束