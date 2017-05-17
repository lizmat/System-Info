use v6.c;
unit class System::Info::Base:ver<0.0.1>;

has $.hostname = try { chomp(qx/hostname/) } // 'unknown';
has $.ncpu     = '';
has $.cpu-type = '';
has $.cpu      = '';
has $.os       = VM.osname // 'unknown';
has $.memory   = 'unknown';

=begin pod

=head1 NAME

System::Info::Base - base class of System::Info

=head1 AUTHOR

Elizabeth Mattijsen <liz@wenzperl.nl>

=head1 COPYRIGHT AND LICENSE

Copyright 2017 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
