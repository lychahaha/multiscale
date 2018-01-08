#!/bin/bash
# Where the pre-trained InceptionV3 checkpoint is saved to.
PRETRAINED_CHECKPOINT_DIR=/home/yuanziyi/checkpoints
# Where the training (fine-tuned) checkpoint and logs will be saved to.
TRAIN_DIR=/home/yuanziyi/checkpoints/inception_v3
# Where the dataset is saved to.
DATASET_DIR=/home/yuanziyi/Market-1501
# WHere the log is saved to
LOG_DIR=/home/yuanziyi/log
# Wher the tfrecord file is save to
OUTPUT_DIR=/home/yuanziyi/Market-1501-tfrecord/query
python ../get_feature/get_probe_features.py \
--learning_rate=2e-3 \
--learning_rate_decay_type=fixed \
--dataset_name=Market_1501 \
--dataset_split_name=train \
--dataset_dir=${OUTPUT_DIR} \
--model_name=inception_v3 \
--batch_size=8 \
--max_number_of_steps=10001 \
--checkpoint_dir=${TRAIN_DIR} \
--pretrain_path=${PRETRAINED_CHECKPOINT_DIR}/inception_v3.ckpt \
--log_dir=${LOG_DIR} \
--save_model_summary_secs=6 \
--log_every_n_steps=5 \
--optimizer=adam \
--adam_beta1=0.5 \
--adam_beta2=0.999 \
--weight_decay=0.00004
