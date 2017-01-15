require 'rack-flash'

class SongController < Sinatra::Base
   register Sinatra::ActiveRecordExtension
   enable :sessions
   set :session_secret, "my_application_secret"
   set :views, Proc.new { File.join(root, "../views/") }
   use Rack::Flash

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    # binding.pry
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params["artist"]["name"].empty?
        if !Artist.find_by(name: params["artist"]["name"]) #if artist doesn't exist
          @song.artist = Artist.create(name: params["artist"]["name"])
      else
        @song.artist = Artist.find_by(name: params["artist"]["name"]) #set @song.artist to existing artist
      end
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
  @slug = params[:slug]
  @song = Song.find_by_slug(@slug)
  erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
  @slug = params[:slug]
  @song = Song.find_by_slug(@slug)
  erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params["song"])
    if !params["artist"]["name"].empty?
        if !Artist.find_by(name: params["artist"]["name"]) #if artist doesn't exist
            # @song.artist = Artist.create(name: params["artist"]["name"])
            @song.update(artist: Artist.create(name: params["artist"]["name"]))
        else
            # @song.artist = Artist.find_by(name: params["artist"]["name"]) #set @song.artist to existing artist
            @song.update(artist: Artist.find_by(name: params["artist"]["name"]))
        end
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end

end #class