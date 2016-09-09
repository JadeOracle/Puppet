class finish {
	exec { 'restart jenkins final' :
		command => 'service jenkins restart',
		user => root,
		path => ['/usr/bin', '/bin'],
	} 

	exec { 'stop jira Final' :
		command => 'service jira stop',
		user => root,
		path => ['/usr/bin', '/bin'],
	} ->

	exec { 'start jira Final' :
		command => 'service jira start',
		user => root,
		path => ['/usr/bin', '/bin'],
	} 

}
