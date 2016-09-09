class setup {
	

	class { 'javaoracle':
	} ->
	
	class { 'maven':
		require => package ['oracle-java7-installer'],
	}
	
	class { 'git':
	}
	
	class { 'jenkins':
		require => package ['oracle-java7-installer'],
	}

	class { 'jira':
		require => [package ['oracle-java7-installer'],service ['jenkins'] ],
	}

	class{ 'nexus':
		require => package ['oracle-java7-installer'],

	}
}
