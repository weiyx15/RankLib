#!/bin/bash
# evaluate on Yahoo! learning to rank dataset
YAHOO_ROOT="/repository/weiyx/Yahoo"
METHODS=("std" "mul")

for DATA_IDX in {1..2}; do
    mkdir -p "./outputs/Yahoo/${DATA_IDX}"
    for METHOD in ${METHODS[@]}; do
        nohup java -jar RankLib-2.13_${METHOD}.jar -train $YAHOO_ROOT/set${DATA_IDX}.train.txt -test $YAHOO_ROOT/set${DATA_IDX}.test.txt -validate $YAHOO_ROOT/set${DATA_IDX}.valid.txt -ranker 6 -metric2t NDCG@10 -missingZero -save outputs/Yahoo/${DATA_IDX}/lambda_${METHOD}.txt > Yahoo_lambda_${METHOD}_${DATA_IDX}.log 2>&1 &
    done
    wait
done



