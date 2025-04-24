# Terraform
This repository is designed as a practical resource for mastering Terraform through hands-on exercises and experiential learning.

Here are the concise step-by-step setup guide for Terraform on Windows which, needs to be followed before proceeding with hands-on:

## Terraform Setup on Windows

### Prerequisites
- A Windows machine (Windows 10 or later recommended)
- [Git for Windows](https://git-scm.com/) installed (optional, for managing repository files)

### Step 1: Install Terraform
1. **Download Terraform**  
   Visit the [Terraform Downloads page](https://www.terraform.io/downloads.html) and download the Windows version of Terraform.

2. **Extract Terraform**  
   - Extract the downloaded ZIP file.
   - Place the extracted `terraform.exe` in a directory of your choice (e.g., `C:\Terraform`).

### Step 2: Add Terraform to the System Path
1. Press `Win + S`, search for "Environment Variables," and select "Edit the system environment variables."
2. In the System Properties window, click "Environment Variables."
3. Under "System variables," select `Path` and click "Edit."
4. Click "New" and add the path to the directory where `terraform.exe` is located (e.g., `C:\Terraform`).
5. Click "OK" to save changes.

### Step 3: Verify the Installation
1. Open a Command Prompt (`Win + R`, type `cmd`, and hit Enter).
2. Run the following command:
   ```
   terraform --version
   ```
   You should see the installed version of Terraform displayed.

### Step 4: Initialize a Terraform Project
1. Create a new directory for your project:
   ```
   mkdir MyTerraformProject
   cd MyTerraformProject
   ```
2. Create a new Terraform configuration file (`main.tf`) and define your infrastructure resources.
3. Initialize Terraform in the project directory:
   ```
   terraform init
   ```

### Step 5: Run Terraform Commands
- **Validate configuration:**  
  ```
  terraform validate
  ```
- **Plan infrastructure changes:**  
  ```
  terraform plan
  ```
- **Apply changes:**  
  ```
  terraform apply
  ```
- **Destroy infrastructure:**  
  ```
  terraform destroy
  ```
