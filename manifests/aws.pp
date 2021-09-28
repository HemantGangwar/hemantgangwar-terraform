# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include terraform::aws
class terraform::aws (
	$aws_access_key_id_var		=	'AKIAXJC2VJLMQPZ7EPON',
	$aws_secret_access_key_var 	=	'wnRBNE0TV73w3BYKyRk44dGFZxyAq+xgZFGrecxx',
        $aws_credentail_directory       =       '/root/.aws',
	$aws_credential_file		=	'/root/.aws/credentials',
) {

  exec { 'get-aws-cli':
  	cwd     => '/tmp',
  	command => '/bin/wget https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip',
  	path    => ['/usr/bin', '/usr/sbin',],
  	creates => '/tmp/awscli-exe-linux-x86_64.zip',
        }

  exec { 'unzip-aws-cli':
  	cwd     => '/tmp',
  	command => '/usr/bin/unzip /tmp/awscli-exe-linux-x86_64.zip',
  	path    => ['/usr/bin', '/usr/sbin',],
  	creates => '/tmp/aws/',
        }
  
  
  exec { 'install-aws-cli':
  	cwd     => '/tmp',
  	command => '/tmp/aws/install',
  	path    => ['/usr/bin', '/usr/sbin',],
  	creates => '/usr/local/bin/aws',
        }

  file { $aws_credentail_directory:
	ensure  =>      directory,
	}
  file { $aws_credential_file:
	ensure	=>	file,
	mode	=>	'0644',
	owner	=>	'root',
	group	=>	'root',
	content	=>	template('terraform/awscreds.erb'),	
	}
}
