let
  master = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKmOpaMT4tRogFiQzz8chVBA9ehl7DGcZe+k8OPKW/ec";
  masterkey = [ master ];

  
  luka = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKUqE5Pl1DbgSGpzLS7ZpL5IrgTQ984sdhVUWOOB2Lfk";
  users = [ luka ];

  hephaestus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIeFv4ACdJdMt0o28gAAZvnSK576zAaojFxeS90QENdV";
  systems = [ hephaestus ];
in
{
  "secret1.age".publicKeys = users ++ systems ++ masterkey;
  "githubssh.age".publicKeys = users ++ systems ++ masterkey;
  "githubssh_pub.age".publicKeys = users ++ systems ++ masterkey;


}
