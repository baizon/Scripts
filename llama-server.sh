#!/bin/sh

# --- CONFIG ---------------------------------------------------
MODEL="unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:Q4_K_XL"
CONTEXT_SIZE=64384
PORT=9931
# --------------------------------------------------------------

if ! command -v llama-server >/dev/null 2>&1; then
    echo "Error: llama-server command not found."
    echo "Please ensure llama.cpp is installed and in your PATH."
    exit 1
fi

llama-server \
    -hf $MODEL \
    -ot ".ffn_.*_exps.=CPU" \
    --jinja \
    --ctx-size $CONTEXT_SIZE \
    --n-gpu-layers 99 \
    --temp 0.7 \
    --min-p 0.0 \
    --top-p 0.8 \
    --top-k 20 \
    --repeat-penalty 1.05 \
    --port $PORT
