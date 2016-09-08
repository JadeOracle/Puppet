class setup {
	
	class { 'java':
	} ->
	
	class { 'maven':
	} ->
	
	class { 'git':
	} ->
	
	class { 'jenkins':
  	} ->

	class { 'jira':
  	}

	#class{ 'nexus':
    	#	version    => '2.8.0',
    	#	revision   => '05',
    	#	nexus_root => '/srv',
  	#}
}
