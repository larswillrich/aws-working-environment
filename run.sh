#docker build --tag aws-working-environment .
docker run -it -v C:/Users/lwillrich/.ssh:/root/sshKeyMount:ro -v C:/cygwin64/home/lwillrich/dev:/root/dev aws-working-environment