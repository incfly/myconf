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

- z.sh not working in installation
- kubealias not enabled.
- vim error

   ```text
   Error detected while processing /home/jianfeih/.vimrc:
  line    1:
  E484: Can't open file /usr/share/vim/google/google.vim
  line    3:
  E484: Can't open file /usr/share/vim/google/glug/bootstrap.vim
  line    4:
  E484: Can't open file /usr/share/vim/google/gtags.vim
  line    7:
  E492: Not an editor command: Glug codefmt
  line    8:
  E492: Not an editor command: Glug codefmt-google
  line   25:
  E492: Not an editor command: Glug outline-window
  line   27:
  E492: Not an editor command: Glug youcompleteme-google
  line   28:
  E492: Not an editor command: Glug piper plugin[mappings]=',p'
  Taglist: Exuberant ctags (http://ctags.sf.net) not found in PATH. Plugin is not loaded.
  Press ENTER or type command to continue
  ```

## VIM

- Package manager, https://github.com/junegunn/vim-plug && Vundle. Some plugin needs A, some B.
- No taglist.
- YouCompleteMe, still working on getting the completion works.
Installation is not in `setup.sh`.

## Misc Bash

- fzf
- zsh
- z.sh
