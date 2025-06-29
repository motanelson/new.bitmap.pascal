# Computer.history
Computer history 


old videos on :

https://www.youtube.com/@NelsonMota-s4u



build you sound file:

https://www.onlineconverter.com/audio-to-video


https://www.onlineconverter.com/txt-document



https://play.google.com/store/apps/details?id=com.alpaca.android.readout

to pdf:

format text =utf8


https://play.google.com/store/apps/details?id=com.rhmsoft.edit





Building DosBoxOS: A Lightweight Multi-Window DOS Virtualization System

DosBoxOS is a custom-built lightweight operating environment designed for users who want to run multiple DOS-based virtual machines in parallel using DOSBox, all within a minimal Openbox window manager environment. Ideal for retro computing enthusiasts, educational setups, or embedded systems, DosBoxOS brings simplicity, performance, and flexibility together.

Here’s a breakdown of how to build your own DosBoxOS setup.


---

🧩 System Overview

DosBoxOS is not a traditional full-featured operating system. Instead, it is a minimal Linux-based environment using the Openbox window manager, optimized to run multiple DOSBox sessions, each in its own dedicated window.

🔧 Core Components

1. Base Linux System
Start with a lightweight Linux distribution, such as:

Debian Minimal / netinst

Arch Linux

Alpine Linux These provide the bare essentials without bloated desktop environments.



2. Openbox Window Manager
Openbox is a fast, lightweight, and highly configurable window manager. It allows you to run multiple windows without the overhead of a full desktop environment.


3. DOSBox Emulator
DOSBox is an open-source x86 emulator with DOS, ideal for running legacy games and software. Install it via your package manager:

sudo apt install dosbox


4. TerminalX or XTerm
Terminal emulator used to launch and control DOSBox instances.




---

🖥️ System Features

Multiple DOS Virtual Machines: Launch several independent DOSBox windows, each running its own DOS software.

Openbox Interface: Clean, keyboard-friendly interface for window tiling and quick app launching.

Terminal-based Control: Use TerminalX or another lightweight terminal to manage and script your DOSBox instances.

Low Resource Usage: Ideal for old hardware or virtual machines.



---

🚀 How to Set It Up

1. Install a Minimal Linux Base Use a lightweight installer and only install core packages. Ensure X11 or Wayland is installed to enable windowed environments.


2. Install Openbox

sudo apt install openbox obconf


3. Install DOSBox and Terminal

sudo apt install dosbox xterm


4. Configure Openbox Autostart Add DOSBox sessions or terminal launchers to ~/.config/openbox/autostart:

xterm -e dosbox &
xterm -e dosbox ~/dosgames/Doom &


5. Optional: Add a Panel (like tint2)
For better window navigation:

sudo apt install tint2


6. Create Shortcuts or Scripts
Set up hotkeys or desktop entries for launching different DOSBox configurations with various software.




---

🔄 Use Cases

Educational labs teaching MS-DOS or legacy software

Retro gaming stations with multiple DOS games

Lightweight virtual workstations for embedded or kiosk systems

Automation of legacy workflows in industrial environments



---

🧠 Final Thoughts

DosBoxOS is a niche but powerful solution for reviving DOS applications in a modern, minimal, and efficient environment. Whether you're a hobbyist, developer, or educator, this system provides a creative and functional way to experience the legacy of DOS in a highly customizable and performant Linux setup.


---
