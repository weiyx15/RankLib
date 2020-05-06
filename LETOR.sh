#!/bin/bash
# evaluate on LETOR4.0 dataset
LETOR_ROOT="/repository/weiyx/LETOR4"
METHODS=("std" "mul")
DATA_NAMES=("MQ2007" "MQ2008" "MQ2007-list" "MQ2008-list")

function fold_learn()
{
    local DATA_NAME=$1
    for IDX in {1..5}; do
        for METHOD in ${METHODS[@]}; do
            DATA_DIR=${LETOR_ROOT}/${DATA_NAME}/Fold${IDX}
            nohup java -jar RankLib-2.13_${METHOD}.jar -train $DATA_DIR/train.txt -test $DATA_DIR/test.txt -validate $DATA_DIR/vali.txt -ranker 6 -metric2t NDCG@10 -save outputs/LETOR4/${DATA_NAME}/lambda_${METHOD}_${IDX}.txt > LETOR4_lambda_${METHOD}_${DATA_NAME}_${IDX}.log 2>&1 &
        done
    done
    wait
}

for DATA_NAME in ${DATA_NAMES[@]}; do
    mkdir -p "./outputs/LETOR4/${DATA_NAME}"
    fold_learn $DATA_NAME
done



