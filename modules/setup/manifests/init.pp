class setup {
	

	class { 'javaoracle':
	} 
	
	class { 'maven':
		require => package ['oracle-java7-installer'],
	}
	
	class { 'git':
	}
	
	class { 'jenkins':
		require => package ['oracle-java7-installer'],
	} ->

	class { 'jira':
		require => package ['oracle-java7-installer'],
	}

	class { 'nexus':
		require => package ['oracle-java7-installer'],

	}

	class { 'mcollective':
	}
}
