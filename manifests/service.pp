class timeserver::service {

service { 'ntpd':
	ensure     => 'running',
	enable     => true,
	hasstatus  => true,
	hasrestart => true,
	}

}
