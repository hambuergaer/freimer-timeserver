class timeserver (
	$client=$timeserver::params::client,
	$server=$timeserver::params::server,
	$ntpClientTimetickers=$timeserver::params::ntpClientTimetickers,
	$ntpServerTimetickers=$timeserver::params::ntpServerTimetickers,
	$package=$timeserver::params::package,
	$service=$timeserver::params::service,
	$configfile=$timeserver::params::configfile,
	$ntpd_configfile = $timeserver::params::ntpd_configfile,
	$options_default = $timeserver::params::options_default,
	$options_extras = $timeserver::params::options_extras,
	$sync_hw_clock = $timeserver::params::sync_hw_clock,
	$ntpdate_options = $timeserver::params::ntpdate_options
) inherits timeserver::params {

anchor { 'timeserver::begin': } ->
  class { '::timeserver::config': } ->
anchor { 'timeserver::end': }

}
