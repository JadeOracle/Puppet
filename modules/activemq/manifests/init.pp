class activemq {
	package { 'activemq':
		ensure => installed
	}

	service { 'activemq':
		ensure => running,
		require => package['activemq']
	}
}
