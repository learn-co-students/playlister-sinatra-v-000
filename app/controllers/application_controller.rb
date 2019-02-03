#require 'pry'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
  
  get "/songs" do
    erb :songs
  end
  
  get "/artists" do
    erb :artists
  end
  
  get "/genres" do
    erb :genres
  end
  
  get "/songs/new" do
    erb :song_new
  end
  
  post "/songs" do
    LibraryParser.new.build_object(params[:artist_name], params[:song_name], params[:genre_name])
    
    redirect "songs/#{Song.find(name: params[:song_name]).slug}"
    
  end
  
  get "/songs/:slug" do
  #  binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :song_s
  end
end