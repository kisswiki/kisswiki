```shell
brew tap sdkman/tap
brew install sdkman-cli
```

add to .zshrc

```
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
```

then

```shell
sdk list java
sdk install java 21.0.1-zulu
sdk default java 21.0.1-zulu
```

- https://www.baeldung.com/java-sdkman-intro
- https://whichjdk.com
