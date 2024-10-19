## Install xremap tool: 	*cargo install xremap \--features gnome*

[https://github.com/xremap/xremap](https://github.com/xremap/xremap)

## Create config.yaml

*vi \~/.config/xremap/config.yaml*  
Content:  
    *modmap:*  
      *\- name: CapsLock to RightCtrl/Esc*  
        *remap:*  
          *CapsLock:*  
            *held: Ctrl\_R*  
            *alone: Esc*  
            *alone\_timeout: 100*

## Add user ‘mady’ to input group

	This is to prevent the service we are going to create from running in the background without root privileges.  
*sudo gpasswd \-a mady input*  
*echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/input.rules*

## Create systemd service

*sudo vi /etc/systemd/system/xremap.service*  
Content:  
*\[Unit\]*  
*Description=xremap*  
*After=bluetooth.target*  
*Requires=bluetooth.target*

*\[Service\]*  
*ExecStartPre=/bin/sleep 5*  
*ExecStart=/home/mady/.cargo/bin/xremap /home/mady/.config/xremap/config.yaml*  
*Restart=always*  
*User=mady*  
*Environment=DISPLAY=:0*

*\[Install\]*  
*WantedBy=default.target*

*sudo systemctl daemon-reload 	–to recognize the new service*  
*sudo systemctl enable xremap	–enable the service to start on boot*  
*sudo systemctl start xremap		–start the service immediately without rebooting*

