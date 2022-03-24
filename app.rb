require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require_relative './lib/listing'
require_relative './lib/booking'


class MakersBnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  
  # Stop debug output to terminal
  ActiveRecord::Base.logger.level = 1

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

  run! if app_file == $0
end
