class setup {
	
	class { 'javaoracle':
	} ->
	
	class { 'maven':
	} ->
	
	class { 'git':
	} ->
	
	class { 'jenkins':
  	} ->

	class { 'jira':
  	} ->

	class{ 'nexus':
  	} ->

	class{ 'finish':
  	}
}
