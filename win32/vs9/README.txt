Please do not build this package in a path that contains spaces to avoid
possible problems during the build or during the usage of the library.

Please refer to the following GNOME Live! page for more detailed
instructions on building ATK and its dependencies with Visual C++:

https://live.gnome.org/GTK%2B/Win32/MSVCCompilationOfGTKStack

This VS9 solution and the projects it includes are intented to be used
in a ATK source tree unpacked from a tarball. In a git checkout you
first need to use some Unix-like environment or manual work to expand
the .in files needed, mainly config.h.win32.in into config.h.win32.
You will also need to expand atk.vcprojin here into
atk.vcproj.

The dependencies for this package are gettext-runtime (libintl), GLib*
and ZLib.

You will also need a Python 2.7.x or 3.x installation, as Python will be
used to run glib-genmarshal, which was converted into a Python script from
a compiled C program, in addition to generating the atk.pc pkg-config
file for the build.  See PythonDir (32-bit builds) or PythonDirX64 (x64
builds) in atk-version-paths.vsprops to see that they point to the correct paths.

a) look for all of the dependencies (except GLib*) under

   http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/ (32-bit) -OR-
   http://ftp.gnome.org/pub/GNOME/binaries/win64/dependencies/ (64-bit)

   Please use the latest versions of these libraries that are available there,
   these are packaged by Tor Lillqvist, which are built with MinGW/GCC.
   Please see b) below regarding the build of  GLib*

-OR-

b) Build them yourself with VS9 (but you may most probably wish to get
   gettext-runtime from the URL(s) mentioned in a)).  Use the latest
   stable versions for them (you may need to get the latest unstable version of
   GLib if you are using an unstable version of ATK):

   GLib*:   Grab the latest sources from http://www.gtk.org under "Download"
            (stable only-please make a search for the latest unstable versions)
   ZLib:   http://www.zlib.net

   The above 2 packages all have supported mechanisms (Makefiles and/or Project
   Files) for building under VS9 (upgrade the Project Files from earlier VS
   versions will do for these, when applicable)

* This GLib refers to a build that is built by VS9

Set up the source tree as follows under some arbitrary top
folder <root>:

<root>\atk\<this-atk-source-tree>
<root>\vs9\<PlatformName>

*this* file you are now reading is thus located at
<root>\atk\<this-atk-source-tree>\win32\vs9\README.

<PlatformName> is either Win32 or x64, as in VS9 project files.

You should unpack the <dependent-package>-dev and <dependent-packge> (runtime)
into <root>\vs9\<PlatformName>, if you download any of the packages from

http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/ (32-bit) -OR-
http://ftp.gnome.org/pub/GNOME/binaries/win64/dependencies/ (64-bit)

so that for instance libintl.h end up at 
<root>\vs9\<PlatformName>\include\libintl.h.

If you build any of the dependencies yourselves, copy the: 
-DLLs and EXEs into <root>\vs9\<PlatformName>\bin
-headers into <root>\vs9\<PlatformName>\include\
-LIBs into <root>\vs9\<PlatformName>\lib

If you have not built GLib with VS9 and placed the LIBs and headers in a
place where VS9 can find them automatically, you should also uncompress
your GLib sources in <root>\ and build it from there, following the
instructions in <root>\glib<-version>\win32\vs9, so that the required
headers, EXEs, DLLs and LIBs will end up in
<root>\vs9\<PlatformName>\include\glib-2.0 (headers)
<root>\vs9\<PlatformName>\lib (LIBs, also glib-2.0/include/glibconfig.h)
<root>\vs9\<PlatformName>\bin (EXEs/DLLs)
respectively.

Building introspection files is now integrated in the solution files, but this is
not built by default.  In order for this to work, ensure that PythonDir (32-bit builds)
and/or PythonDirX64 (x64 builds) are set at the installation directory of where your
Python installation is.  Please note the following:

-This Python installation must be the same installation/configuration as the
 one that was used to build GObject-Introspection.

-g-ir-scanner needs to be found at <root>\vs9\<PlatformName>\bin, and the
 other Python items needs to be under <root>\vs9\<PlatformName>\lib\gobject-introspection.

-Use the rebuild command on this project, atk-introspect, to re-build or build for other
 configurations.

After the build of ATK, the "install" project will copy build results
and headers into their appropriate location under <root>\vs9\<PlatformName>.
For instance, built DLLs go into <root>\vs9\<PlatformName>\bin, built LIBs into
<root>\vs9\<PlatformName>\lib and atk headers into
<root>\vs9\<PlatformName>\include\atk-1.0. This is then from where
project files higher in the stack are supposed to look for them, not
from a specific ATK source tree.

--Chun-wei Fan <fanc999@yahoo.com.tw>
--(adapted from the GLib VS9 README.txt file originally written by Tor Lillqvist)
