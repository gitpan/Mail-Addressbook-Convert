
use ExtUtils::MakeMaker;
    WriteMakefile(
        'NAME'              => 'Addressbook-Convert',
        'VERSION_FROM'      => 'Addressbook/Convert/Convert.pm', # finds $VERSION
        
  	'PREREQ_PM' => {
      	Text::ParseWords => 3.1,
     	},
    );

