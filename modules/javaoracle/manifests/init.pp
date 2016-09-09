class javaoracle {
	exec { 'oracle java7 available':
		command => 'add-apt-repository ppa:webupd8team/java && apt-get update',
		user => root,
		path => [ '/usr/bin', '/bin/' ],
	} ->
	
	exec { 'accept license':
		command => 'echo debconf shared/accepted-oracle-license-v1-1 select true | \  sudo debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | \ sudo debconf-set-selections',
		user => root,
		path => [ '/usr/bin', '/bin/' ],
	} -> 
		
	package {'oracle-java7-installer':
		ensure 	=> present,
		require	=> exec ['oracle java7 available'],
	
	}
}
