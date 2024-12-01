#!/usr/bin/env python3
import subprocess
import openai
import sys
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv(dotenv_path="/")

def get_directory_structure(path="."):
    try:
        # Ensure the provided path exists and is a directory
        if not os.path.isdir(path):
            return f"Error: The specified path '{path}' is not a valid directory."

        # Run the tree command with the correct path
        result = subprocess.run(["tree", path], capture_output=True, text=True, check=True)
        return result.stdout
    except FileNotFoundError:
        return "Error: The 'tree' command is not available. Please install it and try again."
    except subprocess.CalledProcessError as e:
        return f"Error running 'tree': {e.stderr.strip()}"


def analyze_directory_structure(directory_structure):
    openai.api_key = os.getenv("OPENAI_API_KEY")  # Load API key from .env
    if not openai.api_key:
        return "Error: OpenAI API key not found. Ensure it is set in the .env file as OPENAI_API_KEY."
    
    prompt = (
        "The following is the directory structure of a file system. "
        "Please explain how the files and directories are organized:\n\n"
        f"{directory_structure}"
    )
    try:
        response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",
            prompt=prompt,
            max_tokens=500,
        )
        return response.choices[0].text.strip()
    except Exception as e:
        return f"Error communicating with OpenAI API: {e}"

def main():
    if len(sys.argv) < 2:
        print("Usage: mansplain <directory-path>")
        sys.exit(1)
    path = sys.argv[1]
    directory_structure = get_directory_structure(path)
    if "Error" in directory_structure:
        print(directory_structure)
        return
    print("Directory structure retrieved successfully:")
    print(directory_structure)
    
    explanation = analyze_directory_structure(directory_structure)
    print("\nExplanation of the directory structure:")
    print(explanation)

if __name__ == "__main__":
    main()
