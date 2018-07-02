require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  use Rack::Flash

  get '/' do
    erb :index
  end

  #Could all these index actions be refactored to be more DRY?
  get "/songs" do
    @songs=Song.all
    erb :'songs/songs'
  end

  get "/genres" do
    @genres=Genre.all
    erb :'genres/genres'
  end

  get "/artists" do
    @artists=Artist.all
    erb :'artists/artists'
  end

  get "/songs/new" do
    erb :"songs/new"
  end

  post "/songs" do
    @genres=params[:genre].collect {|id| Genre.find(id)}
    @artist=Artist.find_or_create_by(name:params[:artist])
    @song=Song.create(name:params[:name],genre:@genres,artist:@artist)
    @song.save
    flash[:message]="Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

  get "/songs/:slug/edit" do
    @song=Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    @song=Song.find_by_slug(params[:slug])
    @song.name=params[:name]
    @song.genre=params[:genre].collect {|id|Genre.find(id)}
    @song.artist=Artist.find_or_create_by(name:params[:artist])
    @song.save
    flash[:message]="Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

  get "/songs/:slug" do
    @song=Song.find_by_slug(params[:slug])
    erb :"songs/view"
  end




  get "/genres/:slug" do
    @genre=Genre.find_by_slug(params[:slug])
    erb :"genres/view"
  end

  get "/artists/:slug" do
    @artist=Artist.find_by_slug(params[:slug])
    erb :"artists/view"
  end

  get "/songs/new" do
    erb :"songs/new"
  end


end
