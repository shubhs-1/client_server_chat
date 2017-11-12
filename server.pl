use IO::Socket::INET;
# flush after every write
$| = 1;

my ($socket,$client_socket);
my ($peeraddress,$peerport);

$socket = new IO::Socket::INET (
LocalHost => '127.0.0.1',
LocalPort => '5000',
Proto => 'tcp',
Listen => 5,
Reuse => 1
) or die "ERROR in Socket Creation : $!\n";

print "SERVER Waiting client connection on port 5000\n";

$client_socket = $socket->accept();

$peer_address = $client_socket->peerhost();
$peer_port = $client_socket->peerport();

print "Accepted New Client Connection From : $peeraddress, $peerport\n ";

while(1)
{
print "Write your message for client::";
$data=<STDIN>;
$client_socket->send($data);
$data = <$client_socket>;
print "Received from Client : $data\n";
}
#$socket->close();
