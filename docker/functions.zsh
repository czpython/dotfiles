function dock () {
    if [ "$1" = "stop" ]; then
        if [ "$2" = "all" ]; then
            docker stop $(docker ps -a -q)
            return
        fi
    fi

    if [ "$1" = "rm" ]; then
        if [ "$2" = "all" ]; then
            docker rm $(docker ps -a -q)
            return
        fi

        if [ "$2" = "old" ]; then
            docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs docker rm -f
            return
        fi

        if [ "$2" = "consul" ]; then
            docker ps -a | grep 'progrium/consul' | awk '{print $1}' | xargs docker rm -f
            return
        fi
    fi

    if [ "$1" = "rmi" ]; then
        if [ "$2" = "none" ]; then
            docker images | grep '<none>' | awk '{print $3}' | xargs docker rmi -f
            return
        fi

    fi

    if [ "$1" = "cleanup" ]; then
        dock rm old
        dock rm consul
        dock rmi none
        return
    fi

    docker $@
}
