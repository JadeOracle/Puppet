class setup {
	exec { 'make java7 available':
		command => 'add-apt-repository ppa:openjdk-r/ppa',
		user => root,
		path => [ '/usr/bin', '/bin/' ],
	} ->
	
	class { 'java':
  		package => 'openjdk-7-jdk',
	} ->
	

	class { 'jira':
    		#javahome    => '/usr/lib/jvm/java-7-openjdk-amd64',
  	} #->
	
	#package { 'git' :
	#	ensure => present,
	#} ->

	#class{ 'nexus':
    	#	version    => '2.8.0',
    	#	revision   => '05',
    	#	nexus_root => '/srv',
  	#}

	#include jenkins
}
