class timeserver::params {

  $client = 'true'
  $server = 'false'
  $ntpClientTimetickers = 'pool.ntp.org'
  $ntpServerTimetickers = 'pool.ntp.org'
  $package = 'ntp'
  $service = 'ntpd'
  $configfile = '/etc/ntp.conf'
  $ntpd_configfile = '/etc/sysconfig/ntpd'
  $options_default = '-u ntp:ntp'
  $options_extras = '-p /var/run/ntpd.pid'
  $sync_hw_clock = 'yes'
  $ntpdate_options = ''

}
