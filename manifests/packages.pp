class timeserver::packages {

package { 'ntp':
	ensure => installed,
	}
}
