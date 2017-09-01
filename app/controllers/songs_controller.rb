require 'rack-flash'

class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  use Rack::Flash

  get '/' do
    erb :index
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @songs = Song.find_by_slug(params["slug"])
    erb :'songs/show'
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params["slug"])
    erb :'/songs/edit'
  end

  post '/songs' do
    @songs = Song.create(params[:song])
    @artist = Artist.all.find {|a| a.name == params["artist"]["name"]}
		if !params["artist"].empty? && !@artist
		 	@songs.artist = Artist.create(name: params["artist"]["name"])
		else
		 	@songs.artist = @artist
		end
		@songs.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@songs.slug}"
  end

  patch '/songs/:slug' do
    @songs = Song.find(params[:id])
    @songs.update(params["song"])
    if !params["artist"].empty? && !@artist
      @songs.artist_id = Artist.create(name: params["artist"]["name"]).id
      @songs.save
    end
    redirect to ("/songs/#{@songs.slug}")
  end

end
