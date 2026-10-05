{ config, pkgs, inputs, lib, ... }:


let firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in {
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    profiles.default = {
      presets.betterfox.enable = true;

      containersForce = true;
      spacesForce = true;
      
      containers = {
        Personal = {
	  color = "green";
	  icon = "tree";
	  id = 1;
	};

	School = {
	  color = "red";
	  icon = "fruit";
	  id = 2;
	};

	Tracked = {
	  color = "orange";
	  icon = "fingerprint";
	  id = 3;
	};
      };

      spaces = {
        "Personal" = {
	  id = "bf222fd6-3c94-4cd2-8ccd-d3ea7a5f1aca";
	  position = 1000;
	  icon = "🏠";
          container = 1;
	  theme = {
	    type = "gradient";
	    colors = [
	      {
	        red = 120;
		green = 55;
		blue = 175;
		algorithm = "floating";
		type = "explicit-lightness";
		lightness = 25;
	      }
	    ];
	    opacity = 0.8;
	    texture = 0.1;
	  };
	};
      };


     extensions = {
       packages = with firefox-addons; [
	 ublock-origin
	 bitwarden
	 bypass-paywalls-clean
       ];
     };

      
 
      extensionButtons = {
        "zen-sidebar-top-buttons" = [
	  "uBlock0@raymondhill.net"
	  "{446900e4-71c2-419f-a6a7-df9c091e268b}"
	];
      };

    };
  };


}
