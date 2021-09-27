# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include terraform::terraformcode
class terraform::terraformcode (
String	$yumrepopath	=	'/etc/yum.repos.d/hashicorp.repo',
String	$ensurefile	=	'file',
	$repoowner	=	'root',
	$repogroup	=	'root',
String	$terraformpackage = 	'terraform',
	$terraformversion = 	'0.15.1-1',
) {

# Setting up hashicorp repository #

  file { $yumrepopath:
	ensure	=>	$ensurefile,
	mode	=>	'0644',
	owner	=>	$repoowner,
	group	=>	$repogroup,
	source	=>	"puppet:///modules/terraform/hashicorp.repo",
	}

# Installing Terraform package #

  package { $terraformpackage:	
	ensure	=> $terraformversion,
		}
	
}
