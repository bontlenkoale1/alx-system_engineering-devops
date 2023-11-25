/usr/bin/pup
# using  puppet to install flask from pip3

package::pip { 'flask' :
  ensure       => '2.1.0' ,
  pip_provider => 'pip3' ,
}

package { 'werkzeug' :
	ensure => '2.1.1'
	provider => 'pip3'
}
