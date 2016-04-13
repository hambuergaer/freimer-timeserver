class timeserver (
	$client=true,
	$server=false,
	$ntpClientTimetickers='pool.ntp.org',
	$ntpServerTimetickers='pool.ntp.org',
	$package='ntp',
	$service='ntpd',
	$configfile='/etc/ntp.conf'
) {

package { $package:
        ensure => installed,
        }

service { $service:
        ensure     => 'running',
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
	require    => Package[$package]
        }

if $client {
	file { $configfile:
		ensure  => file,
                content => template('timeserver/ntp_client.erb'),
                require => Package[$package],
                owner   => 'root',
                group   => 'root',
                mode    => '0644',
                notify  => Service[$service]
        	}
	
	file { '/etc/sysconfig/ntpd':
                source  => ['puppet:///modules/timeserver/etc/sysconfig/ntpd'],
                owner   => root,
                group   => root,
                mode    => '0644',
                require => Package[$package],
                notify  => Service[$service]
        	}
	}

elsif $server {
	file { '/etc/ntp.conf':
                ensure  => file,
                content => template('timeserver/ntp_server.erb'),
                require => Package[$package],
                owner   => 'root',
                group   => 'root',
                mode    => '0644',
                notify  => Service[$service]
        	}
	}

else {
	notify {"Nothiong to do":}
	}
}
