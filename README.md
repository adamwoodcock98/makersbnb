MakersBnB
=========

We are building a short-term rental website for travellers going away. Our platform allows hosts to list the properties that they would like to rent out to guests, and for guests to pick their preferred choice of rental. The platform allows hosts to manage their diary, approve specific booking requests and more.

## Installation
-----
- Fork this repository
- ```cd``` in the forked directory
- Run the command ```bundle install``` in the terminal
- Run ```rackup``` in the terminal to start the server
- Visit ```localhost:9292/listings``` in your browser 


## How to run the tests after all the gems have been installed
-----
1. ```cd``` into the forked directory
2. Run ```rspec``` in the terminal


## Overview Functionality
-----

### The user is able to:
  - sign-up and create an account
  - sign-in/sign-out
  - view all the available properties 
  - view details about each property
  - list a property/properties
  - book a property
  - see the availability
  - choose a start-date/end-date  
  - see the total price of the requested dates
  - request a booking
   
##  Steps taken in order to build the application
1. MVP which consisted of:
    - spec
    - user stories 
    - low-fidelity wireframe
    - database domain modeling
    - barebones functional website
      - list of properties
      - view single property
2. Installing the relevant gems
3. Using the MVC design pattern
4. Implementing feature and unit tests before writing any line of code



## User Stories
-----

```
As a host,
So that I can make money,
I would like to list my property.

As a hosts,
So that I can view my listings,
I would like to create an account.

As a host,
So I can make even more money,
I would like to list multiple properties.

As a host,
So that I can keep track of my listings,
I would like to name my listings.

As a host,
So that my guests have some information,
I would like to add a description to my listing.

As a host,
So that my guests know the cost,
I would like to add a price to my listing.

As a host,
So that my property isn’t double-booked,
I would like to prevent my guests from booking unavailable dates.

As a user,
So that I’m only looking at relevant information,
I would like to sign in to my account

As a guest,
So that I have a roof over my head,
I would like to request a space for a particular night

As a host,
So that I’m in control of my space,
I would like to be able to confirm a guest request 

As a guest,
So that I know when I can book,
I would like to see available dates for a property.

As a guest,
So that I know when I cannot book
I would like to see unavailable dates grayed out

As a host,
So that I don’t lose out on bookings
I would like my property to remain available until confirmed
```
-----

## Technologies
- Ruby
- Sinatra
- Capybara
- Rake | Active Record
- PostgreSQL
- HTML | CSS
- SimpleCov
- Rubocop

## Domain & Process Modelling
-----

![Domain Model](./public/diagrams/01-domain-model.png)

![Process Model](./public/diagrams/02-process-model.png)

![Process Model](./public/diagrams/03-process-model.png)

