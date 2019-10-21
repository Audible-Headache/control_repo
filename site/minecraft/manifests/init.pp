class minecraft (
    $url = 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar',
    $installl_dir = '/opt/minecraft'
){
    file {$installl_dir:
        ensure => directory,
    }
    file {"${installl_dir}/minecraft_server.jar":
        ensure => file,
        source => $url,
        before => Service['minecraft'],
    }
    package {'java':
        ensure => present,
    }
    file {"${installl_dir}/eula.txt":
        ensure => file,
        content => 'eula=true',
    }
    file {'/etc/systemd/system/minecraft.service':
        ensure => file,
        source => 'puppet:///modules/minecraft/minecraft.service',
    }
    service {'minecraft':
        ensure => running,
        enable => true,
        require => [Package['java'],File["${installl_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service']],
    }
}
