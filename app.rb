require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/listing'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Hello World"
  end

  get '/listings' do
    @listings = Listing.all
    erb :listings
  end

  post '/listings' do
    redirect '/listings/new'
  end


  run! if app_file == $0
end
