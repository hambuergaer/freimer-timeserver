class timeserver::config inherits timeserver {

package { $timeserver::package:
        ensure => installed,
        }

service { $timeserver::service:
        ensure     => 'running',
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
	require    => Package[$timeserver::package]
        }

if $timeserver::client {
	file { $timeserver::configfile:
		ensure  => file,
                content => template('timeserver/ntp_client.erb'),
                require => Package[$timeserver::package],
                owner   => 'root',
                group   => 'root',
                mode    => '0644',
                notify  => Service[$timeserver::service]
        	}

	file { $timeserver::ntpd_configfile:
                content => template('timeserver/ntpd.erb'),
                owner   => root,
                group   => root,
                mode    => '0644',
                require => Package[$timeserver::package],
                notify  => Service[$timeserver::service]
        	}
	}

elsif $timeserver::server {
	file { '/etc/ntp.conf':
                ensure  => file,
                content => template('timeserver/ntp_server.erb'),
                require => Package[$timeserver::package],
                owner   => 'root',
                group   => 'root',
                mode    => '0644',
                notify  => Service[$timeserver::service]
        	}
	}

else {
	notify {"Nothiong to do":}
	}
}
