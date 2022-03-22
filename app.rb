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

  run! if app_file == $0
end
