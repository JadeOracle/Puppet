class mcollective {
  # Install
  package {'mcollective':
    ensure => latest,
  }

  # Run
  service {'mcollective':
    ensure  => running,
    enable  => true,
    require => Package['mcollective'],
  }

	file { 'server_private.pem':
		ensure => present,
		path => '/etc/mcollective/server_private.pem',
		source => '/var/lib/puppet/ssl/private_keys/agent.pem',
		require => Package['mcollective'],
	}

	file { 'server_public.pem':
		ensure => present,
		path => '/etc/mcollective/server_public.pem',
		source => '/var/lib/puppet/ssl/public_keys/agent.pem',
		require => Package['mcollective'],
	}

	file { 'clients':
		ensure => directory,
		path => '/etc/mcollective/clients',
		require => Package['mcollective'],
	}

	file { 'ca.pem':
		ensure => present,
		path => '/etc/mcollective/clients/ca.pem',
		source => '/var/lib/puppet/ssl/certs/ca.pem',
		require => [file['clients'], Package['mcollective']],
	}

	file{"/etc/mcollective/facts.yaml":
      		owner    => root,
      		group    => root,
      		mode     => 400,
      		loglevel => debug, # reduce noise in Puppet reports
      		content  => inline_template("<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime_seconds|timestamp|free)/ }.to_yaml %>"), # exclude rapidly changing facts
		require => Package['mcollective'],
    	}

	file { "server.cfg":
		ensure => file,
        	source => 'puppet:///modules/mcollective/server.cfg',
		path => '/etc/mcollective/server.cfg',
		require => Package['mcollective'],
    	}	

  # Restart the service when any settings change
  #Package['mcollective'] -> Mcollective::Setting <| |> ~> Service['mcollective']
}
