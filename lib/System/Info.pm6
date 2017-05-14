use v6.c;
unit class System::Info:ver<0.0.1>;

# list classes in alphabetical order
use System::Info::Darwin;
use System::Info::Generic;

method new() {
    given VM.osname {
        when m:i/darwin/ { System::Info::Darwin.new }

        default          { System::Info::Generic.new }
    }
}

=begin pod

=head1 NAME

System::Info - Factory for system specific information objects

=head1 SYNOPSIS

  use System::Info;

  my $si = System::Info.new;  # returns a System::Info::xxx subclass

  say "Hostname:              $si.host()";
  say "Number of CPU's:       $si.ncpu()";
  say "Processor type:        $si.cpu_type()"; # short
  say "Processor description: $si.cpu()";      # long
  say "OS and version:        $si.os()";

=head1 DESCRIPTION

System::Info tries to present system-related information, like number of CPU's, architecture, OS and release related information in a system-independent way. This releases the user of this module of the need to know if the information comes from Windows, Linux, BSD, MacOS, and if the architecture is i386, x64, pa-risc2, or arm.

=head1 AUTHOR

Elizabeth Mattijsen <liz@wenzperl.nl>

=head1 COPYRIGHT AND LICENSE

Copyright 2017 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
