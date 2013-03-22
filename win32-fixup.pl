#! e:/program files/perl/bin/perl.exe
#  version info can be found in 'configure.ac'

$package_string = "\"atk 2.7.91\"";
$package_version = "\"2.7.91\"";
$atk_version = "2.7.91";
$major = 2;
$minor = 7;
$micro = 91;
$binary_age = 207;
$interface_age = 0;
$gettext_package = "atk20";
$current_minus_age = 0;

sub process_file
{
        my $outfilename = shift;
	my $infilename = $outfilename . ".in";
	
	open (INPUT, "< $infilename") || exit 1;
	open (OUTPUT, "> $outfilename") || exit 1;
	
	while (<INPUT>) {
	    s/\@ATK_VERSION\@/$atk_version/g;
	    s/\@ATK_MAJOR_VERSION\@/$major/g;
	    s/\@ATK_MINOR_VERSION\@/$minor/g;
	    s/\@ATK_MICRO_VERSION\@/$micro/g;
	    s/\@ATK_BINARY_AGE\@/$binary_age/g;
	    s/\@ATK_INTERFACE_AGE\@/$interface_age/g;
	    s/\@GETTEXT_PACKAGE\@/$gettext_package/g;
	    s/\@LT_CURRENT_MINUS_AGE\@/$current_minus_age/g;
	    s/\@PACKAGE_STRING@/$package_string/g;
	    s/\@PACKAGE_VERSION@/$package_version/g;
	    s/\@VERSION@/$package_version/g;
	    print OUTPUT;
	}
}

process_file ("config.h.win32");
process_file ("atk/atkversion.h");

my $command=join(' ',@ARGV);
if ($command eq -buildall) {
	process_file ("atk/atk.rc");
}