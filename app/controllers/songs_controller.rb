require 'rack-flash' #just here is fine.

class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    erb :"songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  post '/songs' do
    @song = Song.create(name: params[:song_name]) #params["Name"]
    @song.artist = Artist.find_or_create_by(name: params[:artist_name]) #params["Artist Name"]

    @song.genre_ids = params[:genres] #much more elegant than...
    #Mine below
      # params[:genres].each do |genre_id|
      #   @song.genres << Genre.find(genre_id)
      # end
    @song.save

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"

  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    #soln: 49/50 replaced by @song.update(params[:song]) #didn't work for me...my naming convention probably.
    @song.name = params[:song_name] #named this "song[name]" in edit.erb
    @song.genre_ids = params[:genres] #named this "song[genre_ids][]" edit.erb

  # @song.artist = Artist.find_or_create_by(name: params[:artist][:name])  #my posting convention needs work.
    @song.artist = Artist.find_or_create_by(name:params[:artist_name]) #theirs was "artist[name]"
    @song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
