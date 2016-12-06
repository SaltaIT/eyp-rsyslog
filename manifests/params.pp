class rsyslog::params {

	case $::osfamily
	{
		'redhat':
		{
			case $::operatingsystemrelease
			{
				/^6.*$/:
				{
					$rsyslogconf_template='rsyslog/rsyslogconf.erb'
					$system_im='imklog'
					$systemlogsocketname=undef
					$imjournalstatefile=undef
					$omitlocallogging=undef
				}
				/^7.*$/:
				{
					$rsyslogconf_template='rsyslog/rsyslogconf.erb'
					$system_im='imjournal'
					$systemlogsocketname='/run/systemd/journal/syslog'
					$imjournalstatefile='imjournal.state'
					$omitlocallogging=false
				}
				default: { fail('Unsupported RHEL/CentOS version!')  }
			}
		}
		default: { fail('Unsupported OS!')  }
	}
}
