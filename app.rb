require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/listing'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :method_override
  
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

  get '/listings/:id' do
    @listing = Listing.all.first
    erb :view_property
  end

  run! if app_file == $0
end
