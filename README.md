# Mansplain Directory Structure

`Mansplain` is a Python script that generates a directory structure using the `tree` command and analyzes it using OpenAI's API to provide a detailed explanation of how the files and directories are organized.
It assumes a modular structure but prompts can be modified to adapt to any style of folder structuring

## Features
- **Directory Visualization**: Uses the `tree` command to create a visual representation of the directory structure.
- **AI-Powered Analysis**: Sends the directory structure to OpenAI's API (e.g., GPT-3.5-turbo or GPT-4) for analysis and explanation.
- **Customizable Prompt**: The prompt used for analysis can be customized for different use cases.

---

## Prerequisites

1. **Python**: Ensure Python 3.7 or higher is installed.
2. **Dependencies**:
   - `openai`
   - `python-dotenv`
3. **Tree Command**:
   - Install the `tree` command on your system:
     - **Linux**: `sudo apt install tree`
     - **macOS**: `brew install tree`
     - **Windows**: Install through a package manager or use Git Bash.

---

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/mansplain.git
cd mansplain
```

### 2. Create a Virtual Environment
```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: .\venv\Scripts\activate
```

### 3. Install Dependencies
```bash
pip install -r requirements.pip
```

### 4. Set Up the `.env` File
Create a `.env` file in the project directory and add your OpenAI API key:
```plaintext
OPENAI_API_KEY=your_openai_api_key
```

---

## Deployment as a CLI Tool

You can set up the script as a global command (`mansplain`):

1. Run the setup script:
   ```bash
   bash setup.sh
   ```

2. Use it as a command:
   ```bash
   mansplain /path/to/directory
   ```

---

## Example Output

**Directory Structure**:
```
.
├── file1.txt
├── folder1
│   └── file2.txt
└── folder2
    ├── file3.txt
    └── folder3
        └── file4.txt
```

**AI Explanation**:
```
This directory contains a main folder with several subfolders. 
- "folder1" contains a single file, "file2.txt".
- "folder2" contains two items: "file3.txt" and another folder, "folder3".
- "folder3" itself contains "file4.txt".
The structure appears to group related files into subfolders for better organization.
```

---

## Troubleshooting

### Common Issues
1. **API Key Not Found**:
   Ensure the `.env` file is correctly set up and contains your OpenAI API key.

2. **Tree Command Not Found**:
   Install the `tree` command as per your operating system's instructions.

3. **Model Deprecation Error**:
   Ensure you are using a supported model (`gpt-3.5-turbo` or `gpt-4`).

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

## Contributing

Feel free to fork the repository and submit pull requests for improvements or bug fixes.

---

## Acknowledgments

- [OpenAI API](https://platform.openai.com/)
- [Python Dotenv](https://pypi.org/project/python-dotenv/)
- [Tree Command](https://linux.die.net/man/1/tree)

--- 

This `README.md` provides all the necessary details for users to set up, use, and contribute to your project.
