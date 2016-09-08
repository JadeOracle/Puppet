class maven {
	
	package {'maven':
		ensure 	=> present,
		require	=> package ['openjdk-7-jdk']
	}
}
