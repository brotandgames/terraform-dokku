resource "null_resource" "install" {

  triggers = {
    dokku_version  = md5(var.dokku_version)
    dokku_hostname = md5(var.dokku_hostname)
  }

  connection {
    type        = "ssh"
    user        = var.ssh_user
    host        = var.ssh_host
    private_key = file(var.ssh_private_key_path)
  }

  provisioner "file" {
    source      = "${path.module}/files/install.sh"
    destination = "/tmp/install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install.sh",
      "/tmp/install.sh ${var.dokku_version} ${var.dokku_hostname}"
    ]
  }

}
