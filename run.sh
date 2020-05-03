METHOD=$1
DATA_INDEX=$2

DATA_DIR=/home/weiyuxuan/data/MSLR-WEB10K/Fold${DATA_INDEX}

java -jar RankLib-2.13_${METHOD}.jar -train $DATA_DIR/train.txt -test $DATA_DIR/test.txt -validate $DATA_DIR/vali.txt -ranker 6 -metric2t NDCG@10 -save outputs/lambda_${METHOD}_${DATA_INDEX}.txt
