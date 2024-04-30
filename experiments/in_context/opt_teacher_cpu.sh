#!/usr/bin/env bash

export PROJECT_DIR=.
source $PROJECT_DIR/scripts/misc/setup_colab_daniyar.sh

# -----------------------------------------------------------------------------------------------------------------------
# run ICL experiments for MNLI
# -----------------------------------------------------------------------------------------------------------------------

export NCCL_DEBUG=INFO

export DS_VERBOSE=1
export CUDA_VISIBLE_DEVICES=0
export USE_TF=0
export PYTHONPATH=.

bash $PROJECT_DIR/scripts/in_context/mnli/run_teacher_outputs_cpu.sh mnli 16 facebook/opt-125m 1 60000
