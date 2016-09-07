class jenkins {
	exec { 'get jenkins keything' :
		command => 'wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -',
		#creates => '/opt/atlassian-jira-software-7.2.1-x64.bin',
		user => root,
		path => ['/usr/bin', '/bin'],
	} ->

	exec { 'add jenkins source for apt-get' :
		command => 'sudo sh -c "echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list"',
		user => root,
		path => ['/usr/bin', '/bin'],
	} ->

	exec { 'update' :
		command => 'apt-get update',
		user => root,
		path => ['/usr/bin', '/bin'],
	} ->

	package { 'jenkins' :
		ensure => installed,
	} ->

	exec { 'update ports' :
		command => 'sed -i "s/HTTP_PORT=8080/HTTP_PORT=8081/g" jenkins',
		user => root,
		cwd => '/etc/default',
		path => ['/usr/bin', '/bin'],
	} ->

	exec { 'start jenkins' :
		command => 'service jenkins start',
		user => root,
		path => ['/usr/bin', '/bin'],
	} 




}
