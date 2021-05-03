# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |c|
  # Operating system
  c.vm.box = "bento/debian-10"

  # Networking settings
  c.vm.hostname = "phoenix.local"
  c.vm.network :private_network, ip: "192.168.39.39"
  c.vm.network :forwarded_port, guest: 4000, host: 4000

  # Synced folder settings
  c.vm.synced_folder ".", "/vagrant", disabled: true
  c.vm.synced_folder "./src", "/home/vagrant/src"

  # Virtualbox settings
  c.vm.provider "virtualbox" do |v|
    v.cpus   = 2
    v.gui    = false
    v.memory = 1024
    v.name   = "Phoenix"

    v.customize ["modifyvm", :id, "--nested-hw-virt", "on"]
    v.customize ["modifyvm", :id, "--paravirtprovider", "kvm"]
    v.customize ["modifyvm", :id, "--vrde", "off"]
  end

  # Apt update
  c.vm.provision :shell,
    inline: "apt-get update"

  # Elixir
  c.vm.provision :shell,
    path: "provision/elixir.sh"

  # Hex: Elixir package manager
  c.vm.provision :shell, privileged: false,
    inline: "mix local.hex --force"

  # Rebar: Erlang build tool
  c.vm.provision :shell, privileged: false,
    inline: "mix local.rebar --force"

  # Phoenix Framework
  c.vm.provision :shell, privileged: false,
    inline: "mix archive.install hex phx_new --force"

  # Node LTS, for Phoenix
  c.vm.provision :shell, privileged: false,
    path: "provision/node.sh"

  # Postgresql, for Phoenix
  c.vm.provision :shell, inline: <<-SHELL
    apt-get install -y postgresql
    sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres'"
  SHELL

  # inotify-tools, for Phoenix
  c.vm.provision :shell,
    inline: "apt-get install -y inotify-tools"

  # misc
  c.vm.provision :shell,
    inline: "apt-get install -y emacs tmux dos2unix"

  # bash_aliases
  c.vm.provision "file",
    source: "provision/.bash_aliases",
    destination: "/home/vagrant/.bash_aliases"

  # apply dos2unix, for Windows
  c.vm.provision :shell,
    inline: "dos2unix /home/vagrant/.bash_aliases"
end
