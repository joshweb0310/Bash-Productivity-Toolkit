# 🚀 Bash Productivity Toolkit (BPT)
### A modular, installable productivity suite for Linux power users  
**Version: v1.0.0**

![Shell Script](https://img.shields.io/badge/Shell-Bash-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Release-Stable-success)
![Platform](https://img.shields.io/badge/Linux-Debian%2FUbuntu-orange)
![Maintained](https://img.shields.io/badge/Maintained-Yes-brightgreen)

---

## 📘 About This Project
The **Bash Productivity Toolkit (BPT)** is a modular, installable collection of aliases, functions, and admin tools designed to streamline Linux workflows.

Built for:
- Sysadmins  
- DevOps beginners  
- Hosting support roles  
- Power users  
- Anyone who wants a faster terminal  

BPT installs cleanly into `~/.bpt/`, integrates with `.bashrc`, and provides a full suite of tools for system management, Git workflows, Docker, Nginx, and more.
---

## 🧩 Features

### 🔧 Aliases
- **core.aliases** — navigation, quality‑of‑life shortcuts  
- **system.aliases** — monitoring, apt, services, logs  
- **git.aliases** — fast commits, logs, branches  
- **nginx.aliases** — config testing, reloads, directories  
- **docker.aliases** — ps, exec, compose, cleanup  

### 🛠️ Functions
- **system-tools.sh** — snapshots, port checks, logwatch, disk summaries  
- **nginx-tools.sh** — safe reloads, enable/disable sites, log helpers  
- **git-tools.sh** — branch cleanup, stash helpers, pretty diffs  
- **utils.sh** — timers, extractors, UUIDs, random strings, safe rename  

### 📦 Installable Scripts
- `bpt-install`  
- `bpt-update`  
- `bpt-uninstall`  
---
## 📥 Installation

Clone the repo:
git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>

Code
Run the installer:
./bpt-install

Code
Reload your shell:
source ~/.bashrc

Code
---
## 🧪 Usage Examples
### System Snapshot
sys-top

Code
### Find what’s using a port
find-port 443

Code
### Enable an Nginx site
nginx-enable example.conf

Code
### Clean merged Git branches
git-clean-branches

Code
### Extract any archive
extract file.tar.gz

Code
---

## 🧱 Project Structure

.
├── aliases/
│   ├── core.aliases
│   ├── system.aliases
│   ├── git.aliases
│   ├── nginx.aliases
│   └── docker.aliases
├── functions/
│   ├── system-tools.sh
│   ├── nginx-tools.sh
│   ├── git-tools.sh
│   └── utils.sh
├── bpt-install
├── bpt-update
├── bpt-uninstall
└── README.md

Code

---

## 🤝 Contributing
See **CONTRIBUTING.md** for guidelines on pull requests, coding style, and module structure.

---

## 📝 Changelog
See **CHANGELOG.md** for version history.

---

## 📄 License
This project is licensed under the **MIT License**.

---

## ⭐ Author
**Joshua Webster**  
Linux enthusiast • Home lab builder • Bash toolkit creator

---

# ⭐ CONTRIBUTING.md (commit‑ready)

Contributing to Bash Productivity Toolkit (BPT)
Thank you for considering contributing to BPT!
This project is designed to be modular, clean, and easy to extend.

📌 How to Contribute
1. Fork the repository
Create your own fork and clone it locally.

2. Create a feature branch
Code
git checkout -b feature/my-new-tool

3. Follow the project structure
New aliases → aliases/
New functions → functions/
Install/update logic → installer scripts

4. Keep code clean and commented
Use clear function names
Add comments for anything non‑obvious
Keep modules focused and single‑purpose

5. Test before submitting
Ensure:
No syntax errors
Functions load correctly
Install/update scripts still work

6. Submit a pull request
Include:
What you added
Why it’s useful
Any notes for maintainers

🧱 Coding Style
Bash only
Prefer functions over long inline scripts
Keep aliases short and readable
Use consistent indentation (4 spaces)

🙌 Thank You
Your contributions help make BPT better for everyone.

