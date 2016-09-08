class java {
	exec { 'java7_available':
		command => 'add-apt-repository ppa:openjdk-r/ppa',
		user => root,
		path => [ '/usr/bin', '/bin/' ],
	}
		
	package {'openjdk-7-jdk':
		ensure 	=> present,
		require	=> exec ['java7_available'],
	
	}
}
