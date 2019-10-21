class profile::ssh_server {
    package {'openssh-server':
        ensure => present,
    }
    service { 'sshd':
        ensure => 'running',
        enable => 'true',
    }
    ssh_authorized_key { 'root@master.puppet.vm':
        ensure => present,
        user   => 'root',
        type   => 'ssh-rsa',
        key    => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQC6BefDC+VS2rh7s7kgPx/CO28A0CvBcUCQf5oHx9x06+OJsFKwR/tsoDcdw98GVuZftFVAtBFnusfmiCmEXMUpsrHJ9vCYWzRtDJiQxvGztcy7Owx4J5yV7AwaTuEOTRBayAsmNEpQXQDtnlvPF/LTPyO5SuI7GJUHTM6HP0+hOwvaN6Qhg4vwim9oSxUodC0jeCT3UH6dtvO3x+tAuCunkfCOpgi1JF0SvEFpg+JuIwyedQoMVpVtkZIuhGZdBlFtFVBKI36brTsAkgfTAMAUoY3vjNAaurGnnmzpHIBkS+wQsd5WBX9cfnLEGXZpTImQU/p1VOGdqWRF+6AVRTlsijTa0xUTdmOnqFp41OhkVk9yKye+S69V4Lf5Uh2g9hbD1ijLy94Q6h2S33+pJi0Vjk5TF1d3nvNYuXqWyGbnargZqd+iIEjnX6xCYCfQL0Qh99KhrxA4Z6+pCbANi1A8+J8HSQogKLNFRNCMM1sNkl0jtM5g3T9I9y55XBXeuSXmTAU/cIOPjnw4k9eEQ1lOB6u/iAU19yuBqxQt5g6r198Wy57IvA8I8OilAPkwrMf7Q943op28m4vtOOyd9/wYm3cy4dfDJXccESm7vKXqklwNug0i1CjSu7TR6Gz4KduWpxXBJ1jW3TKT4VtQbHeTVgvw8/VnAa2KtCz9ka+T6Q==',
    }
}
