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
  	} ->

	class{ 'nexus':
  	} ->

	class{ 'finish':
  	}
}
