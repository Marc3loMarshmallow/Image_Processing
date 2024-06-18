#! /usr/bin/env bash


if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo "Usage: docker_build.sh"
    echo "Builds a docker image with a user that matches the username and uid of the host user."
fi

uid=$(id -u)
username=$(whoami)
password='password'    # dummy password
out="Dockerfile"

if [ "$1" == "sample" ]; then
    out="Dockerfile.sample"
    uid="1000"
    username="user"
fi

echo "Using username: $username with uid: $uid"
echo "The default password is: $password"

cat << EOF > $out
FROM ubuntu:20.04

RUN  apt update && apt install -y zsh \\
                     locales \\
                     vim \\
                     python3 \\
                     python3-pip

ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8

COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Use the same gid and uid as your user on the host system. You can find them
# out with the id  programm. This way the file ownership in mapped directories is
# consistent with the host system.
RUN echo "%sudo ALL=(ALL) ALL" >> /etc/sudoers
RUN groupadd --gid $uid $username
RUN useradd --uid $uid  --gid $username \\
    --home-dir /home/$username --shell /usr/bin/bash  \\
    --groups sudo,$username \\
    --password $password \\
    $username


# set default passwords
RUN echo $username:$password | chpasswd && \\
    echo root:$password | chpasswd

RUN mkdir -p /home/$username && chown -R $username:$username /home/$username

USER $username
WORKDIR /home/$username

RUN echo "PATH=$PATH:/usr/local/bin:~/.local/bin/" > /home/$username/.bashrc

CMD ["sh", "-c", "jupyter lab --ip 0.0.0.0 --NotebookApp.token='' --NotebookApp.password=''"]
EOF

if [ "$1" != "sample" ]; then
    docker build -t 'image_processing_ss22' .
fi
