#!/usr/bin/env bash

OUTPUT_DIR=./logfiles/in_context_eval
mkdir -p $OUTPUT_DIR

# args: task_name, num_shots, model_name_or_path, gpu, port

task_name=$1
num_shots=$2
model_name_or_path=$3
gpu=$4
port=$5

# gpt-3 format (for mnli):

# --pattern "{text1} question: {text2} Yes or No?" \
# --target_prefix " answer: " \
# --target_tokens "ĠYes,ĠNo" \
# --separate_shots_by "\n\n" \
# --group "gpt-3" \

# minimal format:

# --pattern "{text1} {text2} ?" \
# --target_prefix " " \
# --target_tokens "ĠYes,ĠNo" \
# --separate_shots_by "\n\n" \
# --group "minimal" \

# eval-harness format (for mnli):

# --pattern "{text1} \nQuestion: {text2} True or False?" \
# --target_prefix "\nAnswer: " \
# --target_tokens "ĠTrue,ĠFalse" \
# --separate_shots_by "\n\n" \
# --group "eval-harness" \

for data_seed in 0 
do
    python $PROJECT_DIR/teacher_outputs.py \
        --model_name_or_path $model_name_or_path \
        --cache_dir $HF_MODELS_CACHE \
        --task_name $task_name \
        --pattern "{text1} {text2} ?" \
        --target_prefix " " \
        --target_tokens "ĠYes,ĠNo" \
        --separate_shots_by "\n\n" \
        --group "minimal" \
        --dataset_cache_dir $HF_DATASETS_CACHE \
        --max_seq_length 2048 \
        --output_dir $OUTPUT_DIR \
        --do_eval  \
        --eval_task_name "hans" \
        --per_device_eval_batch_size 10 \
        --num_shots $num_shots \
        --balanced \
        --shuffle \
        --seed 0 \
        --data_seed $data_seed \
        --report_to "none" \
	--max_train_samples 64 \
	--max_eval_samples 21 \
	--task_description "Entailment Detection Task: For each pair of sentences, classify whether the first sentence entails the second. Label as 'GYes' for entailment and 'GNo' otherwise. First, examples are provided, decide on the last pair only." \

done