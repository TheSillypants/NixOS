{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            swap = {
              size = "8G";
	      content = {
	        type = "swap";
		randomEncryption = true;
		priority = 100;
		resumeDevice = false;
	      };
	    };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "NixOS-LUKS";
                extraOpenArgs = [ ];
		passwordFile = "/tmp/secret.key";
                settings = {
                  allowDiscards = true;
                };
                content = {
                  type = "zfs";
                  pool = "NixOS";
                };
              };
            };
          };
        };
      };
    };
    zpool = {
      NixOS = {
        type = "zpool";
        rootFsOptions = {
          mountpoint = "none";
	  compression = "zstd";
	  acltype = "posixacl";
	  xattr = "sa";
        };
        options.ashift = "12";
        datasets = {
          "root" = {
	    type = "zfs_fs";
	    mountpoint = "/";
            postCreateHook = "zfs snapshot NixOS/root@blank";
	  };
	  "nix" = {
	    type = "zfs_fs";
	    mountpoint = "/nix";
	  };
	  "persist" = {
	    type = "zfs_fs";
	    mountpoint = "/persist";
	  };
        };
       };
      };
    };
}
