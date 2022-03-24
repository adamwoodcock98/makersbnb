require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require_relative './lib/listing'
require_relative './lib/booking'


class MakersBnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  
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
    @listing = Listing.find(params[:id])
    erb :view_property
  end

  get '/listings/:id/availability' do
    @listing = Listing.find(params[:id])
    @selected_start = session[:selected_start]
    @selected_end = session[:selected_end]
    erb :availability
  end

  post '/listings/:id/availability' do
    session[:selected_start] = params[:start_date]
    session[:selected_end] = params[:end_date]
    redirect "/listings/#{params[:id]}/availability"
  end

  post '/requests/:id/availability/request' do
    Booking.create(
      guest_id: 8,
      listing_id: params["listing_id"],
      start_date: params["start date"],
      end_date: params["end_date"],
      is_approved: false
    )
  end

  run! if app_file == $0
end
