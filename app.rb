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
    # :nocov:
    register Sinatra::Reloader
    # :nocov:
  end

  enable :method_override
  enable :sessions

  before do
    @flash_message = session.delete(:flash_message)
  end

  get '/' do
    redirect '/listings'
  end
  
  get '/listings' do
    @listings = Listing.all
    erb :listings
  end

  post '/listings' do
    @host = current_user
    Listing.create(
      name: params['name'],
      description: params['description'], 
      pence_price: (params['price'].to_i * 100),
      host_id: @host.id
    )
    redirect '/listings'
  end

  get '/listings/new' do
    if session[:user_id].nil?
      session[:flash_message] = 'You need to be signed in to add a new listing'
      redirect '/listings'
    else
      erb :add_listing
    end
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

  get '/requests/:listing_id/confirmation' do
    @user = current_user
    @booking = Booking.find_by(id: params[:selected_booking_id] )
    @listing = Listing.find_by(id: @booking.listing_id)
    @all_bookings = Booking.where(listing_id: @listing.id)
    erb :requests
  end

  # This route is currently untested
  post '/requests/:id/availability/request' do
    @user = current_user
    @booking = Booking.create(
      guest_id: @user.id,
      listing_id: params[:listing_id],
      host_id: params[:host_id],
      start_date: session[:selected_start],
      end_date: session[:selected_end],
      is_approved: false
    )
    redirect '/requests'
  end

  post '/confirm' do
    @booking = Booking.find_by(id: params[:name])
    @booking.is_approved = true
    @booking.save!
    redirect '/requests'
  end

  get '/requests' do
    @user = current_user
    @guest_requests = Booking.where(guest_id: @user.id) unless current_user == nil
    @host_requests = Booking.where(host_id: @user.id, is_approved: false) unless current_user == nil
    erb :all_requests
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
    if @user.id.nil?
      session[:flash_message] = "Unsuccessful Sign-up"
    else
      session[:user_id] = @user.id
      session[:flash_message] = "Welcome #{@user.first_name} #{@user.last_name}, your username is #{@user.user_name}!"
    end
    redirect '/listings'
  end

  get '/sessions/new' do
    erb :sign_in
  end

  delete '/sessions' do
    session[:user_id] = nil
    erb :sign_out
  end

  post '/sessions' do 
    user_id = User.authenticate(email: params['email'], password: params['password'])
    if user_id
      session[:user_id] = user_id
      session[:flash_message] = 'You have signed in correctly'
    else
      session[:flash_message] = 'Unsuccessful sign-in: Please check your email and password'
    end
    redirect '/listings'
  end

  delete '/sessions' do
    user_name = current_user.user_name
    session[:user_id] = nil
    session[:flash_message] = "#{user_name}: You have signed out"
    redirect '/listings'
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  run! if app_file == $0
end
