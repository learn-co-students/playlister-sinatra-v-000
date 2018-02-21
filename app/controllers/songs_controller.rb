require 'sinatra/base'
require 'rack-flash'

class SongsController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/songs") }
    enable :sessions
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :index
    end

    get '/songs/new' do
        @genres = Genre.all
        @artists = Artist.all
        erb :new
    end

    get '/songs/:slug/edit' do 
        @song = Song.find_by_slug(params[:slug])
        erb :edit
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :show
    end

    post '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])

        if params[:artist_name] != ""
            artist = Artist.find_by(name: params[:artist_name])
            if !artist
                artist = Artist.create(name: params[:artist_name])
            end
            @song.artist = artist
            @song.save
        end 
        
        flash[:message] = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end

    post '/songs' do
        @artist = Artist.find_by(name: params[:artist_name])
        if !@artist
            @artist = Artist.create(name: params[:artist_name])
        end
        @song = Song.create(name: params[:name], artist: @artist)

        @song.genres = params[:genres].collect do |genre|
            Genre.find(genre)
        end
        
        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
    end

end