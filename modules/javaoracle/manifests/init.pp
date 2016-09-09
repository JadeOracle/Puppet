class javaoracle {

	$accept1 = "echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections"
	$accept2 = "echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections"
	
	exec { 'oracle java7 available':
		command => 'add-apt-repository ppa:webupd8team/java && apt-get update',
		user => root,
		path => [ '/usr/bin', '/bin/' ],
	} ->
	
	package { 'debconf':
		ensure 	=> present,
	} ->
	
	package { 'debconf-utils':
		ensure 	=> present,
	} ->
	
	exec { 'accept license1':
		command => $accept1,
		user => root,
		path => [ '/usr/bin', '/bin/' ],
	} -> 
	
	exec { 'accept license2':
		command => $accept2,
		user => root,
		path => [ '/usr/bin', '/bin/' ],
	} -> 
		
	package {'oracle-java7-installer':
		ensure 	=> present,
		require	=> exec ['oracle java7 available'],
	
	}
}
