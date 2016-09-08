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
	}

	exec { 'link nexus' :
		command => 'ln -s nexus-2.9.2-01 nexus',
		user => root,
		cwd => '/opt',
		creates => '/opt/nexus',
		path => ['/usr/bin', '/bin'],
	}
}
