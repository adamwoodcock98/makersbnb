require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/listing'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get "/" do
    @listing = session["new_listing"]
    erb :view_listings
  end

  get "/new" do
    erb :add_listing
  end

  post "/add-new-listing" do
    session["new_listing"] = Listing.create(name: params["name-space"], description: params["description-space"], price: params["price-space"])
    redirect "/"
  end

  run! if app_file == $0
end