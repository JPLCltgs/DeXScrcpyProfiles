# 📱 Android Desktop – Scrcpy Profiles  
Turn your Android phone into a **desktop‑like environment** from your PC — similar to Samsung DeX — using scrcpy, ADB over Wi‑Fi, and automatic system tweaks.

---

## 🚀 Overview

**Android Desktop – Scrcpy Profiles** is a Windows batch script that transforms your Android device into a **desktop‑style workspace**, much like Samsung DeX — but without needing a Samsung device.

Using scrcpy’s virtual display feature and a set of Android system tweaks (freeform windows, desktop mode, forced landscape), this script lets you interact with your phone on your PC as if it were a desktop operating system.

It also automates ADB Wi‑Fi connection, remembers your last IP and resolution, and provides multiple scrcpy profiles optimized for productivity, low latency, or high quality.

---

## ✨ Features

- 🔌 **Automatic ADB Wi‑Fi connection**
- 💾 **Remembers last used IP and resolution** (no newline, no trailing spaces)
- 🖥️ **Desktop‑like Productivity Mode**
  - Freeform windows  
  - Forced resizable apps  
  - Desktop mode on external displays  
  - Landscape orientation  
- 🎮 **Clone Mode** for low‑latency mirroring
- 🎛️ **Advanced Mode** with 4 quality presets
- 🔄 **Automatic restore** of Android settings after closing scrcpy
- ⚡ 100% pure CMD — **no PowerShell required**
- 🧼 Clean input handling (no extra ENTER prompts)

---

## 🧩 How It Works

1. Loads your **last used IP** and **last used resolution**  
2. Prompts you to enter new values or press ENTER to reuse them  
3. Restarts ADB in TCP/IP mode  
4. Connects to your phone wirelessly  
5. Shows a menu of scrcpy profiles  
6. Applies Android system tweaks for desktop‑like behavior  
7. Launches scrcpy with the selected profile  
8. Restores all Android settings when scrcpy closes  

---

## 🖥️ Why This Feels Like DeX

This script enables:

- Freeform window support  
- Forced resizable activities  
- Desktop mode on external displays  
- Landscape orientation  
- A virtual display with your chosen resolution  

Combined with scrcpy, this creates a **true desktop‑like experience**, even on devices that don’t officially support DeX or desktop mode.

---

## 📦 Requirements

### Windows
- Windows 10 or newer  
- `adb.exe` available in PATH (from Android Platform Tools)  
- `scrcpy` installed (Genymobile/scrcpy)

### Android
- Developer Options enabled  
- USB debugging enabled  
- First connection must be via USB to authorize ADB  
- Optional: Wireless debugging (Android 11+)  

---

# 📘 How to Use

Follow these steps to run the script properly:

### 1. Install scrcpy
Download scrcpy from the official GitHub repository and extract it anywhere you like.

### 2. Place the script inside the scrcpy folder
Copy the `.cmd` script into the same folder where `scrcpy.exe` and `adb.exe` are located.

Your folder should look like:
scrcpy/
├─ scrcpy.exe
├─ adb.exe
├─ AndroidDesktop.cmd   ← your script
├─ ...


This ensures the script can call scrcpy and ADB without needing PATH configuration.

### 3. Connect your phone via USB (first time only)
- Enable **USB debugging**  
- Connect your phone  
- Accept the ADB authorization prompt  

After this, you can disconnect the cable.

### 4. Run the script
Double‑click the `.cmd` file.

### 5. Enter your phone’s IP
The script will ask:
Enter your phone IP (press ENTER to use last saved IP):


You can:
- Type a new IP  
- Or press ENTER to reuse the previous one  

### 6. Enter your desired resolution
Same behavior as the IP prompt.

### 7. Choose a profile
You’ll see a menu:
1 - Productivity Mode
2 - Clone Mode
3 - Advanced Mode
4 - Exit


Pick the one you want and enjoy your DeX‑like Android desktop.

---

## 🎛️ Profiles Included

### 🟦 Productivity Mode (Desktop‑like)
- Virtual display  
- Freeform + desktop mode  
- Landscape  
- 60 FPS  
- Medium bitrate  

### 🟩 Clone Mode (Low Latency)
- Mirrors the real phone screen  
- Turns off the phone display  
- Minimal latency  

### 🟧 Advanced Mode
Four presets:

| Mode | Resolution | Bitrate | Codec | Purpose |
|------|------------|---------|--------|---------|
| Fast | %RES%/260 | 8 Mbps | H.264 | Smooth performance |
| High | %RES%/300 | 16 Mbps | H.264 | Balanced quality |
| Ultra | %RES%/320 | 32 Mbps | H.265 | High quality |
| Maximum | %RES%/340 | 50 Mbps | H.265 | Maximum fidelity |

---

## 📁 Files Created

- `last_ip.txt` → stores last used IP  
- `last_res.txt` → stores last used resolution  

Both are written **without newline or trailing spaces**.

---

## 🧪 Compatibility

- Works on any Android device with ADB  
- Works on any Windows PC  
- No admin rights required  
- No PowerShell required  

---

## ⚠️ Notes

- Some Android skins may restrict freeform or desktop mode  
- H.265 requires device support  
- Wi‑Fi quality affects performance  
- First ADB authorization must be done via USB  

---

## 🤝 Contributing

Pull requests are welcome!  
Ideas for improvement:

- Auto‑detect monitor resolution  
- Auto‑detect DPI  
- More scrcpy profiles  
- Optional audio forwarding  
- GUI version  

---

## 📜 License

MIT License — free to use, modify, and distribute.



