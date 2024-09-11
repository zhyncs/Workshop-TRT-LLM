#!/bin/bash

# Set the API key
export BASETEN_API_KEY=***

# Define the base URL and tokenizer for convenience
MODEL_URL="***"
TOKENIZER="meta-llama/Meta-Llama-3.1-8B-Instruct"

# Function to run the load.py script with given parameters
run_load() {
    concurrency=$1
    input_len=$2
    output_len=$3
    echo "Running with concurrency=$concurrency, input_len=$input_len, output_len=$output_len"
    python3 load.py --model_base_url $MODEL_URL --hf_tokenizer $TOKENIZER --concurrency $concurrency --input_len $input_len --output_len $output_len
}

# Run commands with different configurations
# Concurrency variations with fixed input and output lengths
for concurrency in 1 8 16 32; do
    run_load $concurrency 100 100
    run_load $concurrency 100 1000
    run_load $concurrency 1000 100
    run_load $concurrency 1000 1000
done

echo "All commands have been executed."
