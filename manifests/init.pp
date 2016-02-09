# Documentation TBD
#
class timeserver (
$ntpServers = ['de.pool.ntp.org'] )
{
  if $operatingsystem == 'RedHat' and $operatingsystemmajrelease == 7 {
    package { 'ntp':
      ensure => 'purged',
    }
    package { 'chrony':
      ensure => 'installed',
    }
    service { 'ntpd':
      ensure => 'stopped',
      enable => false,
    }
    service { 'chronyd':
      ensure     => 'running',
      enable     => true,
      require    => Package['chrony'],
      hasstatus  => true,
      hasrestart => true,
    }
    file { '/etc/chrony.conf':
      ensure  => file,
      content => template('timeserver/chrony.erb'),
      require => Package['chrony'],
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      notify  => Service['chronyd'],
    }
    
    
  }

  if $operatingsystem == 'RedHat' and $operatingsystemmajrelease == 6 {
    package { 'ntp':
      ensure => installed,
    }

    file { '/etc/ntp.conf':
      ensure  => file,
      content => template('timeserver/ntp.erb'),
      require => Package['ntp'],
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      notify  => Service['ntpd'],
    }

    service { 'ntpd':
      ensure     => 'running',
      enable     => true,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
