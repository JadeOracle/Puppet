class finish {
	exec { 'restart jenkins final' :
		command => 'service jenkins restart',
		user => root,
		path => ['/usr/bin', '/bin'],
		require => package ['jenkins'],
	} 

#	service { 'jira' :
#		ensure => stopped,
#		require => exec ['Fix jira pt 3'],
#	} ->
#
#	service { 'jira' :
#               ensure => running,
#	} 

}
