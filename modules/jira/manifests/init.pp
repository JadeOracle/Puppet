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
		creates => '/opt/JIRA Software'
	} #->

	#exec { 'Swap jiras ports' :
	#	command => 'perl -pi -e "s/<Server port="8005" shutdown="SHUTDOWN">/<Server port="8006" shutdown="SHUTDOWN">/g" server.xml && perl -pi -e "s/<Connector port="8080"/<Connector port="8081"/g" server.xml',
	#	timeout => 180000,
	#	user => root,
	#	cwd => '/opt/JIRA Software/conf/',
	#	path => ['/usr/bin', '/bin'],
	#} ->

	#exec { 'Stop jira' :
	#	command => './stop-jira.sh',
	#	user => root,
	#	path => ['/opt/JIRA Software/bin/', '/bin'],
	#} ->

	#exec { 'Start jira' :
	#	command => './start-jira.sh',
	#	user => root,
	#	path => ['/opt/JIRA Software/bin/', '/bin'],
	#}



}