# Context Distillation Fine-tuning vs. In-context Learning

## Daniyar Magazov, Karis Courey, Shrey Shivaiah, Pranav Chebolu


## Abstract

Large Language Models (LLMs) excel in reasoning and knowledge extraction, in part due to in-context learning (ICL). While ICL allows for learning during inference from multiple examples, its challenges include high memory consumption due to long context, necessitating the investigation of alternative methods. This project explored context distillation (CD), which involves fine-tuning models by leveraging KL divergence, for natural language inference (NLI) as an alternative to ICL. In-domain and out-of-domain accuracy, execution time, and memory requirements were used to compare CD and ICL. Findings suggest that CD is a promising method for efficient LLM learning, with potential applications in tasks such as long dialogue conversations, question answering from large PDF files, and code autocompletion.

# This repo

This repository allows to finetune (large) decoder-only language models. Currently, the following models and fine-tuning approaches are supported.

**Models**:
- [facebook/opt-125m](https://huggingface.co/facebook/opt-125m)


**Fine-tuning approaches**:
- Context Distillation Pattern-based fine-tuning (PBFT) leveraging the pre-trained language modeling head for classification.



## Setup

1. Create docker image: 
    
        docker build -f ./docker/Dockerfile \
            --build-arg USER_UID=$UID \
            --build-arg USER_NAME=$(id -un) \
            -t llmft:22.08-py3 .

Depending on your NVIDIA CUDA and NVIDIA driver version you will have to change the `FROM nvcr.io/nvidia/pytorch:22.08-py3` line of the Docker [file](docker/Dockerfile). You can find the correct version [here](https://docs.nvidia.com/deeplearning/frameworks/support-matrix/index.html#framework-matrix-2022).

2. Create docker container:

        docker run -it --rm --gpus=all --pid=host --ipc=host --user <username> \
            -v <path/to/llmft>:/llmft \
            -v <path/to/datasets>:/datasets \
            -v <path/to/logfiles>:/logfiles \
            -v /<path/to/.cache>:/cache \
            llmft:22.08-py3

Make sure to replace `<username>`, `</path/to/llmft>`, etc.
