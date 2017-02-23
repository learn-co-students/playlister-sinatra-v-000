 require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  enable :sessions
  use Rack::Flash

  get '/' do
    erb :index
  end

    get "/songs" do
      @songs = Song.all
      erb :'songs/index'
    end

    get "/songs/new" do
      erb :'songs/new'
    end

    post "/songs" do
      @song = Song.create(name: params[:song])
      @song.artist =  Artist.find_or_create_by(:name => params[:artist])
      @song.genre_ids = params[:genres]
      @song.save
      flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
    end


    get "/songs/:slug" do
      @song = Song.find_by_slug(params[:slug])
      erb :'songs/show'
    end

    get "/songs/:slug/edit" do
      @song = Song.find_by_slug(params[:slug])
      erb :'songs/edit'
    end

    patch "/songs/:slug" do
     @song = Song.find_by_slug(params[:slug])
     @song.update(params[:song])
     @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
     @song.save

     flash[:message] = "Successfully updated song."
      redirect to "/songs/#{@song.slug}"
   end




end
