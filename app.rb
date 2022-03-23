require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require_relative './lib/listing'

class MakersBnB < Sinatra::Base
  # Check this is needed if configuration is done through config.yml
  register Sinatra::ActiveRecordExtension
  
  configure :development do
    register Sinatra::Reloader
  end
  
  get '/listings' do
    @listings = Listing.all
    erb :listings
  end

  get '/listings/new' do
    erb :add_listing
  end

  post '/listings' do
    Listing.create(
      name: params['name-space'],
      description: params['description-space'], 
      price: params['price-space']
    )
    redirect '/listings'
  end

  get '/users/new' do
    erb :new_user
  end
    
  post '/users' do
    # p "first_name: #{params['first_name']}"
    # p "last_name: #{params['last_name']}"
    # p "user_name: #{params['user_name']}"
    # p "email: #{params['email']}"
    # p "password: #{params['password']}"
    User.new(
      first_name: params['first_name'],
      last_name: params['last_name'],
      user_name: params['user_name'],
      email: params['email'],
      password: params['password'],
    )
    erb :welcome_user
  end

  run! if app_file == $0
end
