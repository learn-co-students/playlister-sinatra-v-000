require 'pry'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    erb :songs_view
  end

  get '/artists' do
    erb :artists_view
  end

  get '/genres' do
    erb :genres_view
  end

  get '/songs/new' do
    erb :createsongs
  end

  post '/songs' do

     @song = Song.create(name: params[:song_name])
     # if --
     @artist = Artist.create(name: params[:artist_name])
     #end
     binding.pry
     redirect to "/songs/#{@song.slug}"
   end

   get '/songs/:slug' do

   end

end
