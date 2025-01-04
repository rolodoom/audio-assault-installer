# audio-assault-installer

An installer for [Audio Assault](https://audio-assault.com/) Linux Software.

This is an installer for some cool guitar audio software from Audio Assault that I use on my Linux Box. This installer extracts and install the stuff from the given zip packages.

## Software

The original Audio Assault ZIP packages **must be** on the same directory before executing the install script.

- Duality [version 1.2.51, EX]
- RVXX [version 2 update 1.0.3 and version 1.0.1]
- Sigma [version 2 update 1.0.3, version 1.0.2 and EX]
- Blacksun [version 1]
- AHM [version 3]
- Amp Locker

## Usage

Clone repo and execute install script:

```bash
git clone https://github.com/rolodoom/audio-assault-installer.git
cd audio-assault-installer
chmod +x setup.sh
```

Tip: `./setup.sh` allows the following options:

```bash
Usage: $0 [OPTION]...

OPTIONS:
  -i, --install           Install

  -r, --remove,
  -u, --uninstall         Uninstall/Remove

  -h, --help              Show help
```

For more information, run: `./setup.sh -h`
