class rsyslog::params {

	case $::osfamily
	{
		'redhat':
		{
			case $::operatingsystemrelease
			{
				/^[67].*$/: { $rsyslogconf_template='rsyslog/rsyslogconfRH.erb' }
				default: { fail('Unsupported RHEL/CentOS version!')  }
			}
		}
		default: { fail('Unsupported OS!')  }
	}
}
