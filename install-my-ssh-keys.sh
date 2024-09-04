#!/usr/bin/env sh

# Array of public keys
keys=(
"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLdUm2rz0rxTBpOrQDych9VdFtgjvXo0+UGQmWUqUix4NsKmKEe0QwSPX5rMDXwVHI3DqczXenrYVtFjWe0QaaQiXYrN2JzHrd5XYnc4wZpYaR4OqtwULWCmVltE7/ou1ipNyLKrdnrTJ7+JHcKC+G8fStPxeTwVwZacJ+E3+3Jo0s4bZtFC9yvSOM1+ZrW5LXR7eBjh1sxgYzJIqNa9f7jOoqNCyXMvb3inrLLQ+TdaN/6yNRDVLAd/Z1T+wDfcqIYmh9LdS96nxxOvbL3ONF+dDm9Qdcckn/8jcvPPIzfYx4BNPvUArYt6ktZu/rdJUwmz7FCruPMX8SZoUYzGRbGJDyPFbeqv5tK3lRuFIXpTDfEB1lRbhNo67tUxAlxjQypw0KZmZL0ryyQkVfZH8ErxgLvbpTn0uk6f9Yy6JIphrYiyLY4KFGzshanOA8NmmGlcuMGx1rds499VNm44d+btS46ul3dJVr2ALSLPPAD0I7MqryWcTFuPj6iENW7e8= chris@solstice.lan"
"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCr960/lFUsWxUA83JX8R975QATuBF1YJuk/nuqR3gJR0j2ccI2APEiLoScirKLCQn7FK0SUo9OF1TPhfY+qQKa3/rOg1r0IgJ8YN3wKTLPjrZ3oiQp0h4b9EVLp3arF1oy7EdjL+2kN3Sy9bpcUDhh96gWpSmF592fFv1WpHYf0miAI0f8SeR9oDimyy+lADdI/7BTiiteXLTkZVvac2Ix6cGUQZJ9OspfZ9s0qSBsxWSjW6zsC45jXlPUnUAqv2f5t0PdP7LJXRpnaZPn6csMxtgxqkkGvRu5fJW6W4yRvX/M+O6hYGBWooYiraBjOmYPPXNwlxVncCkdHOkjC6N1eJtr5zXWNqNHuDGU6PhrAFa65IyRoTG6wUxd1aQMKiX/GIrp9UXeDnYknjjxHL39y6SPq5Y1omXfOvcP0n7yOuR6xVKtwWzEp3zQLczptMyL/qkoal1YpY8eylwLnNfO3hvQlua1bAN88zcOOkeUB1/px2f9q6JFgtciAp7pzjk= chris@durandal.local"
"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDU7SGGiOkXE5qu4jKZKpZlY3rg3IwCCjBQbnfIWVxapRZf/XBr1lKiNP17wJpnsT2m0MJB0gdtUmwUtgiH2WsKW+mF/THzSZVnFwNgTvARJHzDomUOuIi+zxA1Q0hqResVylxHqo19WaxBuXBOIS2soL8YW+2KcuzvChQGlKH88eJeIGC4xb4B8wTiAJDfkUen5Fgs3VqlN+8vwk5N+ouUqCYM8ycbWgAg3NBCLPC53UQwJQK2dmBQigb4d8Kf5knOYZcEgb7ADmBqS4tLDeWyVtdEFRJYBg49bwvE0k/++gp28ODMrNNizWRCiP5cO+iiq9E8oQVRRtYW8PIurj7vYZn4n4QUz6bFH+17mapeNbwKVc7Djt5zYC+djweWwAVkAarC9ksoIWr8g//fDAhyT0/93+OcxolDnp8qJuvkPp7GLGyV4CeVmb+ZKYrCNFoXzGzQFPHe6Ln0seLaTbaXLL4hIX0q2Du62U9IhaPeigXf4rv1fW89n8slGKyg1q8= chris@aletheia"
)

# Ensure the file exists
mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys

# Loop over each key and add it only if it doesn't already exist
for key in "${keys[@]}"; do
    # Check if the key already exists using grep
    if ! grep -qF "$key" ~/.ssh/authorized_keys 2>/dev/null; then
        echo "$key" >> ~/.ssh/authorized_keys
        echo "\nAdded key: $key"
    else
        echo "\nKey already exists: $key"
    fi
done

# Set proper permissions
chmod 600 ~/.ssh/authorized_keys
chmod 700 ~/.ssh

echo "\nPublic keys have been processed for the current user"
