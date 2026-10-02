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
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "NixOS";
                extraOpenArgs = [ ];
		passwordFile = "/tmp/secret.key";
                settings = {
                  allowDiscards = true;
                };
                content = {
                  type = "lvm_pv";
                  vg = "NixVG";
                };
              };
            };
          };
        };
      };
    };
    lvm_vg = {
      NixVG = {
        type = "lvm_vg";
        lvs = {
          zfs = {
            size = "100%";
            content = {
              type = "zfs";
	      pool = "NixOS";
            };
          };
          swap = {
            size = "8G";
            content = {
              type = "swap";
              discardPolicy = "both";
	      resumeDevice = false;
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
