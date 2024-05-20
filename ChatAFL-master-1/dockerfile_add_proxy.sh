#!/bin/bash
###
 # @Author: 颖 吴 syhx2021@outlook.com
 # @Date: 2024-03-24 21:26:53
 # @LastEditors: 颖 吴 syhx2021@outlook.com
 # @LastEditTime: 2024-03-24 21:53:21
 # @FilePath: \ChatAFL-master\dockerfile_add_proxy.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

set -e
# 遍历subjects目录下的所有二级目录
for dir in benchmark/subjects/*/*; do
    # 如果这个目录下有Dockerfile文件
    if [ -f "$dir/Dockerfile" ]; then
        # 如果Dockerfile文件中没有包含要添加的内容
        if ! grep -q "ALL_PROXY" "$dir/Dockerfile"; then
            echo "$dir/Dockerfile"
            # sed -i '' 's/^    export ALL_PROXY/    ALL_PROXY/g' "$dir/Dockerfile"
            # sed -i '' 's/^    ALL_PROXY=http/    ALL_PROXY=socks5/g' "$dir/Dockerfile"
            #sed -i '' 's/^    git clone/    ALL_PROXY=socks5:\/\/chenyanjiao:7ec18d1dd@124.156.134.117:7080    git clone/g' "$dir/Dockerfile"
            sed -i 's/^    git clone/    ALL_PROXY=socks5:\/\/chenyanjiao:7ec18d1dd@124.156.134.117:7080    git clone/g' "$dir/Dockerfile"
        fi
    fi
done

