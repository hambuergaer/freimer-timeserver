class timeserver (
	$client=$timeserver::params::client,
	$server=$timeserver::params::server,
	$ntpServers=$timeserver::params::ntpServers,
) inherits timeserver::params {

if $client {
	include timeserver::client
	}

elsif $server {
	include timeserver::server
	}

else {
	notify {"Nothiong to do":}
	}
}
