doas is a minimal replacement for the venerable sudo. It was initially written by Ted Unangst of the OpenBSD project to provide 95% of the features of sudo with a fraction of the codebase.

https://github.com/Duncaen/OpenDoas

https://blog.qualys.com/vulnerabilities-research/2021/01/26/cve-2021-3156-heap-based-buffer-overflow-in-sudo-baron-samedit

```nix
{
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [{ users = [ "matklad" ]; keepEnv = true; persist = true; }];
    };
    pam.loginLimits = [
      { domain = "*"; type = "soft"; item = "memlock"; value = "524288"; }
      { domain = "*"; type = "hard"; item = "memlock"; value = "524288"; }
    ];
  };
}
```

- https://github.com/matklad/config/blob/cc44295f5a61b4979268764db54befa3414c0c81/configuration.nix#L236
- https://www.reddit.com/r/NixOS/comments/l95gm4/comment/gnvppiu/

## machinectl shell

eliasp

I just use systemd's `machinectl shell …` for a proper different user-session whenever I need it and I have this alias as a `sudo su -` replacement since ages:

```nix
environment.shellAliases = {
  msh = "machinectl shell .host /run/current-system/sw/bin/zsh";
};
```

CSI_Tech_Dept

Or of curiosity, why not just `su -` or at least `sudo -i`?

aberrantmoose

I think `su -` requires you to input the root password. `sudo su -` either requires your own personal password or no password at all. Best practice: you don't know the root password.

https://www.reddit.com/r/NixOS/comments/l95gm4/comment/glgorp9/?utm_source=reddit&utm_medium=web2x&context=3
