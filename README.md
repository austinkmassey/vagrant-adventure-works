# Vagrant Adventure Works

**Scripts to create a database server and setup the Adventure Works database**

Automate the process of standing up a Microsoft SQL Server and loading the Adventure Works sample database into it using Vagrant.

## Overview
### Features and Settings
- SQL Server 2019 Developer CU15 (15.0.4198.2)
	 - Windows Authentication with user **vagrant**
	 - SQL Server Authentication with user **sa** and password **Vagrant42**
	 - FullText installed and enabled
	 - A database called [AdventureWorks](https://github.com/microsoft/sql-server-samples/tree/master/samples/databases/adventure-works)
- SQL Server Management Studio 18.11.1
- Windows Server 2022 Standard (20348.643)
	- User **vagrant** with password **vagrant** and **Vagrant's insecure key**
	- Windows Updates disabled
	- Maintenance tasks disabled
	- Windows Defender disabled
	- UAC disabled
	- Generalized with Sysprep
- Chocolatey 1.1.0
- Chef Infra Client 17.10.3
- OpenSSH 8.0.0.1
- VirtualBox
	- Guest Additions 6.1.32
	- Port forwarding for RDP from **3389** to **53389** with auto correction
	- WinRM and WinSSH communicator
	- 4 CPUs
	- 8 GB RAM
- Two provision scripts

### Requirements
- VirtualBox version 4.0.0+
- Vagrant 2.2.19+

### Usage
Make sure that Vagrant and VirtualBox are both installed on your host machine.

Download or clone the repository and open the directory.

    git clone https://github.com/austinkmassey/vagrant-adventure-works
    cd vagrant-adventure-works
   
If you are using WSL, you can source the following file to allow WSL to communicate to VirtualBox if it is installed on Windows.

    source wsl_setup.sh
 
Start the VM using Vagrant.

    vagrant up

After starting, it may take a few minutes to download and setup everything. You should see messages from Vagrant in the terminal and a VirtualBox screen should pop up.

Once complete, open SSMS and connect to the server named **WIN-3QUL3AEKMMN** to test the VM.

Reset the VM by running the following command.

    vagrant destroy -f && vagrant up

## Next Steps
Having an environment that is easy to setup, modify, and reset to a known state is great for a variety of uses. Anyone who wants to learn more about using databases, about business intelligence, or about DevOps can use this as a lab that can be reset if it is modified (or broken!). This project can also be used as a starting point for other projects.

### Example Projects
- Connect to the database using a new SQL client or BI tool
	- https://github.com/tpope/vim-dadbod - a Vim plugin for interacting with databases
	- https://www.metabase.com/ - an open source way for everyone to learn from data
	- https://superset.apache.org/ - a modern data exploration and visualization platform
- [Do an analysis of the Adventure Works](https://www.researchgate.net/profile/Mafas-Raheem/publication/340000083_Descriptive_and_Predictive_Analytics_on_Adventure_Works_Cycle_A_Corporate_Decision_Making/links/5e72091c92851c93e0aa7dd7/Descriptive-and-Predictive-Analytics-on-Adventure-Works-Cycle-A-Corporate-Decision-Making.pdf?origin=publication_detail)
	- What regions were most profitable for Adventure Works? Least profitable?
	- Which promotions attracted the most new customers?
	- What time period had the fewest online sales?
	- Using basket analysis, what products would you suggest to an online customer based on the products in their shopping cart?
- Create another database provision script that loads a different set of data
	- [World Wide Importers](https://docs.microsoft.com/en-us/sql/samples/wide-world-importers-what-is?view=sql-server-ver15)
	- [StackOverflow](https://www.brentozar.com/archive/2015/10/how-to-download-the-stack-overflow-database-via-bittorrent/)- Modify the provision scripts to add SSRS, SSAS, SSIS, or SSDT using Chocolatey
	- [Chocolatey package to add SQL Server Data Tools ](https://community.chocolatey.org/packages/visualstudio2017sql/)
	- [Chocolatey packege to add SQL Server Reporting Services](https://community.chocolatey.org/packages/ssrs-2019)
- Create an Adventure Works application
	- https://abrisplatform.com/articles/quick-create-web-application-from-existing-database/
	- https://www.informit.com/articles/article.aspx?p=31359&seqNum=286


Thank you to [Guszta Vargadr](https://app.vagrantup.com/gusztavvargadr/boxes/sql-server-2019-developer-windows-server/versions/2019.2102.2204/%20gusztavvargadr/sql-server-2019-developer-windows-server) for packaging SQL Server for Vagrant and VirtualBox.
