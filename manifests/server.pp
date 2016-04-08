class timeserver::server (
	$ntpServers = $timeserver::params::ntpServers
)
inherits timeserver::params {

if $operatingsystem == 'RedHat' or  $operatingsystem == 'CentOS'{
	include timeserver::packages
	include timeserver::service

	file { '/etc/ntp.conf':
		ensure  => file,
 		content => template('timeserver/ntp_server.erb'),
      		require => Package['ntp'],
      		owner   => 'root',
      		group   => 'root',
      		mode    => '0644',
      		notify  => Service['ntpd'],
    	}

}
}
