let
  master = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKmOpaMT4tRogFiQzz8chVBA9ehl7DGcZe+k8OPKW/ec";
  masterkey = [ master ];

  
  luka = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKUqE5Pl1DbgSGpzLS7ZpL5IrgTQ984sdhVUWOOB2Lfk";
  users = [ luka ];

  hephaestus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIeFv4ACdJdMt0o28gAAZvnSK576zAaojFxeS90QENdV";
  steropes = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGsSg+blqiT6SELheuaYcOrmG73CLU3I6uN5LPZsXZyU";
  systems = [ hephaestus steropes ];

  allkeys = users ++ systems ++ masterkey;
in
{
  "secret1.age".publicKeys = allkeys;
  "githubssh.age".publicKeys = allkeys;
  "githubssh_pub.age".publicKeys = allkeys;
  "steropes-luka_passwd.age".publicKeys = allkeys;
  "steropes-deploykey.age".publicKeys = allkeys;
  "steropes-deploykey_pub.age".publicKeys = allkeys;
  "nmconnection-home.age".publicKeys = allkeys;
  "nmconnection-school.age".publicKeys = allkeys;


}
