require 'rack-flash'

class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  use Rack::Flash
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  
  get '/songs' do
    @songs = Song.all.sort_by{ |song| song.name }
    erb :'/songs/index'
  end
  
  get '/songs/new' do
    @artists = Artist.all.sort_by{ |artist| artist.name }
    @genres = Genre.all.sort_by{ |genre| genre.name }
    
    erb :'/songs/new'
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end
  
  post '/songs' do
    @song = Song.create(params[:song])
    
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    
    if !params[:genre][:name].empty?
      @song.genres << Genre.find_or_create_by(params[:genre])
    end

    @song.save
    
    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end
  
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all.sort_by{ |artist| artist.name }
    @genres = Genre.all.sort_by{ |genre| genre.name }
    
    erb :'/songs/edit'
  end
  
  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    
    if !params[:genre][:name].empty?
      @song.genres << Genre.find_or_create_by(params[:genre])
    end
    
    @song.save
    
    flash[:message] = "Successfully updated song."
    
    redirect "/songs/#{@song.slug}"
  end
end