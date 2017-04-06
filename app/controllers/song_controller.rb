require 'pry'

class SongController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  # enable :sessions
  # use Rack::Flash

  set :views, Proc.new { File.join(root, "../views/") }

  # CREATE

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    song = Song.new(params[:song])
    if !params[:genre][:name].empty?
      genre = Genre.new(params[:genre])
      song.genres << genre
    end
    if !params[:artist][:name].empty?
      if Artist.all.any?{|artist| artist.name == params[:artist][:name]}
        song.artist = Artist.find_by(name: params[:artist][:name])
      else
        artist = Artist.new(params[:artist])
        song.artist = artist
      end
    end
    song.save
    session[:flash_message] = "Successfully created song."
    redirect to "/songs/#{song.slug}"
  end

  # READ

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @message = session[:flash_message]
    session[:flash_message] = nil
    @song = Song.all.detect{|song| song.slug == params[:slug]}
    erb :'/songs/show'
  end

  # UPDATE

  get '/songs/:slug/edit' do
    @artists = Artist.all
    @genres = Genre.all
    @song = Song.all.detect{|song| song.slug == params[:slug]}
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.all.detect{|song| song.slug == params[:slug]}
    song.update(params[:song])
    if !params[:artist][:name].empty?
      artist = Artist.new(params[:artist])
      artist.songs << song
      artist.save
    end
    if !params[:genre][:name].empty?
      genre = Genre.new(params[:genre])
      genre.songs << song
      genre.save
    end
    session[:flash_message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

  # DELETE

  delete '/songs/:slug/delete' do
    @song = Song.all.detect{|song| song.slug == params[:slug]}.delete
    erb :'/songs/delete'
  end

end
