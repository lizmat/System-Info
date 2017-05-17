use v6.c;
use System::Info::Base;

unit class System::Info::Darwin:ver<0.0.1> is System::Info::Base;

my %mapper =
  'CPU Speed'             => 'speed',
  'CPU Type'              => 'type',
  'Kernel Version'        => 'kernel',
  'Machine Model'         => 'model',
  'Machine Name'          => 'name',
  'Memory'                => 'memory',
  'Model Identifier'      => 'model',
  'Model Name'            => 'name',
  'Number of Processors'  => 'cpus',
  'Number Of Processors'  => 'cpus',
  'Number Of CPUs'        => 'cpus',
  'Processor Name'        => 'type',
  'Processor Speed'       => 'speed',
  'System Version'        => 'system',
  'Total Number of Cores' => 'cores',
  'Total Number Of Cores' => 'cores',
;

method new() { state $ = self.bless( |self!system-profiler ) }

method !system-profiler() {
    my %p =
      qx'/usr/sbin/system_profiler -detailLevel mini SPHardwareDataType SPSoftwareDataType'
      .lines
      .map( {
          if .contains(": ") {
              my ($key,$value) = .split(": ")>>.trim;
              if %mapper{$key} -> $mapped { $mapped => $value }
          }
      } );
    
    {
        cpu      => "%p<model> (%p<speed>)",
        cpu-type => %p<type>,
        (memory  => %p<memory> if %p<memory>),
        ncpu     => %p<cpus> ~ (" [%p<cores> cores]" if %p<cores>),
        os       => "%p<kernel> (%p<system>)",
    }
}

=begin pod

=head1 NAME

System::Info::Darwin - System::Info for incarnations of macOS

=head1 DESCRIPTION

Encapsulate the logic for System::Info on incarnations of macOS.

=head1 AUTHOR

Elizabeth Mattijsen <liz@wenzperl.nl>

=head1 COPYRIGHT AND LICENSE

Copyright 2017 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

=finish

/usr/sbin/system_profiler -detailLevel mini SPHardwareDataType SPSoftwareDataType

Hardware:

    Hardware Overview:

      Model Name: MacBook Pro
      Model Identifier: MacBookPro13,3
      Processor Name: Intel Core i7
      Processor Speed: 2,9 GHz
      Number of Processors: 1
      Total Number of Cores: 4
      L2 Cache (per Core): 256 KB
      L3 Cache: 8 MB
      Memory: 16 GB
      Boot ROM Version: MBP133.0226.B11
      SMC Version (system): 2.38f6

Software:

    System Software Overview:

      System Version: macOS 10.12.3 (16D32)
      Kernel Version: Darwin 16.4.0
      Time since boot: 6 days 17:25

