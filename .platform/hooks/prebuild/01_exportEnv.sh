#!/bin/bash
# 以前は環境変数ファイルを見に行ったが、プラットフォーム変更により消えていたため
# echo "export \$(sudo cat /opt/elasticbeanstalk/deployment/env)" >> ~/.bashrc
JSON=`/opt/elasticbeanstalk/bin/get-config environment`
KEYS=$(echo $JSON | jq -r 'keys[] as $k | "\($k)=\(.[$k])"')
i=0
for e in ${KEYS[@]}; do
    # キーと値を分割する
    arr=(`echo "${e}" | tr -s '=' ' '`)
    ENVSTR="export "${arr[0]}=${arr[1]}""
    if grep "$ENVSTR" ~/.bashrc >/dev/null; then
        echo exists.
    else
        echo $ENVSTR >> ~/.bashrc
    fi
    let i++
done

