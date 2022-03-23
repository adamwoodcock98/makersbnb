require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require_relative './lib/listing'
require_relative './lib/booking'


class MakersBnB < Sinatra::Base
  # Check this is needed if configuration is done through config.yml
  register Sinatra::ActiveRecordExtension
  
  configure :development do
    register Sinatra::Reloader
  end

  enable :method_override
  
  get '/listings' do
    @listings = Listing.all
    erb :listings
  end

  post '/listings' do
    Listing.create(
      name: params['name-space'],
      description: params['description-space'], 
      pence_price: (params['price-space'] * 100)
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

  get '/requests_page' do
    erb :requests_page
  end

  post '/requests_page' do

    Booking.create(
      start_date: params["start date"],
      end_date: params["end date"]
    )
  end

  run! if app_file == $0
end
