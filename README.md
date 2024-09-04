# Install My SSH Keys

This shell script installs my SSH keys into the current user's `~/.ssh/authorized_keys` file,
granting me access to SSH into the user.

```shell
# wget
wget -qO- https://raw.githubusercontent.com/sehlceris/install-my-ssh-keys/main/install-my-ssh-keys.sh | sh

# curl
curl -sSL https://raw.githubusercontent.com/sehlceris/install-my-ssh-keys/main/install-my-ssh-keys.sh | sh
```