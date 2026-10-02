{config, lib, modules, agenix, ...}:


{

  age.secrets = {
    test = {
      file = ../secrets/secret1.age;
      owner = "luka";
      group = "users";
      mode = "0600";
    };
    githubssh = {
      file = ../secrets/githubssh.age;
      owner = "luka";
      group = "users";
      mode = "0600";
    };
    githubssh_pub = {
      file = ../secrets/githubssh_pub.age;
      owner = "luka";
      group = "users";
      mode = "0600";
    };
   
  };

}
