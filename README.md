# audio-assault-installer

An installer for [Audio Assault](https://audio-assault.com/) Linux Software.

This is an installer for some cool guitar audio software from Audio Assault that I use on my Linux Box. This installer extracts and install the stuff from the given zip packages.

## Status

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/rolodoom/wp-docker-compose/master/LICENSE)

## Usage

Clone repo and execute install script:

```bash
git clone https://github.com/rolodoom/audio-assault-installer.git
cd audio-assault-installer
chmod +x setup.sh
```

Tip: `./setup.sh` allows the following options:

```bash
OPTIONS:
  -i, --install           Install

  -r, --remove,
  -u, --uninstall         Uninstall/Remove

  -h, --help              Show help
```

For more information, run: `./setup.sh -h`

## Software

The original Audio Assault ZIP packages **must be** on the same directory before executing the install script.

- Duality [version 1.2.51, EX]
- RVXX [version 2 update 1.0.3 and version 1.0.1]
- Sigma [version 2 update 1.0.3, version 1.0.2 and EX]
- Blacksun [version 1]
- AHM [version 3]
- Amp Locker

## Bugs and Issues

Have a bug or an issue with this template? [Open a new issue](https://github.com/rolodoom/audio-assault-installer/issues) here on GitHub.

## License

This code in this repository is released under the [MIT](https://raw.githubusercontent.com/rolodoom/audio-assault-installer/master/LICENSE) license, which means you can use it for any purpose, even for commercial projects. In other words, do what you want with it. The only requirement with the MIT License is that the license and copyright notice must be provided with the software.
