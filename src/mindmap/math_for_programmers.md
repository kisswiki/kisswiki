- install jupyter
  ```shell
  brew install anaconda
  $(brew --prefix)/anaconda3/bin/conda init zsh
  cat ~/.zsh >> ~/.zprofile
  rm ~/.zsh
  ```
  - https://towardsdatascience.com/how-to-set-up-anaconda-and-jupyter-notebook-the-right-way-de3b7623ea4a
- run jupyter
  - `python -m notebook`
- multiple input boxes
  - press `shift+enter`
- quit jupyter, not just close browser tab, to ensure files are saved
- `mkdir 'Chapter 01/figures'`
