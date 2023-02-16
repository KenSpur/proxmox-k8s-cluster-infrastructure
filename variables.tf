#Proxmox Variables

variable "proxmox_api_url" {
  type    = string
  default = ""
}

variable "proxmox_api_token_id" {
  type    = string
  default = ""
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
  default   = ""
}

variable "proxmox_node" {
  type    = string
  default = "pve"
}

variable "ssh_username" {
  type    = string
  default = "root"
}

variable "ssh_key" {
  type      = string
  default   = ""
  sensitive = true
}

# Cluster Variables
variable "cluster_name" {
  type    = string
  default = "c0"
}

variable "control_plane_node_starting_id" {
  type    = number
  default = 900
}

variable "control_plane_node_count" {
  type    = number
  default = 1
}

variable "worker_node_starting_id" {
  type    = number
  default = 910
}

variable "worker_node_count" {
  type    = number
  default = 3
}