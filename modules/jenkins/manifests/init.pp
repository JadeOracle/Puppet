class jenkins {
	exec { 'get jenkins keything' :
		command => 'wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -',
		user => root,
		path => ['/usr/bin', '/bin'],
	}

	exec { 'add jenkins source for apt-get' :
		command => 'sudo sh -c "echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list"',
		user => root,
		path => ['/usr/bin', '/bin'],
		require => exec ['get jenkins keything'],
	}

	exec { 'update' :
		command => 'apt-get update',
		user => root,
		path => ['/usr/bin', '/bin'],
		require => exec ['add jenkins source for apt-get'],
	} 

	package { 'jenkins' :
		ensure => installed,
	}

	exec { 'update jenkins ports' :
		command => 'sed -i "s/HTTP_PORT=8080/HTTP_PORT=8082/g" jenkins',
		user => root,
		cwd => '/etc/default',
		path => ['/usr/bin', '/bin'],
		require => package ['jenkins'],
	}

	file { "/etc/default/jenkins" :
		source => "/etc/default/jenkins",
	}

	service { 'jenkins' :
		ensure => running,
		subscribe => File["/etc/default/jenkins"],
	}
}
