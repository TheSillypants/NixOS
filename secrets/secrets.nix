let 
  luka = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKUqE5Pl1DbgSGpzLS7ZpL5IrgTQ984sdhVUWOOB2Lfk";
  users = [ luka ];

  hephaestus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIeFv4ACdJdMt0o28gAAZvnSK576zAaojFxeS90QENdV";
  systems = [ hephaestus ];
in
{
  "secret1.age".publicKeys = users ++ systems;
  "githubssh.age".publicKeys = users ++ systems;
  "githubssh_pub.age".publicKeys = users ++ systems;


}
