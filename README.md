NAME
====

System::Info - Factory for system specific information objects

SYNOPSIS
========

    use System::Info;

    my $si = System::Info.new;
 
    say "Hostname:              $si.host()";
    say "Number of CPU's:       $si.ncpu()";
    say "Processor type:        $si.cpu_type()"; # short
    say "Processor description: $si.cpu()";      # long
    say "OS and version:        $si.os()";;

DESCRIPTION
===========

System::Info tries to present system-related information, like number of CPU's, architecture, OS and release related information in a system-independent way. This releases the user of this module of the need to know if the information comes from Windows, Linux, BSD, MacOS, and if the architecture is i386, x64, pa-risc2, or arm.

AUTHOR
======

Elizabeth Mattijsen <liz@wenzperl.nl>

Based on the Perl 5 version of System::Info, written by H. Merijn Brandt and Abe Timmerman.

COPYRIGHT AND LICENSE
=====================

Copyright 2017 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
