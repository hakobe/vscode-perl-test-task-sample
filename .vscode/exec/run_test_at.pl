use strict;
use warnings;

my ($filename, $line_num) = @ARGV;

sub fetch_sub_name {
    my ($filename, $line_num) = @_;

    open my $fh, '<', $filename;
    my @lines = <$fh>;
    close $fh;

    my $n = 1;
    my ($sub_line) = reverse map { $_->{line} } grep {
        $_->{line_num} <= $line_num &&
        $_->{line} =~ m/^\s*sub\b/;
    } map { +{line_num => $n++, line => $_} } @lines;

    my ($sub_name) = $sub_line =~ m/^\s*sub\s+(\w+)/;

    return $sub_name;
}

my $sub_name = fetch_sub_name($filename, $line_num) if defined($line_num);

my @cmd = $sub_name ? 
    ('env', "TEST_METHOD=$sub_name", 'carton', 'exec', '--', 'prove', '-v', $filename) :
    ('carton', 'exec', '--', 'prove', '-v', $filename) ;

system(@cmd);