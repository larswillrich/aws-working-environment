mkdir /root/.ssh

if [ -d "/root/sshKeyMount" ]
then
    cp -r /root/sshKeyMount/. /root/.ssh
    ls -la /root/.ssh
    chmod 600 /root/.ssh/id_rsa
    eval `ssh-agent -s`
    ssh-add /root/.ssh/id_rsa
    cd /root/dev

    git config --global user.email "larswillrich@gmail.com"
    git config --global user.name "Lars Willrich"

    echo "git private key successfully added"
else
     echo "no git private key mounted to /root/sshKeyMount, so didn't add it to ssh agend"
fi

fish