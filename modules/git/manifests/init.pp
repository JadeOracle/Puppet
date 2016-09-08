class git {
	
	package { 'git': 
		ensure => present
	}

 	exec { 'git dir creation':
                command => 'git init /home/vagrant/Documents',
		creates => '/home/vagrant/Documents/.git/',
                user => root,
                path => [ '/usr/bin', '/bin/' ],
		require => package ['git'],
        }

 	exec { 'git clone dir':
                command => 'git clone https://github.com/Thatdwarf/Battleships.git /home/vagrant/Documents/Battleships',
                creates => '/home/vagrant/Documents/Battleships/',
                user => root,
                path => [ '/usr/bin', '/bin/' ],
        }


}
