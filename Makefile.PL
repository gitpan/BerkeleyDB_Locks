use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

my $lib = '/usr/local/BerkeleyDB.4.1/lib' ;
my $build = '/root/src/db-4.1.24.NC' ;
my $pv41 = undef ;

if ( $ARGV[0] eq '4.0' ) {
	$lib = '/usr/local/BerkeleyDB.4.0/lib' ;
	$build = '/home/tqis/src/db-4.0.14' ;
	$pv41 = '-DPREV41' ;
	}

if ( $ARGV[0] eq '3' ) {
	$lib = '/usr/local/BerkeleyDB.3.2/lib' ;
	$build = '/root/src/db-3.2.9' ;
	$pv41 = '-DPREV41' ;
	}

WriteMakefile(
    'NAME'		=> 'BerkeleyDB::Locks',
    'VERSION_FROM'	=> 'Locks.pm', # finds $VERSION
    'PREREQ_PM'		=> {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'Locks.pm', # retrieve abstract from module
       AUTHOR     => 'Jim Schueler <jschueler@tqis.com>') : ()),
    'LIBS'		=> ["-L$lib -ldb"], # e.g., '-lm'
    'DEFINE'		=> "$pv41", # e.g., '-DHAVE_SOMETHING'
	# Insert -I. if you add *.h files later:
    'INC'		=> join ( ' ',
				"-I$build",
				"-I$build/dist",
				"-I$build/include",
				"-I$build/include_auto" ),
	# Un-comment this if you add C files to link with later:
    # 'OBJECT'		=> '$(O_FILES)', # link all the C files too
);
