=head1 NAME

Mail::Addressbook::Convert::Tsv -  convert to and from Tsv ( Tab Separated )formatted addressbooks

=head1 SYNOPSIS

use strict;

use Mail::Addressbook::Convert::Tsv;

my $TSV = new Mail::Addressbook::Convert::Tsv();

my $TsvInFile  ="csvSample.txt";  # name of the file containing the csv data

# Convert Tsv to Standard Intermediate format

# see documentation for details on format.

my $raIntermediate = $TSV->scan(\$CsvInFile);  

# This will also work

#my @TsvInArray  = @arrayContainingTheCsvData;

#my $raIntermediate = $csv->scan(\@TsvInArray);  	


# Convert back to Tsv

my $raTsvOut = $TSV->output($raIntermediate);

print join "", @$raIntermediate;  

print "\n\n\n\n";

print join "", @$raTsvOut;

=head1 REQUIRES

Perl, version 5.001 or higher

Carp

=head1 DESCRIPTION

This module is meant to be used as part of the Mail::Addressbook::Convert distribution.

It can convert a Tsv addressbook to a Standard Intermediate format(STF) and a STF to TSV
As part of the larger distribution, it will allow conversion between Tsv and many other 
formats.

To use to convert between Tsv and Eudora as an example, you would do the following 

use Mail::Addressbook::Convert::Tsv;

use Mail::Addressbook::Convert::Eudora;

my $Tsv = new Mail::Addressbook::Convert::Tsv();

my $Eudora = new Mail::Addressbook::Convert::Eudora();

my $tsvInFile  ="tsvSample.txt";  # name of the file containing the Tsv data

my $raIntermediate = $Tsv->scan(\$tsvInFile); 

my $raEudora = $Eudora->output($raIntermediate);  # reference to an array containing a Eudora addressbook


=head1 DEFINITIONS 
 
Standard Intermediate Format(STF) :  

			The addressbook format that is used as an intermediate
			between conversions.  It is rfc822 compliant and can
			be used directly as a Eudora addressbook.  Do not use
			a Eudora addressbook as an STF. Some versions of 
			Eudora use a format, that while RFC822 compliant, will
			not work as an STF. Run the Eudora addressbook
			through $Eudora->scan()
			
Tsv addressbook:


	The tab seperated columns are described below. Only the first one is mandatory.
	They may be enclosed in quotes. 
	
	E-mail address. 
	Name 1 Usually first name or full name. 
	Name 2 Usually last name or leave blank 
	Alias A unique alias, if it is not unique, it will be made unique. If it is left blank, a unique alias will be produced from the name portion of the e-mail address (the part to the left of the "@" sign). 
	Comment 
	In the following columns, as many as needed, put the names of any mailing lists (address list, distribution lists, etc.) that you want this address to be included in.
	
	Two Examples:
	
	Using only column 1
	jdavidson@interguru.com
	Using Columns 1 and 4
	jdavidson@interguru.com<tab><tab>jhd
				
The spaces in the example are tabs.

A full Example ------------------------------------------------

jhd@radix.net	Joe	Davidson1	jhd	comment1	lista
jdavidson@interguru.com	Joe	Davidson2			lista	listb
jhd@radix.net	Joe	Davidson3		comment3
jhd@radix.net	Joe	Davidson4		comment4	listb	listc
kingtut@noplace.edu	King Tut
queeenofsheba@kush.com

------------------------------------------------------
=head1 METHODS

=head2 new

no arguments needed.

=head2 scan

Input : a reference to an array containing a tsv file or a reference to a scalar containing
	the file name with the tsv data.
Returns:  a reference to a STF ( see above).

=head2 output

Input:  a reference to a STF ( see above).
Returns : a reference to an array containing a tsv file.


=head1 LIMITATIONS

This only converts email address, aliases, and mailing lists.  Phone numbers,
postal addresses and other such data are not converted.



=head1 REFERENCES



		

=head1  HISTORY

This code is derived from the code used on www.interguru.com/mailconv.htm .  The site 
has been up since 1996 ( but ldif was only included on 1997, when Netscape 3  started
using it.)  The site gets about 8000 unique visitors a month, many of whom make addressbook
conversions. The code has been well tested.

=head1 FUTURE DIRECTIONS




=head1 SEE ALSO



=head1 BUGS

=head1 CHANGES

Original Version 2001-Sept-09
                  
=head1 COPYRIGHT

Copyright (c) 2001 Joe Davidson. All rights reserved.
This program is free software; you can redistribute it 
and/or modify it under the terms of the Perl Artistic License
(see http://www.perl.com/perl/misc/Artistic.html). or the
GPL copyleft license ( http://www.gnu.org/copyleft/gpl.html) 


=head1 AUTHOR

Mail::Addressbook::Convert was written by Joe Davidson  <jdavidson@interguru.com> in 2001.

=cut

#------------------------------------------------------------------------------

use strict;

use Mail::Addressbook::Convert::Genr;

package  Mail::Addressbook::Convert::Tsv;


use  5.001;

use vars qw(@ISA );
@ISA = qw { Mail::Addressbook::Convert::Genr };

#############  Constructor ##########################################

# new is inherited

	
######################################################################

sub scan
{
	my $Csv = shift;
	my $inputParm=shift;
	$Csv->setfileFormat("tsv");
	$Csv->SUPER::scan($inputParm);


}
 # sub output is inherited from genr.

sub output
{
	my $Csv = shift;
	my $inputParm=shift;
	$Csv->setfileFormat("tsv");
	$Csv->SUPER::output($inputParm);


}

1;