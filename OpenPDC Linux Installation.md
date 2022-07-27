# OpenPDC Linux Installation

# 💿 Prerequisites

- Install Mono
    
    ```bash
    sudo apt install gnupg ca-certificates
    
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
    
    echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
    
    sudo apt update
    
    sudo apt install mono-devel
    ```
    
- Install wget, unzip and sqlite
    
    ```bash
    sudo apt install wget unzip sqlite3
    ```
    
- Install Build-Essential
    
    ```bash
    sudo apt install build-essential
    ```
    
- Install PAM Libraries
    
    ```bash
    sudo apt install libpam0g-dev
    ```
    

# 🗃️ Download and Install

- Download OpenPDC POSIX release
    
    ```bash
    wget https://github.com/GridProtectionAlliance/openPDC/releases/download/v2.9.148/openPDC-POSIX.zip
    ```
    
- Unzip POSIX release
    
    ```bash
    unzip openPDC-POSIX.zip
    ```
    
- Find a suitable install location, e.g., /opt/
    
    ```bash
    sudo mv openPDC /opt
    
    cd /opt/openPDC
    ```
    
- Generate a service certificate
    
    ```bash
    mono MonoGenCert.exe openPDC
    ```
    
- Enable local user auth for OpenPDC (must run as root)
    
    ```bash
    sudo bash [enable-security.sh](http://enable-security.sh/)
    ```
    
- Add current user as initial OpenPDC admin (must run as user)
    
    ```bash
    bash [add-user.sh](http://add-user.sh/)
    ```
    
- Register OpenPDC service to run as a daemon (must run as root)
    
    ```bash
    sudo bash [register-openPDC.sh](http://register-openpdc.sh/)
    ```
    

# ⚙️ Execution

- Run Web Management Interface
    - Open browser and visit http://localhost:8280/
    - **Authenticate on web login page**
        
        `domain\username` or  `.\username`
        
        Once logged in you can navigate to `Settings > Users` on the main menu to add other users.
        
    - **Other Services**
        - Statistics metadata web service
            
            http://localhost:6051/historian/metadata/read/xml
            
        - Statistics data web service
            
            http://localhost:6052/historian/timeseriesdata/read/current/32/json
            
        - Grafana OpenHistorian data source for statistics
            
            http://localhost:6057/api/grafana
            
        - Alarm web service
            
            http://localhost:5018/alarmservices/raisedalarms/all/json
            
- Run Console
    
    ```bash
    cd ~
    mono /opt/openPDC/openPDCConsole.exe
    ```
    
    Authenticate as requested.
    
    To login as another user, enter `login` command into console.
    
    Enter command `exit` to exit console application. OpenPDC will continue to run.
    
- Control Daemon
    
    Stop OpenPDC Daemon
    
    ```bash
    sudo /opt/openPDC/openPDC stop
    ```
    
    Restart OpenPDC Daemon
    
    ```bash
    sudo /opt/openPDC/openPDC start
    ```
    

# 😵 Uninstall

- Unregister Daemon
    
    ```bash
    cd /opt/openPDC
    sudo bash register-openPDC.sh -u
    ```
    
- Remove OpenPDC Folder
    
    ```bash
    cd /opt
    sudo rm -rdf openPDC
    ```
    
- Remove User Cache
    
    ```bash
    cd ~/.config/Grid\ Protection\ Alliance/
    rm -rdf openPDCConsole
    ```