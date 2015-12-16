define rsyslog::facility (
				$facilityname=$name,
				$facility,
				$filename=undef,
				$discard=false,
				$basedir='/etc/rsyslog.d',
				$remotesyslog=undef,
				$remotesyslogtype='udp',
				$order='10',
			) {
	validate_re($remotesyslogtype, [ '^udp$', '^tcp$'], "not a valid protocol")
	
	if ! defined(Class['syslogng'])
	{
		file { "${basedir}/${order}-${facilityname}.conf":
			ensure => 'present',
			owner => 'root',
			group => 'root',
			mode => '0644',
			content => template('rsyslog/facility.erb'),
			notify => Service['rsyslog'],
		}
	}

}
