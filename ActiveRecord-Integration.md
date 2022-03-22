# Active Record Notes

[Makers Database Demo](https://www.youtube.com/watch?v=CS1jxw51ENE)
  - sets up entire project

### Required gems
  - rspec
  - capybara 
  - sinatra 
  - **sinatra-activerecord**
  - sinatra
  - rake (why?) - applies your migrations! @14:51
  - pg
  - **database_cleaner-active_record** (not 100% sure what this does)

## Preamble to ActiveRecord

Writes feature test for registrations @2:40
  - combines several features (high-level feature test)
Uses an app folder for app.rb @6:19
Uses a controller folder with multiple controller files @6:45
  - looks like the controller is encapsulated away from some other stuff
  - registrations_controller.rb
  - app_controller.rb
  - if you do this, you need to explicitly set the root dir in the respective controllers @13:26
    - e.g. set :root, File.dirname(File.expand_path('..', __FILE__))
Moves onto views once they have been referenced in the controllers (based again on feature test)

## Active Record Setup

[Website used to check steps](https://github.com/sinatra/sinatra-recipes/blob/master/databases/postgresql-activerecord.md)
- required gems
  - pg
  - activerecord
  - sinatra-activerecord
  - rake
Either [link to examples](https://github.com/sinatra/sinatra-recipes/blob/master/databases/postgresql-activerecord.md):
- config/database.yml file needed to setup database connections (both prod & test - actually just development and test)
- directly specify in Sinatra app
[Docs for Sinatra ActiveRecord Extension](https://github.com/sinatra-activerecord/sinatra-activerecord) - This refers to SQLite3 so need to be aware of that
- we will likely need to register the extension (simlar to registering Sinatra::Reloader) - did it in app_controller
```
class YourApplication < Sinatra::Base
  register Sinatra::ActiveRecordExtension
end
```
Rake seems to be able to set up all the databases programmatically from that config file
  - WORTH WRITING ONE
  - DO IT
Migrations are then generated *by Rake*
  - exec rake db:create_migration NAME = create_users
  - makes a class that interfaces with ActiveRecord -> No More SQL
  - syntax is under Usage [here](https://github.com/sinatra-activerecord/sinatra-activerecord#usage)
  - example table creation is done @19:50
You end up with two databases set up and a schema file within the db folder that tells you the state of the database currently (at time of running rake)

## Integration with Model

Classes inherit from ActiveRecord
  - class ExampleClass < ActiveRecord::Base
  - also shows integration with bcrypt @21:49
    - for storing passwords encrypted
    - not for now (needs gem bcrypt in Gemfile)
  - explicitly writes getter and setter for User password
    - this is where the database table integration comes in
    - for example there is a reference made to self.password_hash in a method
      - which is a column header in the users table
Routes (in specific controllers) use direct calls to User class
  - inherits a save! method from ActiveRecord -> this is what updates the database? - test that assumption
Says @25:52 that everytime a iuser is created we need to destroy the database??!?
    - possibly 'we are **not** destroying our database'
  - Makes a helper for using database_cleaner ~@26:30
    - think this might just be for testing purposes - makes sense as having a clean db
     - Database.cleaner with a truncate strategy and RSpec config loop to DatabaseHelper.clean before each test
Adds a current_user method to the main app_controller @30:32
  - needs to enable sessions
  - session[:user_id] gets set by UserAuthApp

Tests need to encompass
  - successful sign-in
  - attempted sign-in with incorrect email/username
  - attempted sign-in with incorrect password (but correct user)

## Authentication via ActiveRecord

- Uses a post /sessions route and controller
- User has an authenticate method (explicitly written) - it is a class method
  - multiple uses of the find_by method
    - takes keyword arguments that are the same as column headers in table
    - likely to be inherited from ActiveRecord
- returns either a user (truthy) or nil (falsy), so can be used as the test in a conditional
- this leads into a unit test for the User class @43:00
- signing out just deletes the session[:user_id] so actually very simple

----------------------
## Remaining Questions

What is the practice for splitting controllers?
  - ended up with:
    - app
    - session
    - registration
    - home?

## Gaya's Question
  - does Active Record replace the need for a DatabaseConnection class or does it supplement it?
    - Completely replaces it - needs more upfront config but makes for cleaner model

## Useful Business
- In a capybara automated test in order to get visibility you can 'puts page.body' to view the HTML of the current page
  - instead of having to wedrive the automated browser and watch it work