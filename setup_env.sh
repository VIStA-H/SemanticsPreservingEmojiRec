#!/bin/bash

# Check if conda is installed
if ! command -v conda &> /dev/null
then
    echo "Conda could not be found. Please install Conda first."
    exit 1
fi

# Create a new conda environment
ENV_NAME="emoji_recommendation"  # Name of the conda environment
echo "Creating conda environment '$ENV_NAME'..."
conda create -y -n $ENV_NAME python=3.10  # Specify your Python version here
echo "Environment '$ENV_NAME' created."

# Activate the conda environment
echo "Activating the environment..."
source $(conda info --base)/etc/profile.d/conda.sh
conda activate $ENV_NAME

# Install dependencies from requirements.txt
echo "Installing dependencies..."
if [ -f requirements.txt ]; then
    pip install -r requirements.txt
else
    echo "requirements.txt not found. Please ensure it exists in the current directory."
    exit 1
fi

echo "Environment setup complete. Activate it using 'conda activate $ENV_NAME'."
