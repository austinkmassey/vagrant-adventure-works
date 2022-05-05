Vagrant.configure("2") do |config|

  #get a base sql server box
  config.vm.box = "gusztavvargadr/sql-server-2019-developer-windows-server"

  config.vm.provider "virtualbox" do |vb|

    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "8192"
    vb.cpus = "4"

    # Customize the amount of video ram on the VM
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    vb.customize ["modifyvm", :id, "--vram", "128"]

  end

  # run the two following scripts using Powershell on the VM
  config.vm.provision "shell", path: "scripts/provision_packages.ps1", privileged: true
  config.vm.provision "shell", path: "scripts/provision_database.ps1", privileged: true

end
