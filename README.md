# Introduction
This project is the companion to the Made In Jerusalem Side Project Academy course
on Cloud Computing. Over the course we will learn about the foundational services of
AWS and this project will demonstrate the services we learn.

The project is divided into Steps where each folder contains a working version of the
project meant to demonstrate a concept, service, or feature. In the lectures we will
run the project one step at a time. It should be possible to execute any step by itself
or to jump from a lower step to a later step but I haven't tested executing a _previous_
step.

Each folder has a `deploy.sh` script that deploys the project in that step. The `README.md`
file in each step will describe what is added to that step, not the project as a whole.

# How to Use
1. You can clone or download this project to your computer.
1. Copy the `config.json.config` to a new file called `config.json` and edit the values
   in the file to fit your needs.
1. Go into `step-1` and run `deploy.sh`.
1. Go into the next step and run `deploy.sh`, rinse, and repeat.

# Homework

## Lesson 1
* [Create AWS Account](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/)
* [Set MFA on Root account](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_enable_virtual.html#enable-virt-mfa-for-root)
* [Apply the AWS credits](https://aws.amazon.com/awscredits/) you received via email
* [Create IAM user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html#id_users_create_console)
   for yourself with Admin permissions
* Set up [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) on your development computer
* [Set up credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html) for your IAM user
   in the CLI
* [Create an S3 Bucket](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/create-bucket.html)
* [Configure Static Website Hosting](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/static-website-hosting.html)
   on the S3 bucket
* Upload an HTML file with whatever you want, maybe an "about me" page or something but it doesn't matter what

