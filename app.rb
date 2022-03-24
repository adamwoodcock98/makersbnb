require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require_relative './lib/listing'
require_relative './lib/booking'
require_relative './lib/user'


class MakersBnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  
  # Stop debug output to terminal
  ActiveRecord::Base.logger.level = 1 unless ActiveRecord::Base.logger.nil?

  configure :development do
    register Sinatra::Reloader
  end

  enable :method_override
  enable :sessions
  
  get '/listings' do
    @listings = Listing.all
    erb :listings
  end

  post '/listings' do
    Listing.create(
      name: params['name'],
      description: params['description'], 
      pence_price: (params['price'].to_i * 100)
    )
    redirect '/listings'
  end

  get '/listings/new' do
    erb :add_listing
  end
  
  get '/listings/:id' do
    @listing = Listing.all.first
    erb :view_property
  end

  post '/requests_page' do

    Booking.create(
      start_date: params["start date"],
      end_date: params["end date"]
    )
  end

  post '/listings/:id/availability' do

  end

  get '/users/new' do
    erb :new_user
  end
    
  post '/users' do
    @user = User.create(
      first_name: params['first_name'],
      last_name: params['last_name'],
      user_name: params['user_name'],
      email: params['email'],
      password: params['password'],
    )
    erb :welcome_user
  end

  get '/sessions/new' do
    erb :sign_in
  end

  post '/sessions' do
    user_id = User.authenticate(email: params['email'], password: params['password'])
    if user_id
      session[:user_id]
      erb :sign_in_success
    else
      erb :sign_in_failure
    end
  end

  run! if app_file == $0
end
