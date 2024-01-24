# fix our stack so that there is not failed requests

exec { 'change nginx limit':
    command  => 'sudo sed -i "s/15/4096/g" /etc/default/nginx; sudo service nginx restart',
    provider => shell,
}




0x1B-web_stack_debugging_4/1-user_limit.pp


# changes the OS configuration so that it is posible to login with the holberton user and open a file without any error message
exec { 'change soft limit':
    command  => 'sudo sed -i "s/holberton\ssoft.*/holberton\tsoft\tnofile\t10000/" /etc/security/limits.conf',
    provider => shell,
}

exec { 'change hard limit':
    command  => 'sudo sed -i "s/holberton\shard.*/holberton\thard\tnofile\t100000/" /etc/security/limits.conf',
    provider => shell,
}
