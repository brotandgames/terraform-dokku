# terraform-dokku

Terraform Module to deploy Dokku on a node with SSH access using Debian Package Installation

## Usage

See `test/main.tf` for example usage of the module.

### Where to go further?

tbd.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| dokku\_hostname | Dokku hostname | string | `"dokku.yourhost.com"` | no |
| dokku\_version | Dokku version | string | `"0.19.6"` | no |
| ssh\_host | SSH host | string | `"192.168.0.100"` | no |
| ssh\_private\_key\_path | SSH private key path | string | `"~/.ssh/id_rsa"` | no |
| ssh\_user | SSH user | string | `"root"` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing

We encourage you to contribute to this project in whatever way you like!

## Versioning

[Semantic Versioning 2.x](https://semver.org/)

In a nutshell:

> Given a version number MAJOR.MINOR.PATCH, increment the:
>
> 1. MAJOR version when you make incompatible API changes,
> 2. MINOR version when you add functionality in a backwards-compatible manner, and
> 3. PATCH version when you make backwards-compatible bug fixes.
>
> Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## Maintainer

https://github.com/brotandgames


