require 'rack-flash'

class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/songs") }
  use Rack::Flash

	get '/songs' do 
  		@songs = Song.all
  		erb :'index'
  	end

  get '/songs/new' do 
    @genres = Genre.all
    erb :'new'
  end

	get '/songs/:slug' do 
		@song = Song.find_by_slug(params[:slug])
    # binding.pry
		erb :'show'
	end

  get '/songs/:slug/edit' do 
    erb :'edit'
  end
 
  post '/songs' do 
    @song = Song.create(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save
    params[:genres].each do |g|
      @song.genres << Genre.find(g)  
    end
    @song.save

    flash[:message] = "Successfully created song."

    redirect :"/songs/#{@song.slug}"
  end

end