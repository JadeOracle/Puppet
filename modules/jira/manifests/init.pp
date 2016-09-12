class jira {	
	exec { 'Download jira' :
		command => 'wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-7.2.1-x64.bin',
		timeout => 180000,
		creates => '/opt/atlassian-jira-software-7.2.1-x64.bin',
		user => root,
		cwd => '/opt',
		path => ['/usr/bin', '/bin'],
	}

	exec { 'make accessible' :
		command => 'chmod a+x atlassian-jira-software-7.2.1-x64.bin',
		user => root,
		cwd => '/opt',
		path => ['/usr/bin', '/bin'],
		require => exec ['Download jira'],
	}

	exec { 'Install jira' :
		command => '/opt/atlassian-jira-software-7.2.1-x64.bin -q',
		timeout => 180000,
		user => root,
		creates => '/opt/JIRA Software',
		require => exec ['make accessible'],
	}

	exec { 'Fix jira' :
		command => 'sed -i "s@cd \"/opt@@g" jira',
		user => root,
		cwd => '/etc/init.d',
		path => ['/usr/bin', '/bin'],
		require => exec ['Install jira'],
	}
	
	exec { 'Fix jira pt 2' :
		command => 'sed -i "s@Software/bin\"@cd \"/opt/JIRA Software/bin\"@g" jira',
		user => root,
		cwd => '/etc/init.d',
		path => ['/usr/bin', '/bin'],
		require => exec ['Fix jira'],
	}
	
	exec { 'Fix jira pt 3' :
		command => 'sed -i "s@/JIRA cd@cd@g" jira',
		user => root,
		cwd => '/etc/init.d',
		path => ['/usr/bin', '/bin'],
		require => exec ['Fix jira pt 2'],
	}

	service { 'jira' :
		ensure => running,
		enable => "true",
		hasstatus => false,
		require => exec ['Fix jira pt 3'],
	}
}

