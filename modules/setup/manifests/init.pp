class setup {
	
	class { 'java':
	}
	
	class { 'maven':
		require => package ['openjdk-7-jdk'],
	}
	
	class { 'git':
	}
	
	class { 'jenkins':
		require => package ['openjdk-7-jdk'],
	}

	class { 'jira':
		require => [package ['openjdk-7-jdk'],service ['jenkins'] ],
	}

#	class{ 'nexus':
#		require => package ['openjdk-7-jdk'],
#
#	}

	class{ 'finish':
  	}
}
