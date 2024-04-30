#!/usr/bin/env bash

export PROJECT_DIR=/llmft/llmft
source $PROJECT_DIR/scripts/misc/setup.sh

# args: task_name, max_train_samples, epochs, warmup_ratio, bsz, num_gpus, learning_rate, model_name_or_path, port
bash $PROJECT_DIR/scripts/pattern_verbalizer_ft/mnli/run.sh mnli 16 3 0.5 4 1 1e-5 facebook/opt-125m 60000


