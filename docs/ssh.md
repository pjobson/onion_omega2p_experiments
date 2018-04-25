# SSH

## Default Login / Password

If your device is going to be in the wild, be sure to change your password.

* Username: `root`
* Password: `onioneer`

Log in to your device.

    ssh root@10.10.10.250

This will prompt you for your password.

    root@10.10.10.250's password:

## Changing Your Password

Changing your password is very easy.

    passwd

Will display a series of prompts.

    Changing password for root
    New password:
    Retype password:
    passwd: password for root changed by root

## Generate SSH Keys

### Using Helper Script

    wget https://raw.githubusercontent.com/pjobson/onion_omega2p_experiments/master/bin/generate_ssh_keys.sh
    source generate_ssh_keys.sh

### Manually

    mkdir ~/.ssh
    dropbearkey -t rsa -f ~/.ssh/id_rsa

If you already generated an rsa key perhaps stored on an SD card, you may get the following error.

	Generating key, this may take a while...
	Couldn't create new file /root/.ssh/id_rsa: File exists
	Exited: Failed to generate key.

Don't worry, just continue on.

    dropbearkey -y -f ~/.ssh/id_rsa | sed -n 2p > ~/.ssh/id_rsa.pub

## SSH to Omega without Password

On your client machine, if you have not, generate a public and private key with `ssh-keygen`.  You may set a password if you'd like.

    ssh-keygen

Now cat the client's `id_rsa.pub` into your Omega, you'll need to change my IP to yours here.

    cat ~/.ssh/id_rsa.pub | ssh root@10.10.10.250 'cat >> /etc/dropbear/authorized_keys'

This will prompt for your Omega's password then throw an error, you can ignore the error.

    root@10.10.10.250's password:
    shell-init: error retrieving current directory: getcwd: cannot access parent directories: Not a tty

Now when you ssh from the client to the Omega it should not prompt you.

    root@10.10.10.250
