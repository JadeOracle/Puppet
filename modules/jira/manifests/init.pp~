class jira {
	$javahome = '/usr/lib/jvm/java-7-openjdk-amd64'
	
	exec { 'Download jira' :
		command => 'wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.4.14-war.tar.gz',
		timeout => 180000,
		creates => '/etc/atlassian-jira-6.4.14-war.tar.gz',
		user => root,
		cwd => '/etc',
		path => ['/usr/bin', '/bin'],
	} ->
	
	#exec { 'Move the tar' :
	#	command => 'cp atlassian-jira-6.4.14-war.tar.gz /opt/',
	#	user => root,
	#	path => ['/usr/bin', '/bin'],
	#} ->

	exec { 'Extract the tar' :
		command => 'tar -xzf atlassian-jira-6.4.14-war.tar.gz',
		user => root,
		cwd => '/etc',
		path => ['/usr/bin', '/bin'],
	}
}
