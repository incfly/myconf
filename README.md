# Incfly Configuration

Hermetic development environment setup.

## Dev Instance Setup

- GCE instance, template, terraform?

    ```bash
    gcloud compute instances create incfly-dev --image-project=ubuntu-os-cloud  \
      --image=ubuntu-1804-bionic-v20190530 --machine-type=n1-standard-8
    ```

## Configuration Management

Bootstrap

```bash
mkdir workspace && cd workspace
git clone https://bluesea147@bitbucket.org/bluesea147/myconf.git
```

## TODO

- gcloud auto install to `$HOME/bin`. (not artifacts.)
- z.sh not working in installation
- kubealias not enabled.

## VIM

- Package manager, https://github.com/junegunn/vim-plug && Vundle. Some plugin needs A, some B.
- No taglist.
- YouCompleteMe, still working on getting the completion works.
Installation is not in `setup.sh`.

## Misc Bash

- fzf
- zsh
- z.sh
