variable "ssh_private_key_path" {
  description = "SSH private key path"
  default     = "~/.ssh/id_rsa"
}

variable "ssh_user" {
  description = "SSH user"
  default     = "root"
}

variable "ssh_host" {
  description = "SSH host"
  default     = "192.168.0.100"
}

variable "dokku_version" {
  description = "Dokku version"
  default     = "0.19.6"
}

variable "dokku_hostname" {
  description = "Dokku hostname"
  default     = "dokku.yourhost.com"
}
