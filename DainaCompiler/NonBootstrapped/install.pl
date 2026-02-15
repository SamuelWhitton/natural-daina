#!/usr/bin/perl -w

use strict;
use File::Path qw(make_path);
use Cwd 'abs_path';
use File::Basename;


my $perlCommandLineScriptTop = "#!/usr/bin/perl -w

use strict;
use Getopt::Long;

my \$dainaCompilerLocation = \"";

my $perlCommandLineScriptBase = <<'END_SCRIPT';
";
my $dainaLibraryInstallPath = $dainaCompilerLocation."NormalDainaDefinitions/";

my $helpFlag;
my $showLibsFlag;
my @compilationInputFiles;
my @librariesToIncludeInCompilation;
my $compilationOutput;
my $cSourceOutputOnlyFlag;

GetOptions (	"help" => \$helpFlag, 
              	"compile=s{1,}"   => \@compilationInputFiles,  
              	"libs=s{1,}" => \@librariesToIncludeInCompilation,
				"showlibs" => \$showLibsFlag,
              	"output=s{1}" => \$compilationOutput,
              	"conly" => \$cSourceOutputOnlyFlag
            );  



my $usageString = 
"OVERVIEW: Daina Compiler

USAGE: daina [options]

DAINA INSTALL LOCATION: $dainaCompilerLocation
DAINA LIBRARY INSTALLATION PATH: $dainaLibraryInstallPath

OPTIONS:
   -compile [files]\tInput Daina (.dai) files to compile
   -conly\t\tDo not try to compile the Daina C output using gcc, just output the C source (the inbuilt gcc flags and linking may not work for all configurations)
   -help\t\tShow help and usage information
   -libs [files]\tLibraries to include in compilation (find libraries using -showlibs flag)
   -output [file]\tDetermines where compiled executable and c source will be placed, <file>.c will be the c source output of Daina, <file> will be the executable
   -showlibs\t\tList currently installed libraries
";

if (defined $showLibsFlag) {
	opendir(my $dainaLibraryInstallDirectory, $dainaLibraryInstallPath) or die "Can't access Daina library installation path: $!";
	my @dainaLibraryInstallSubdirectories = grep { /^[^.]/ && -d "$dainaLibraryInstallPath/$_" } readdir($dainaLibraryInstallDirectory);
	closedir $dainaLibraryInstallDirectory;
	print join( "\n", @dainaLibraryInstallSubdirectories )."\n";

} elsif (@compilationInputFiles) {
	my $libraryToIncludeInCompilation;
	foreach $libraryToIncludeInCompilation (@librariesToIncludeInCompilation) {
		my @dainaCompilationFilesInThisLibrary = glob "$dainaLibraryInstallPath$libraryToIncludeInCompilation/*.dai";
		if (scalar @dainaCompilationFilesInThisLibrary < 1) {
			die "Could not find reference to library: $libraryToIncludeInCompilation\n";
		}
		@compilationInputFiles = (@compilationInputFiles, @dainaCompilationFilesInThisLibrary);
	}

	if (!(defined $compilationOutput)) {
		die "Requires output file location to compile (set with the -output flag)\n";
	}

	system("$dainaCompilerLocation".'daina', "$compilationOutput".'.c', @compilationInputFiles);

	if (!(defined $cSourceOutputOnlyFlag)) {
        if ($^O eq 'darwin') {
                system('gcc', '-pthread',  '-Wno-deprecated-declarations', '-framework', 'OpenGL', '-framework', 'GLUT', '-o', "$compilationOutput", "$compilationOutput".'.c');
        } else {
                system('gcc', '-pthread',  '-Wno-deprecated-declarations', '-o', "$compilationOutput", "$compilationOutput".'.c');
        }
    }

} else {
	print $usageString;
}
END_SCRIPT

my $dainaInstallFilePath = $ENV{"HOME"}."/Daina/";
my $fileLocationForDainaCommandLine = '/usr/local/bin/daina';

#print "Choose install path, press enter to use default [$dainaInstallFilePath]: ";
#my $customDainaInstallFilePath = <STDIN>;
#chomp $customDainaInstallFilePath;
#if (!($customDainaInstallFilePath eq "")) {
#	$dainaInstallFilePath = $customDainaInstallFilePath;
#}

#print "Choose file location for command line executable, press enter to use default [$fileLocationForDainaCommandLine]: ";
#my $customfileLocationForDainaCommandLine = <STDIN>;
#chomp $customfileLocationForDainaCommandLine;
#if (!($customfileLocationForDainaCommandLine eq "")) {
#	$fileLocationForDainaCommandLine = $customfileLocationForDainaCommandLine;
#}


print "Daina installation file path: $dainaInstallFilePath\n";
print "Location of Daina command line: $fileLocationForDainaCommandLine\n";

if (-e $dainaInstallFilePath and -d $dainaInstallFilePath) {
	die "Installation path already exists at $dainaInstallFilePath, please use a different path, or remove existing installation.\n";
}


my $perlCommandLineScript = $perlCommandLineScriptTop.$dainaInstallFilePath.$perlCommandLineScriptBase;

open(my $fileForDainaCommandLine, '>', $fileLocationForDainaCommandLine) or die "Could not install daina command line at path: $fileLocationForDainaCommandLine (probably an issue with permissions)";
print $fileForDainaCommandLine $perlCommandLineScript;
close $fileForDainaCommandLine;
chmod 0755, $fileLocationForDainaCommandLine;


eval { make_path($dainaInstallFilePath) };
if ($@) {
  print "Couldn't create $dainaInstallFilePath: $@";
}

my $currentDirectoryOfRunningInstallScript = dirname(abs_path($0)).'/';
system('bash', "$currentDirectoryOfRunningInstallScript".'compile.sh');

system('cp', '-R', "$currentDirectoryOfRunningInstallScript".'NormalDainaDefinitions', "$dainaInstallFilePath");
system('cp', '-R', "$currentDirectoryOfRunningInstallScript".'DainaExamples', "$dainaInstallFilePath");
system('cp', '-R', "$currentDirectoryOfRunningInstallScript".'DainaCompiler', "$dainaInstallFilePath");

system('cp', "$currentDirectoryOfRunningInstallScript".'daina', "$dainaInstallFilePath");



print "Finished Installation of Daina.\n";





