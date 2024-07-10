{config, pkgs, ...} :
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 35;
        output = [
          "eDP-1"
        ];

        modules-left = [ "custom/logo" "sway/workspaces" "sway/mode" "sway/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "memory" "temperature" "custom/sep" "backlight" "battery" "custom/sep" "custom/bluetooth" "network" "custom/sep" "sway/language" "idle_inhibitor"];

        "custom/logo" = {
          format = "";
          tooltip = false;
          on-click = ''bemenu-run --accept-single  -n -p "Launch" --hp 4 --hf "#ffffff" --sf "#ffffff" --tf "#ffffff" '';
        };

        "custom/bluetooth" = {
          exec = "python3 ~/.config/waybar/bluetooth.py status";
          return-type =  "json";
          format = " {}";
          interval = 10;
          on-click = "python4 ~/.config/waybar/bluetooth.py toggle";
          signal = 8;
          tooltip = true;
        };

        "cpu" = {
          tooltip = true;
          format = "  {usage}%";
        };

        "memory" = {
          tooltip = true;
          format = "  {}%";
        };

        "network" = {
          format-wifi = "  ({signalStrength}%)";
          format-ethernet = " ";
          format-linked = "  {ifname} (No IP)";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          tooltip = true;
          interval = 30;
        };

        "temperature" = {
          critical-threshold = 70;
          "thermal-zone" = 6;
          format-critical =  " {temperatureC}°C";
          format = " {temperatureC}°C";
          tooltip = false;
          interval = 10;
        };

        "custom/sep" = {
          format = " | ";
          interval = "once";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          interval = 100;
        };

        "backlight" =  {
          format =  "{icon} {percent}%";
          format-alt-click = "click-right";
          format-icons =  [""];
          on-scroll-down =  "light -A 1";
          on-scroll-up =  "light -U 1";
        };

        "sway/workspaces" = {
          format = "{name}";
          disable-scroll = true;
          all-outputs = true;
          disable-click = true;
        };

        "sway/mode" = {
          format = " {}";
          tooltip = false;
        };

        "sway/window" = {
          max-length =  50;
          tooltip = false;
        };

        "sway/language" = {
          format = "{shortDescription}";
          tooltip = false;
          on-click = ''swaymsg input "1:1:AT_Translated_Set_2_keyboard" xkb_switch_layout next'';

        };

        "clock" = {
          interval = 30;
          tooltip = false;
          format = "    {:%I:%M %p |   %d/%m %a}  ";
        };

        "battery" = {
          format = "{icon}  {capacity}%";
          format-icons =  [""  ""  ""  ""  ""];
          format-charging =" {capacity}%";
          interval = 30;
          states ={
            warning = 25;
            critical = 10;
          };
          tooltip = true;
        };
      };
    };
    style = ''
        * {
          border: none;
          border-radius: 0;
          padding: 0;
          margin: 0;
          font-size: 13px;
          font-family: UbuntuMono Nerd Font;
          background: transparent;
        }

        window {
          color:      rgba(217, 216, 216, 1);
          background: rgba(15, 22, 30, .50);
        }

        #custom-logo {
          font-size: 18px;
          margin: 0;
          margin-left: 7px;
          margin-right: 12px;
          padding: 0;
          font-family: NotoSans Nerd Font Mono;
        }

        window#waybar.solo {
          background: rgba(15, 22, 30, .50);
        }

        #workspaces {
          border-radius: 10px;
          margin-right: 10px;
          transition: none;
        }

        #workspaces button {
          transition: none;
          color:      white;
          padding: 5;
          font-size: 20;
        }

        #workspaces button.visible {
          color:      white;
          border-bottom: 3px solid #9aedfe;
        }


        #workspaces button.focused {
          border-bottom: 3px solid #fba922;
          color: #9aedfe;
        }

        #workspaces button.unfocused {
          border-bottom: 3px solid #9aedfe;
          color: #9aedfe;
        }


        #workspaces button:hover {
          border-bottom: 3px solid #ff79c6;
          transition: none;
          box-shadow: inherit;
          text-shadow: inherit;
          color: #ff79c6;
        }

        #workspaces button.urgent {
          color:      white;
          background:      rgba(238, 46, 36, 1);
        }

        #mode{
          margin:     0px 6px 0px 5px;
          min-width:  25px;
        }

        #clock {
          margin-left: 2px;
          margin-right: 2px;
          padding-left: 5px;
          padding-right: 5px;
          transition: none;
          color: white;
        }

        #network {
          margin-left: 2px;
          margin-right: 2px;
          padding-left: 5px;
          padding-right: 5px;
          border-radius: 10px;
          transition: none;
          color: white;
        }

        #cpu {
          margin-left: 2px;
          margin-right: 2px;
          padding-left: 5px;
          padding-right: 0px;
          border-radius: 10px;
          transition: none;
          color: white;
        }

        #memory {
          margin-left: 2px;
          margin-right: 2px;
          padding-left: 5px;
          padding-right: 5px;
          border-radius: 10px;
          transition: none;
          color: white;
        }

        #battery {
          margin-left: 2px;
          margin-right: 2px;
          padding-left: 5px;
          padding-right: 0px;
          border-radius: 10px;
          transition: none;
          color: white;
        }

        #battery.warning {
          color: rgba(255, 210, 4, 1);
        }

        #battery.critical {
          color: rgba(238, 46, 36, 1);
        }

        #battery.charging {
          color: rgba(217, 216, 216, 1);
        }
        #battery.full {
          color: rgba(154, 205, 50, 0.85);
        }

        #temperature.critical {
          color: rgba(238, 46, 36, 1);
        }

        #custom-icon {
          padding-left: 10px;
          padding-right: 10px;
          border-radius: 1px;
          color:#1e88e5;
          font-size: 20px;
        }

        #idle_inhibitor {
          padding-right: 20px;
          font-size: 15px;
        }

        #idle_inhibitor.activated {
          padding-right: 20px;
          color: green;
        }

        #idle_inhibitor.deactivated {
          padding-right: 20px;
          color: red;
        }

        #custom-bluetooth.active {
          color: blue;
        }

        #custom-bluetooth.inactive {
          color: white;
        }

        #language {
          margin-right: 7px;
        }

    '';
  };
}
