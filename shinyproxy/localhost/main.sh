#!/bin/bash

printf "\n\n\tSelect one of the following options: "
printf "\n"
printf "\n\t\t(1) build & run shinyproxy"
printf "\n\t\t(2) build app"
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
else
    printf "Try again"
fi


