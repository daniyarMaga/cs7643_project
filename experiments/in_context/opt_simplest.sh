#!/usr/bin/env bash


export PROJECT_DIR=/Users/magazov-d/Documents/omscs/cs7643_dl/llmft
source $PROJECT_DIR/scripts/misc/setup.sh

# -----------------------------------------------------------------------------------------------------------------------
# run ICL experiments for MNLI
# -----------------------------------------------------------------------------------------------------------------------

export NCCL_DEBUG=INFO

bash $PROJECT_DIR/scripts/in_context/mnli/run_minimal_simplest.sh mnli 2 facebook/opt-125m 1 60000
