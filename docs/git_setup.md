# Setting Up Git

In the **SSH (After Wifi Setup)** section you should have generated your ssh key. If you have not go back and do it.

## Install Git

    opkg install git

## SSH Key

If you have a git account, put your ssh key into your account.  Go to GitHub's [SSH keys](https://github.com/settings/keys) page.

    cat ~/.ssh/id_rsa.pub

Copy and paste the out put into GitHub, do not make this public.

## Can't Log In

You can clone stuff with git via https, but I didn't want to do that for reasons.

With the Onion by default you'll get an unfriendly message if you try to ssh into github.

    ssh git@github.com

    ssh: Connection to git@github.com:22 exited: No auth methods could be used.

What does this mean?  From what I've read it means it isn't using your generated ssh key to login, because OpenWRT uses dropbear's ssh instead of OpenSSH.

## Fixing Logging In

This section is largely derived from this [answer on stackoverflow](https://stackoverflow.com/questions/19608313/cloning-from-github-on-android-using-terminal-ide/22062806#22062806).

Normally you should be able to ssh into github as shown above, it won't give you a shell, but it will give you a friendly message.

You can `ssh` specifying your user's specific `id_rsa` key and get the friendly authentication message.

    ssh -i ~/.ssh/id_rsa git@github.com
    Hi pjobson! You've successfully authenticated, but GitHub does not provide shell access.

Get the `ssh-git` script from `bin` in this repo.

    mkdir -p ~/bin
    cd ~/bin
    wget https://raw.githubusercontent.com/pjobson/onion_omega2p_experiments/master/bin/ssh-git
    chmod +x ssh-git

Edit your `.profile`.

    vi ~/.profile

Add these exports, replace your info where relevant.

    export GIT_SSH=~/bin/ssh-git
    export GIT_AUTHOR_NAME="USER NAME"
    export GIT_AUTHOR_EMAIL="user@email.address"
    export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
    export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL

Now try to clone this repo.

    git clone git@github.com:pjobson/onion_omega2p_experiments.git
