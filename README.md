# ShortToGround Blog
This project is mostly a proof of concept and learning project for me.

This means that sometimes I didn't do the most efficient thing because I was also trying to touch as much tech as possible with this one project.

The basic idea for this project is:
* Have github actions fire when changes are pushed on the master or dev branches
* Have the github runner build & register my blog container
* Use terraform to ensure my docker host is running in AWS
* Use ansible to make sure said host is configured
* Run the new container image

Some of my steps are only for learning purposes only, like building and registering my container in the github registry and the pulling via ansible.

## Notes
Secrets are stored in Github.


This repo is paired with shorttoground-blog-infra, which contains the IaC configs.