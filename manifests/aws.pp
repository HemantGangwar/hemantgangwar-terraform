# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include terraform::aws
class terraform::aws (
	$aws_access_key_id_var		=	'AKIAXJC2VJLMQPZ7EPON',
	$aws_secret_access_key_var 	=	'wnRBNE0TV73w3BYKyRk44dGFZxyAq+xgZFGrecxx',
	$aws_credential_file		=	'/root/.aws/credentials',
) {

  file { $aws_credential_file:
	ensure	=>	file,
	mode	=>	'0644',
	owner	=>	'root',
	group	=>	'root',
	content	=>	template('terraform/awscreds.erb'),	
	}
}
