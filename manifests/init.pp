class timeserver (
	$client=$timeserver::params::client,
	$server=$timeserver::params::server,
	$ntpServers=$timeserver::params::ntpServers,
) inherits timeserver::params {

if $client {
	include timeserver::client
	}

else {
	notify {"This will be an NTP server":}
	}

}
