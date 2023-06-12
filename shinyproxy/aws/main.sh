#!/bin/bash

server="ubuntu@ec2-3-133-60-214.us-east-2.compute.amazonaws.com"
pem="shinyproxy"

printf "\n\n\tSelect one of the following options: "
printf "\n"
printf "\n\t\t(1) build & run shinyproxy"
printf "\n\t\t(2) build app"
printf "\n\t\t(3) connect to server"
printf "\n\t\t(4) send application to server"
printf "\n\t\t(5) install docker & docker-compose"
printf "\n\t\t~ "
read opt

if [ $opt == 1 ]
then
    cd application/
    docker build -t shinyproxy .
    cd ../
    # docker network create matrix
    docker run -d \
        --network=matrix\
        -v ${PWD}/application/application.yml:/opt/shinyproxy/application.yml\
        -v /var/run/docker.sock:/var/run/docker.sock\
        -p 8080:8080\
        --name shinyproxy\
        shinyproxy
elif [ $opt == 2 ]
then
    printf "\n\t\tChoose one app or press enter to build all"
    printf "\n\t\t~ "
    read opt2
    if [ ${#opt2} == 0 ]; then
        cd apps
        for dir in *
        do 
            cd $dir
            docker build --platform linux/amd64 -t $dir .
            cd ../
        done
        cd ../
    else
        cd apps/$opt2
        docker build --platform linux/amd64 -t $opt2 .
        cd ../../
    fi
elif [ $opt == 3 ]
then
    printf "\n\nConnecting to server...\n\n" 
    ssh -i $pem.pem $server

elif [ $opt == 4 ]
then
    # Rscript application/subvars.R
    rsync -rv --exclude=$pem.pem --exclude=.git --exclude=README.md --exclude=images/ . shinyproxy
    scp -i $pem.pem -r shinyproxy/ $server:/home/ubuntu/
    sudo rm -rf shinyproxy/
    ssh -i $pem.pem $server

elif [ $opt == 5 ]
then
    # https://docs.docker.com/engine/install/ubuntu/

    # docker
    sudo apt-get update
    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y

    # compose
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
     sudo chmod +x /usr/local/bin/docker-compose
     sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
else
    printf "Try again"
fi


