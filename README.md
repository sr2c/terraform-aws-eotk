<!-- markdownlint-disable -->
# (deprecated) terraform-aws-eotk[![deprecated](https://img.shields.io/badge/lifecycle-deprecated-critical?style=flat-square)](#deprecated)
[![pipeline status](https://gitlab.com/sr2c/terraform-aws-eotk/badges/main/pipeline.svg?ignore_skipped=true&style=flat-square)](https://gitlab.com/sr2c/terraform-aws-eotk/-/pipelines)
[![latest release](https://gitlab.com/sr2c/terraform-aws-eotk/-/badges/release.svg?style=flat-square)](https://gitlab.com/sr2c/terraform-aws-eotk/-/tags)
[![gitlab stars](https://img.shields.io/gitlab/stars/sr2c/terraform-aws-eotk?style=flat-square)](https://gitlab.com/sr2c/terraform-aws-eotk/-/starrers)
[![gitlab forks](https://img.shields.io/gitlab/forks/sr2c/terraform-aws-eotk?style=flat-square)](https://gitlab.com/sr2c/terraform-aws-eotk/-/forks)
<!-- markdownlint-restore -->
[![SR2 Communications Limited][logo]](https://www.sr2.uk/)

[![README Header][readme_header_img]][readme_header_link]
<!--

  ** DO NOT EDIT THIS FILE
  **
  ** This file was automatically generated by the `build-harness`.
  ** 1) Make all changes to `README.yaml`
  ** 2) Run `make init` (you only need to do this once)
  ** 3) Run`make readme` to rebuild this file.
  **
  ** (We maintain HUNDREDS of projects. This is how we maintain our sanity.)
  **

-->

## Deprecated
  This module is no longer actively maintained



### Historical Description

Terraform module to deploy a pair of EC2 instances to run EOTK in AWS.

---
It's 100% Open Source and licensed under the [BSD 2-clause License](LICENSE).

## Usage
### Simple Example

```hcl

provider "aws" {
  region = "us-east-2"
}

provider "aws" {
  region = "eu-central-1"
  alias = "second_region"
}

module "eotk" {
  providers = {
    aws = aws,
    aws.second_region = aws.second_region
  }
  source = "sr2c/eotk/aws"
  namespace = "<your org>"
}
```

## Help

**Got a question?** We got answers.

File a
[GitLab issue](https://gitlab.com/sr2c/terraform-aws-eotk/-/issues),
send us an [email][email] or join our [IRC](#irc).

[![README Commercial Support][readme_commercial_support_img]][readme_commercial_support_link]

## IRC

[![IRC badge](https://img.shields.io/badge/libera.chat-%23sr2-blueviolet?style=flat-square)][irc]

Join our [public chat][irc] on IRC.
If you don't have an IRC client already, you can get started with the
[web client](https://web.libera.chat/#sr2).
This is the best place to talk shop, ask questions, solicit feedback, and work
together as a community to build on our open source code.



## Copyright

Copyright © 2021-2024 SR2 Communications Limited

## License

![License: BSD 2-clause](https://img.shields.io/badge/License-BSD%202--clause-blue?style=flat-square)

```text
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

This project is maintained by [SR2 Communications Limited][website].

[![SR2 Communications Limited][logo]][website]

We're a [DevOps services][website] company based in Aberdeen, Scotland. We
specialise in solutions for online freedom, digital sovereignty and
anti-censorship.

We offer [paid support][website] on all of our projects.

Check out [our other projects][gitlab], or [hire us][website] to get support
with using our projects.

## Contributors

<!-- markdownlint-disable -->
|  [![irl][irlxyz_avatar]][irlxyz_homepage]<br/>[irl][irlxyz_homepage] |
|---|

  [irlxyz_homepage]: https://gitlab.com/irlxyz
  [irlxyz_avatar]: https://gitlab.com/uploads/-/system/user/avatar/5895869/avatar.png?width=130

<!-- markdownlint-restore --><!-- markdownlint-disable -->
  [logo]: https://www.sr2.uk/readme/logo.png
  [website]: https://www.sr2.uk/?utm_source=gitlab&utm_medium=readme&utm_campaign=sr2c/terraform-aws-eotk&utm_content=website
  [gitlab]: https://go.sr2.uk/gitlab?utm_source=gitlab&utm_medium=readme&utm_campaign=sr2c/terraform-aws-eotk&utm_content=gitlab
  [contact]: https://go.sr2.uk/contact?utm_source=gitlab&utm_medium=readme&utm_campaign=sr2c/terraform-aws-eotk&utm_content=contact
  [irc]: ircs://libera.chat/sr2
  [linkedin]: https://www.linkedin.com/company/sr2uk/
  [email]: mailto:contact@sr2.uk
  [readme_header_img]: https://www.sr2.uk/readme/paid-support.png
  [readme_header_link]: https://www.sr2.uk/?utm_source=gitlab&utm_medium=readme&utm_campaign=sr2c/terraform-aws-eotk&utm_content=readme_header_link
  [readme_commercial_support_img]: https://www.sr2.uk/readme/paid-support.png
  [readme_commercial_support_link]: https://go.sr2.uk/commerical-support?utm_source=gitlab&utm_medium=readme&utm_campaign=sr2c/terraform-aws-eotk&utm_content=readme_commercial_support_link
<!-- markdownlint-restore -->
