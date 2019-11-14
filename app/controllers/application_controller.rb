class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  register Sinatra::Flash
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
  
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end
  
  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end
  
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end
  
  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end
  
  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end
  
  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end
  
  
  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])

    erb :'/artists/show'
  end
  
  post '/songs' do
    
    @song = Song.create(params["song"])
    artist = Artist.all.find do |artist|
      artist.slug == params[:artist][:name].downcase.gsub(' ','-')
    end

    if artist
      artist.songs << @song
    else
      @artist = Artist.create(name: params[:artist][:name])
      @artist.songs << @song
     
    end

    params[:genres].each do |genre|
      @song.genres << Genre.find(genre)
    end
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end
  
  patch '/songs/:slug' do

    @song = Song.find_by(params[:name])
    @song.update(params[:song])
    if !Artist.find_by(name: params[:artist][:name])
      @artist = Artist.create(name: params[:artist][:name])
      @artist.songs << @song
    else
      Artist.find_by(name: params[:artist][:name]).songs << @song
    end

    @song.genres.clear
    params[:genres].each do |genre|
      @song.genres << Genre.find(genre)
    end

    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end
end