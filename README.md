# ansible

## Build

## Test

Run the following command to run a basic test of the Ansible docker container:

```bash
$ docker run --rm vwnio/ansible ansible all -c local -i 127.0.0.1, -m ping
```

## Run

Assuming ansible files in the current working directory:

```bash
$ docker run --rm --name ansible -v ${PWD}:${PWD} -v ~/.ssh:/root/.ssh:ro --workdir ${PWD} vwnio/ansible ansible
```

To make it easier to use ansible you can create bash aliases, like so:

```bash
alias ansible='docker run -it --rm -u "$(id -u):$(id -u)" -v /etc/passwd:/etc/passwd:ro -v "${PWD}":/ansible:ro -v "${HOME}":"${HOME}" --workdir=/ansible vwnio/ansible:latest ansible'
alias ansible-inventory='docker run -it --rm -u "$(id -u):$(id -u)" -v /etc/passwd:/etc/passwd:ro -v "${PWD}":/ansible:ro -v "${HOME}":"${HOME}" --workdir=/ansible vwnio/ansible:latest ansible-inventory'
alias ansible-playbook='docker run -it --rm -u "$(id -u):$(id -u)" -v /etc/passwd:/etc/passwd:ro -v "${PWD}":/ansible:ro -v "${HOME}":"${HOME}" --workdir=/ansible vwnio/ansible:latest ansible-playbook'
alias ansible-vault='docker run -it --rm -u "$(id -u):$(id -u)" -v /etc/passwd:/etc/passwd:ro -v "${PWD}":/ansible:ro -v "${HOME}":"${HOME}" --workdir=/ansible vwnio/ansible:latest ansible-vault'
```