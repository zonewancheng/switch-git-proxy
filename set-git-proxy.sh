#!/bin/bash

# 检查是否传入参数
if [[ $# -eq 0 ]]; then
    echo "请提供参数：on（开启代理）或 off（关闭代理）"
    exit 1
fi

# 清除所有现有的代理设置
git config --global --unset http.proxy
git config --global --unset https.proxy
git config --global --unset ftp.proxy
git config --global --unset all.proxy
echo "清除了所有现有的代理配置"


# 获取参数
ACTION=$1

# 设置代理
if [[ $ACTION == "on" ]]; then
    # 为 GitHub 设置代理
    git config --global remote.origin.proxy "127.0.0.1:7777"
    git config --global http.proxy "127.0.0.1:7777"
    git config --global https.proxy "127.0.0.1:7777"
    echo "代理已开启：GitHub 使用 127.0.0.1:7777"

# 清除代理
elif [[ $ACTION == "off" ]]; then
    # 清除所有代理配置
    git config --global --unset remote.origin.proxy
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    echo "代理已关闭: GitLab内部可使用"

# 无效参数处理
else
    echo "无效参数：请提供 on（开启代理）或 off（关闭代理）"
    exit 1
fi

