resource "proxmox_vm_qemu" "worker_node" {
  count = var.worker_node_count

  # VM General Settings
  target_node = var.proxmox_node
  vmid        = var.worker_node_starting_id + count.index
  name        = "${var.cluster_name}-node-${count.index}"
  desc        = "worker node ${count.index}"

  # VM Advanced General Settings
  onboot = true

  # VM OS Settings
  clone      = "k8s-worker-node"
  full_clone = true

  # VM System Settings
  agent = 1

  # VM CPU Settings
  cores   = 1
  sockets = 1
  cpu     = "host"

  # VM Memory Settings
  memory = 2048

  # VM Network Settings
  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  # VM Cloud-Init Settings
  os_type = "cloud-init"

  # (Optional) IP Address and Gateway
  ipconfig0 = "ip=dhcp"

  ciuser = var.ssh_username

  sshkeys = <<EOF
${var.ssh_key}
EOF
}

output "worker_nodes" {
  sensitive = true
  value = tomap({
     for vm in proxmox_vm_qemu.worker_node : vm.name => vm.default_ipv4_address
  })
}