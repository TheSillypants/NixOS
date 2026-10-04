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
    steropes-luka_passwd = {
      file = ../secrets/steropes-luka_passwd.age;
      mode = "0600";
    };

    steropes-deploykey = {
      file = ../secrets/steropes-deploykey.age;
      mode = "0600";
    };

    steropes-deploykey_pub = {
      file = ../secrets/steropes-deploykey_pub.age;
      mode = "0600";
    };
   
  };

}
