require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/listing'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  enable :sessions
  
  get '/listings' do
    @listings = Listing.all
    erb :listings
  end

  post '/listings' do
    redirect '/listings/new'
  end

  get '/listings/new' do
    erb :add_listing
  end

  post '/listings/new' do
    session['new_listing'] = 
Listing.create(name: params['name-space'], description: params['description-space'], 
price: params['price-space'])
    redirect '/listings'
  end

  run! if app_file == $0
end
