class maven {
	
	package {'maven':
		ensure 	=> present,
		require	=> package ['oracle-java7-installer']
	}
}
