class jira {	
	exec { 'Download jira' :
		command => 'wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-7.2.1-x64.bin',
		timeout => 180000,
		creates => '/opt/atlassian-jira-software-7.2.1-x64.bin',
		user => root,
		cwd => '/opt',
		path => ['/usr/bin', '/bin'],
	} ->

	exec { 'make accessible' :
		command => 'chmod a+x atlassian-jira-software-7.2.1-x64.bin',
		user => root,
		cwd => '/opt',
		path => ['/usr/bin', '/bin'],
	} ->

	exec { 'Install jira' :
		command => '/opt/atlassian-jira-software-7.2.1-x64.bin -q',
		timeout => 180000,
		user => root,
		creates => '/opt/"JIRA Software"',
	} ->

	exec { 'Fix jira' :
		command => 'sed -i "s/"/opt\nSoftware/bin"/"/opt/ JIRA Software/bin"/g" jenkins',
		user => root,
		cwd => '/etc/init.d',
		path => ['/usr/bin', '/bin'],
	}


}
