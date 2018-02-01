NGINX_DIR=/etc/nginx

nginx.enable () {
    if [ ! $1 ]; then
        echo "\033[337;41m\nThe name of the vhost is required!\n\033[0m";
        return
    fi
    
    if [ ! -e $NGINX_DIR/sites-available/$1 ]; then
        echo "\033[31m$1\033[0m doesn't exist";
        return
    fi

    if [ ! -e $NGINX_DIR/sites-enabled/$1 ]; then
        sudo ln -s $NGINX_DIR/sites-available/$1 $NGINX_DIR/sites-enabled/$1;
	if [ -e $NGINX_DIR/sites-enabled/$1 ]; then
            echo "\033[32m$1\033[0m successfully enabled";
        else
            echo "An error occured during the enabling of \033[31m$1\033[0m";
        fi
    else
        echo "\033[31m$1\033[0m is already enabled";
    fi
}

nginx.disable () {
    if [ ! $1 ]; then
        echo "\033[337;41m\nThe name of the vhost is required!\n\033[0m";
        return
    fi

    if [ ! -e $NGINX_DIR/sites-enabled/$1 ]; then
        echo "\033[31m$1\033[0m doesn't exist";
    else
        sudo rm -f $NGINX_DIR/sites-enabled/$1;
	if [ ! -e $NGINX_DIR/sites-enabled/$1 ]; then
            echo "\033[32m$1\033[0m successfully disabled";
        else
            echo "An error occured during the disabling of \033[31m$1\033[0m";
        fi
    fi
}

