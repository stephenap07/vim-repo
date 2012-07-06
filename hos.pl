#!/usr/bin/perl 

use warnings; 
use strict; 

use Data::Dumper; 

# return array reference to query results of the worked_hours table. 
sub fetchHours { 
  my @hours; 

  return \@hours; 
}

# This function takes an employee_id and a timestamp and processes the worked record 
# hours to find gaps less than 30min between the last covered service hour and the next hour and if so, escalate those hours. 
# But if there is a less than 30min gap between the last hour and the next hour regardless of being covered or not, and if 
# the gap between the last covered service hour is more than 60min, then escalate the last hour instead.
# Insert hours with the specified begin_date, end hour as begin_time, end_date as begin_date, end_time as begin, service_type =1, duty_type, filled
sub fillHours {   
  my $employee_id; 
  my $timestamp; 

  return 1; 
}

# A more appropriate name for this function is getRested. 
# This function returns the number of rested periods based on 
# 10 hour gaps between the last timestamp and the next. 
sub checkRested { 
  my $employee_id; 
  my $timestamp; 

  my $rested_period = 0; 

  return $rested_period; 
}

# This function checks the worked record between the last rest period and the timestamp 
# for covered hours where if the begin_dt is less than the timestamp - 24hr, then 
#   covered_hours += hour->end_dt - timestamp - 24hr 
#   else covered_hours += hour->end_dt + hour->begin_dt 
#     return 0 on covered_hours >= 12hr
#     return 1 on everything else
sub check covered { 
  my $employee_id; 
  my $timestamp; 

  return 1; 
}

# This function check the worked record between hour_begin and hour_end
# for non-mistake and covered data. 
#   If there exists results, return 1 else 0 
sub checkNoncoveredCommentRequired { 
  my $employee_id; 
  my $hour_begin; 
  my $hour_end; 

  return 1; 
}

# This function takes in an hour_id and set the hour.need_comment = 1 
sub setComplianceIssue { 
  my $hour_id; 

}

sub verifyCompliance {                                                                                       
  my $self = shift;                                                                                          

  my $hours = $self->fetchHours();                                                                           
  if (defined $hours && $hours != 0 && scalar(@$hours)) {                                                    
    $self->fillHours($hours->[0]->{'worker_employee_id'}, $hours->[-1]->{'end_dt'});                           
    # This does all of the escalation for 1/2 hour periods.                                                 
  }                                                                                                          
  my $hours = $self->fetchHours();                                                                           

  my @issues;                                                                                                

  my $elapsed = 0;                                                                                           
  if( defined $hours && $hours != 0 && scalar(@$hours) ) {                                                   
    foreach my $hour (@$hours) {                                                                             
      if ($hour->{'service_type'}) {                                                                         
        if (!$self->checkRested($hours->[0]->{'worker_employee_id'},                                         
              $hour->{'begin_dt'})) {                                                      
          $self->setComplianceIssue($hour->{'worked_hours_id'}, $HOS::Issues::ISSUE_VALUES->{'10HOUR'});     
        }                                                                                                    
        elsif (!$self->checkRested($hours->[0]->{'worker_employee_id'},                                      
              $hour->{'end_dt'})) {                                                        
          $self->setComplianceIssue($hour->{'worked_hours_id'}, $HOS::Issues::ISSUE_VALUES->{'10HOUR'});     
        }                                                                                                    
      }                                                                                                      
      else {                                                                                                 
        if (!$self->checkNoncoveredCommentRequired($hours->[0]->{'worker_employee_id'},                      
              $hour->{'begin_dt'},                                      
              $hour->{'end_dt'})) {                                     
          $self->setCommentRequired($hour->{'worked_hours_id'});                                             
        }                                                                                                    
      }                                                                                                      

      if (!$self->checkCovered($hours->[0]->{'worker_employee_id'},                                          
            $hour->{'begin_dt'})) {                                                        
        $self->setComplianceIssue($hour->{'worked_hours_id'}, $HOS::Issues::ISSUE_VALUES->{'12HOURCOVERED'});
      }                                                                                                      
      elsif (!$self->checkCovered($hours->[0]->{'worker_employee_id'},                                       
            $hour->{'end_dt'})) {                                                          
        $self->setComplianceIssue($hour->{'worked_hours_id'}, $HOS::Issues::ISSUE_VALUES->{'12HOURCOVERED'});
      }                                                                                                      
    }                                                                                                        
  }                                                                                                          
  return \@issues;                                                                                           
}                                                                                                            

