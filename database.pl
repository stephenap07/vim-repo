#!/usr/bin/perl

use warnings; 
use strict; 

use Data::Dumper; 

# a stupid little test database, making use of functions

my @db = &prompt_cd (); 
&print_db ( ( &select (\@db, "jimi hendrix")) ); 

sub make_cd { 
  my ($title, $artist, $rating, $ripped) = @_; 

  my %hash = ( 
      title  => $title, 
      artist => $artist, 
      rating => $rating, 
      ripped => $ripped,
      );	

  \%hash; 
}

sub select { 
  my @dbb   = @{$_[0]};  
  my $match = $_[1]; 
  my @ar; 
  foreach my $i (@dbb) { 	
    while ( my($key, $value) = each %$i) { 
      if ($match eq $value) {
        push @ar, $i; 
      }
    }
  }

  \@ar; 
}

sub prompt_att { 
  print "$_[0]: "; 
  chomp (my $i = <STDIN>);  
  $i; 
}

sub prompt_cd { 
  my $i; 
  my @arr; 
  do { 
    push @arr, make_cd(
        prompt_att("title"), 
        prompt_att("artist"),	
        prompt_att("rating"),
        ( ((prompt_att("ripped [y/n]") =~ /y/i ) ? 'y' : 'n'))); 

    print "add another? [y/n] ";
    chomp ($i = <STDIN>); 
  } while ( $i eq 'y');

  return @arr; 
}

sub print_hash { 
  my $aaRef = shift; 
  while( my($key, $value) = each %{$aaRef}) { 
    print "$key:\t$value\n"; 
  }
}

sub print_db { 
  foreach my $i ( @_{$_[0]} ) { 	
    print_hash( $i ); 
    print "\n"; 
  }
}
