#class jira {
	exec { 'create install folder' :
			command   => 'mkdir /etc/puppet/install',
	    		user      => root,
		}

	exec { 'download jira' :
			command   => 'cd /etc/puppet/install && wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.3.7-x32.bin',
	    		user      => root,
		}

	exec { 'prepare jira' :
		command   => 'chmod +x /etc/puppet/install/atlassian-jira-6.3.7-x32.bin',
    		user      => root,	
	}

	exec { 'run jira' :
		command   => '/etc/puppet/install/atlassian-jira-6.3.7-x32.bin -q',
    		user      => root,	
	}	
#}
