build {
  sources = [
    "source.amazon-ebs.builder",
  ]

  provisioner "ansible" {
    host_alias = var.host_alias
    playbook_file = var.playbook_file_path
    extra_arguments  = [
      "--scp-extra-args", "'-O'",
      "-e", "aws_region=${var.aws_region}",
      "-e", "ssh_username=${var.ssh_username}"
    ]
  }

  provisioner "shell" {
    inline = [
      "sudo find /root /home -name authorized_keys -delete",
      "sudo find /root /home -name '.*history' -delete"
    ]
  }
}
