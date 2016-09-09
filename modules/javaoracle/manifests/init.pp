class javaoracle {
	exec { 'oracle java7 available':
		command => 'add-apt-repository ppa:webupd8team/java',
		user => root,
		path => [ '/usr/bin', '/bin/' ],
	}
		
	package {'oracle-java7-installer':
		ensure 	=> present,
		require	=> exec ['oracle java7 available'],
	
	}
}
