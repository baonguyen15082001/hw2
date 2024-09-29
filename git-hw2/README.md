[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/Qi-xoNla)
# Setup a cross-compilation environment 

This assignment is for students to get familiar with the GitHub classroom and cross-compilation environment so they can work on the programming assignments without difficulty. Follow the procedure shown below to understand a typical code development environment and workflow in conjunction with a GitHub repository. 

## Install command line environment (essentially Linux)
We will use Linux command line for programming ARM assembly, including editing, compiling, loading, etc. For this purpose, it is required to install required software depending on your host machine (e.g., laptop or desktop). 

### Windows users
It is recommended to use WSL2 (Windows Subsystem for Linux). You can install everything you need to run WSL with a single command. Open PowerShell or Windows Command Prompt in **administrator** mode by right-clicking and selecting "Run as administrator" and entering the following.
```
wsl --install
```

This command will install the default Linux distribution (Ubuntu).
For more details on how to install Linux on Windows, please visit https://learn.microsoft.com/en-us/windows/wsl/install. 

### Mac and Linux users
You are all set for this step as both OSes already have a Terminal, where you can use Linux command lines. For the Mac users, however, it is recommended to install Homebrew, the missing package manager for macOS (or Linux), by enter the following in Terminal.
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

For more details on Homebrew, please visit https://brew.sh/.

## Install Git
The programming assignment will be available through Git Classroom. Git is the most commonly used version control system, which may come already installed with the installation of the command line environment on your system. You can check whether Git is installed and the executable is in the PATH environment, using `which` command. If it is installed on your system, it will show the location of the installed git as shown below, which indicates that git is located on `/usr/bin/git` in your laptop.
```
$ which git
/usr/bin/git
```

For additional help on `which`, please visit https://www.geeksforgeeks.org/which-command-in-linux-with-examples/. 

If it is not installed by default, you may want to install it (or update in case you want to use the latest version if it is already installed).

To install Git under WSL (Windows users), enter the following command in the Linux command line prompt:
```
sudo apt-get install git
```

For Mac users, enter the following command in Terminal:
```
brew install git
```

You may want to use `which` to confirm the installation or update is properly done.

## Git config file setup
It is required to set up your Git config file in order to upload (push) your submission to the repository. To set up it, open a command line for the environment you're working in and set your name with the following command (replacing "Your Name" with your preferred username):
```
git config --global user.name "Your Name"
```

Also, set your email with the following command (replacing "yourmail@domain.com" with the email you prefer):
```
git config --global user.email "youremail@domain.com"
```

For additional help on git on WSL, please visit https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-git. 


## Install ARM GNU Toolchain
ARM GNU toolchain is an open-source pre-built GNU compiler toolchain, including assembler, for ARM-based CPUs. 

Visit https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads and download the correct toolchain variant that suits your host systems (Linux, Windows, or macOS). For Mac users, there is a separate binary for Intel-based and Apple silicon-based (like M1). Make sure to download the correct version. 
For the target, download the latest version for `arm-non-eabi`, not `arm-non-linux-gnueabihf` or `aarch64-non-elf`, etc. For example, for Windows users, download arm-gnu-toolchain-13.3.rel1-mingw-w64-i686-arm-none-eabi.exe. For Mac users with Apple silicon, download arm-gnu-toolchain-13.3.rel1-darwin-arm64-arm-none-eabi.pkg. 

Once installed, make sure the location (path) of the installed binary (e.g., `arm-non-eabi-ar`) is included in the `$PATH` environment. For example, on macOS, the installed ARM GNU toolchain is located in `/Applications/ArmGNUToolchain/13.3.rel1/arm-none-eabi/bin` (replacing the correct location depending on your OS). You can add this to `$PATH` using the following command line.
```
export PATH=/Applications/ArmGNUToolchain/13.3.rel1/arm-none-eabi/bin:$PATH
```

You may want to use `which` to verify the toolchain is properly installed.
```
$ which arm-none-eabi-as
/Applications/ArmGNUToolchain/13.3.rel1/arm-none-eabi/bin/arm-none-eabi-as
```

## Testing your compilation and uploading the output to the repository

### Clone your respository in GitHub
Open a Terminal and enter the following command to clone your remote repository.
```
git clone YOUR_REPO_URL
```

Replace `YOUR_REPO_URL` with your private repository this assignment. To find it, go to the main page of your GitHub repository and click green button, labeled `<> Code`. From the dropdown menu, you can find the URL for the assignment, which should look like `hw2-XXX`, where `XXX` is your GitHub ID. 

`git clone` might ask your credidential, and if you enabled `Two-factor authentification`, you have to generate Access Tokens and use it for the password field.

### Compile the provided template code

Make change the folder to the cloned directory.
```
cd hw2-XXX
```

Make sure the cloned folder has the template assembly.
```
$ ls
basic-template-ARM.S
```

Then compile and generate the binary (.elf) and hex for it using the following commands.
```
$ arm-none-eabi-as basic-template-ARM.S -o basic-template-ARM.o​
$ arm-none-eabi-ld -Tdata 0x10000000 basic-template-ARM.o -o basic-template-ARM.elf​
$ arm-none-eabi-objcopy -O ihex -S basic-template-ARM.elf basic-template-ARM.hex
```

The first line above will compile the assembly code (.S) and generate an object file (.o).
The second line above will generate an executable (.elf) from the object file (.o).
The last line above will generate the hex version of the executable. 

### Commit and push the change to the remote repository
1. Add the generated binary and hex to the repository.
```
$ git add basic-template-ARM.elf basic-template-ARM.hex
```

2. Commit local changes.
```
git commit -m "MESSAGE"
```
Replace `MESSAGE` with your preferred message to this commit, like "initial commit".

3. Push changes in the local repository to the remote one.
```
git push origin
```

Your changes will be automatically visible to the instructor or graders.

