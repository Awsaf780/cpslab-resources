# OpenPDC

## Update 11 September 2022

<aside>
⚠️ Download the scripts and make the executable

</aside>

```bash
# Change dir where scripts are present
chmod u+x *.sh
```

<aside>
⚙ Uninstall previous OpenPDC version

</aside>

```bash
# Run as root
sudo su

# Run uninstall script
./uninstall_openpdc.sh
```

<aside>
🔥 Install OpenPDC with dependencies

</aside>

```bash
# Must run as root
sudo su

# Run install script
./install_openpdc_full.sh
```

<aside>
📢 Register current user as initial OpenPDC admin

</aside>

```bash
# Register user (Here "awsaf" is just an example. Enter your current username)
sudo bash /opt/openPDC/add-user.sh -u awsaf

# Register openPDC as a service
sudo bash /opt/openPDC/register-openPDC.sh
```

<aside>
✅ Start OpenPDC Service

</aside>

```bash
# Run as Service
sudo /opt/openPDC/openPDC start

# Open Browser
localhost:8280

# Enter credentials
Example Username -> .\awsaf
Password -> youruserpass
```

<aside>
📌 Configure OpenPDC to archive data

</aside>

```bash
# Stop openPDC service if Running
sudo /opt/openPDC/openPDC stop

# Install sqlitebrowser
sudo apt install sqlitebrowser

# Open Configuration DB file
sudo sqlitebrowser /opt/openPDC/ConfigurationCache/openPDC.db

# Select table "Historian"
# Right click and select "Browse Table"

# Find PPA Acronym
# Modify AssemblyName
CsvAdapters.dll

# Modify TypeName
CsvAdapters.CsvOutputAdapter

# Save the DB file and exit
```

<aside>
🚧 Reload OpenPDC config

</aside>

```bash
# Start openPDC service
sudo /opt/openPDC/openPDC start

# Exit out of Root
exit

# Login from Remote Console
mono /opt/openPDC/openPDCConsole.exe

# Enter user name:
.\awsaf

# After a table is displayed, type help
help

# If all available commands are show, reload config
ReloadConfig

# Exit out of remote console
exit
```

<aside>
🔑 Check Measurements in CSV format

</aside>

```bash
# Navigate to /opt/openPDC directory
cd /opt/openPDC

# Find measurements.csv file
```

<aside>
🚫 Stop OpenPDC Service

</aside>

```bash
# Stop service
mono /opt/openPDC/openPDC stop
```

<aside>
🚫 Other Notes (Don’t worry about it)

</aside>

```bash
# Open in Explorer from WSL
sudo /mnt/c/Windows/explorer.exe .

# Uninstall WSL
sudo apt remove --purge --auto-remove mono-runtime
```