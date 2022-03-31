# Ravi-Ray-Content-Manager
CSCE 431 Group 500-3 Project

## Introduction

Ravi Ray Content Manager is an application that is tailor created for Ravi Ray Audio. The goal of this applicaiton is to allow for the owner, Ravi, and authorized users to manage projects that their organizations has contributed to. Once the project is added, this application also renders a public page that allows the public to view, sort, and filter through Ravi Ray Audio's projects. This public view will be dynamically adjusted based on the inputs into the filter and sorting system.

## Requirements

This code has been run and tested on:

- Ruby - 3.0.2p107 (2021-07-07 revision 0db68f0233)
- Rails - 6.1.4.4
- Ruby Gems - Listed in `Gemfile`
- PostgreSQL - 13.6
- Docker (Latest Container)


## External Deps

- Docker - Download latest version at https://www.docker.com/products/docker-desktop
- Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
- Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
- (Optional) GitHub Desktop at https://desktop.github.com/
- Amazon AWS S3 at https://aws.amazon.com/s3/
- Google OAuth 2.0 at https://developers.google.com/identity/protocols/oauth2

## Installation

Download this code repository by using git:

`git clone https://github.com/cjnewman820/Ravi-Ray-Content-Manager.git`

## Tests

An RSpec test suite is available and can be ran using:

`rspec spec/`

You can run all the test cases by running. This will run both the unit and integration tests.
`rspec .`

## Execute Code

Run the following code in Powershell if using windows or the terminal using Linux/Mac

`cd RRA`

`docker run --rm -it --volume "$(pwd):/RRA" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

`cd RRA`

Install the app

`bundle install && rails webpacker:install && rails db:create && db:migrate`


Run the app
`rails server --binding:0.0.0.0`


The application can be seen using a browser and navigating to http://localhost:3000/


## Environmental Variables/Files

The following keys needed to be added to Heroku.

General Environment.
1. Rails Environment: RAILS_ENV = production

For Authentication, we used OmniAuth to leverage Google OAuth. 
1. Client Secret Key: CLIENT_SECRET = [Your Key Here]
2. Client ID: CLIENT_ID = [Your Key Here]

For ActiveStorage, we used Amazon AWS to store images persistently.
1. AWS Access Key: AWS_ACCESS_KEY = [Your Key Here]
2. AWS Secret Key: AWS_SECRET_ACCESS_KEY = [Your Key Here]
3. AWS S3 Bucket Name: S3_BUCKET = [Your Key Here]


## Deployment

1. Fork the project repository (https://github.com/cjnewman820/Ravi-Ray-Content-Manager) into your own GitHub account.
   - Any changes you have made to the source code when you downloaded the code can now be pushed to your repo.
3. In Heroku, connect your GitHub Account to the Heroku Account (https://dashboard.heroku.com/account/applications).
4. From the Heroku Dashboard Click the New button in the top right of your app list and select Create new pipeline.
   - Search for and connect to the Github repository that your forked to your account.
5. Create a new app under production to deploy from the main branch.
6. Configure the environment variables listed above.
7. Once the application is built and released, it can be accessed via the Heroku Link.

## CI/CD

CI/CD has been implemented in the GitHub Actions in the repo here -> https://github.com/cjnewman820/Ravi-Ray-Content-Manager/actions

## Support

The support of this app has been officially closed. There is nothing more important left to develop. We can scale this app and make it generic enough for all other content management needs. Thats the future goals of this application.

## Extra Helps

Please contact Pauline Wade paulinewade@tamu.edu for help on Lab assignments which will teach you in more depth.
