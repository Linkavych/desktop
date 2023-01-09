# Setup Scripts

A collection of bash scripts for quickly setting up a working desktop environment.

Currently built for Debian/Ubuntu environments.

## Installation Instructions

Feel free to steal, use, and improve for your own purposes!

First, you'll probably need to install `git` before you do anything else:

```bash
sudo apt install -y git
```

Next, clone this repository:

```bash
git clone https://github.com/Linkavych/desktop.git
```

Then we can start the install process:

```bash
make base 2>&1 | tee -a install.log
```

This will install all of the basic programs, some others, nerd-fonts, and some universal
python3 modules. Just the basics, more or less.

It will end with the generation of new ssh-keys for this system, for which you 
need to provide a strong passphrase.

Now, update your Github/Gitlab account with your new ssh-keys before proceeding.

Once that is done, we can finish up with configuration and repository cloning.

```bash
make configure 2>&1 | tee -a install.log
```
