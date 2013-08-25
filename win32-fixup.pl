#! e:/program files/perl/bin/perl.exe
#  version info can be found in 'configure.ac'

require "../local-paths.lib";

$package_string = "\"atk 2.9.04\"";
$package_version = "\"2.9.04\"";
$atk_version = "2.9.04";
$major = 2;
$minor = 9;
$micro = 4;
$binary_age = 20904;
$interface_age = 1;
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
	    s/\@GlibBuildRootFolder@/$glib_build_root_folder/g;
	    s/\@GenericIncludeFolder@/$generic_include_folder/g;
	    s/\@GenericLibraryFolder@/$generic_library_folder/g;
	    s/\@GenericWin32LibraryFolder@/$generic_win32_library_folder/g;
	    s/\@GenericWin32BinaryFolder@/$generic_win32_binary_folder/g;
	    s/\@Debug32TestSuiteFolder@/$debug32_testsuite_folder/g;
	    s/\@Release32TestSuiteFolder@/$release32_testsuite_folder/g;
	    s/\@Debug32TargetFolder@/$debug32_target_folder/g;
	    s/\@Release32TargetFolder@/$release32_target_folder/g;
	    s/\@TargetSxSFolder@/$target_sxs_folder/g;
	    print OUTPUT;
	}
}

process_file ("config.h.win32");
process_file ("atk/atkversion.h");

my $command=join(' ',@ARGV);
if ($command eq -buildall) {
	process_file ("atk/atk.rc");
	process_file ("msvc/atk.vsprops");
}