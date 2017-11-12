use IO::Socket::INET;
# flush after every write
$| = 1;
my ($socket,$client_socket);

$socket = new IO::Socket::INET (
PeerHost => '127.0.0.1',
PeerPort => '5000',
Proto => 'tcp',
) or die "ERROR in Socket Creation : $!\n";

print "TCP Connection Success.\n";
while(1){
	
	$data = <$socket>;
	print "Received from Server : $data\n";
	print "Write your message for server::";
	$data = <STDIN>;
	$socket->send($data);
}
#sleep (10);
#$socket->close();
