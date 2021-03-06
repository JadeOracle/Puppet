class nexus {
	exec { 'download nexus' :
		command => 'wget http://download.sonatype.com/nexus/oss/nexus-2.9.2-bundle.tar.gz',
		cwd => '/opt',
		timeout => 180000,
		user => root,
		creates => '/opt/nexus-2.9.2-bundle.tar.gz',
		path => ['/usr/bin', '/createbin'],
	} ->

	exec { 'unzip nexus tar' :
		command => 'tar -xzf nexus-2.9.2-bundle.tar.gz',
		user => root,
		cwd => '/opt',
		creates => '/opt/nexus-2.9.2-01',
		path => ['/usr/bin', '/bin'],
	} ->

	exec { 'chown nexus' :
		command => 'chown -R vagrant nexus-2.9.2-01',
		user => root,
		cwd => '/opt',
		path => ['/usr/bin', '/bin'],
	} ->
	
	exec { 'chown sonatype' :
		command => 'chown -R vagrant sonatype-work',
		user => root,
		cwd => '/opt',
		path => ['/usr/bin', '/bin'],
	} ->

	service { "nexus" :
		path => '/opt/nexus-2.9.2-01/bin/',
		ensure => running,
		start => "su vagrant /opt/nexus-2.9.2-01/bin/nexus start",
		stop => "su vagrant /opt/nexus-2.9.2-01/bin/nexus stop",
		status => "su vagrant /opt/nexus-2.9.2-01/bin/nexus status",
		}
}
