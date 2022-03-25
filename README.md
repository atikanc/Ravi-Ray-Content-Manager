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
- GitHub Desktop at https://desktop.github.com/

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

We have environment variables setup for Authentication. The tutorial can be found here: https://medium.com/craft-academy/encrypted-credentials-in-ruby-on-rails-9db1f36d8570

The tutorial above will help you understand now we encrypted the admin page's username and password!


## Deployment

1. Fork the project repository (https://github.com/cjnewman820/Ravi-Ray-Content-Manager) into your own GitHub account.
2. In Heroku, connect your GitHub Account to the Heroku Account (https://dashboard.heroku.com/account/applications).
3. From the Heroku Dashboard Click the New button in the top right of your app list and select Create new pipeline.
   - Search for and connect to the Github repository that your forked to your account.
4. Create a new app under production to deploy from the main branch.
5. Once the application is built and released, it can be accessed via the Heroku Link.

## CI/CD

CI/CD has been implemented in the GitHub Actions in the repo here -> https://github.com/cjnewman820/Ravi-Ray-Content-Manager/actions

## Support

The support of this app has been officially closed. There is nothing more important left to develop. We can scale this app and make it generic enough for all other content management needs. Thats the future goals of this application.

## Extra Helps

Please contact Pauline Wade paulinewade@tamu.edu for help on Lab assignments which will teach you in more depth.
