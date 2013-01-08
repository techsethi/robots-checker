#!perl -w
use strict;
use Net::SMTP;

my $log_dir = "./logs";

my ($sec, $min, $hr, $day, $mon, $year) = localtime;

my $timestamp = sprintf("%02d_%02d_%04d_%02d_%02d_%02d\n", $day, $mon + 1, 1900 + $year, $hr, $min, $sec);

my $log_file = "$log_dir/mongoose.log.$timestamp";

$log_file =~ s/\s+//g;
$log_file =~ s/\\/_/g;

print "Running : cucumber -f html > $log_file\n";

my $return_val = `cucumber -f html` ;

print "Return val : $return_val" ;

$return_val =~ s/<title>Cucumber<\/title>/<title>Timescity Mongoose ($timestamp)<\/title>/;

$return_val =~ s/<h1>Cucumber Features<\/h1>/<h1>Timescity Mongoose<\/h1>/;

open (LOG, "> $log_file") || die "Could not open log file for writing : $!";
print LOG $return_val;
close LOG;

## =========
my $smtp = Net::SMTP->new("smtp.gmail.com", Debug => 1 );
 
$smtp->mail("pradeep.sethi\@indiatimes.co.in");
$smtp->to("pradeep.sethi\@indiatimes.co.in");

$smtp->data();
$smtp->datasend("Subject: Mongoose Output : $timestamp\r\n");
$smtp->datasend("\n");

$smtp->datasend($return_val);

$smtp->dataend();

$smtp->quit;
