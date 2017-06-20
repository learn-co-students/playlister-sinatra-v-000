require 'rack-flash'
class SongsController <ApplicationController
use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    @song.genre_ids = []
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist_name])


    # binding.pry
    if !params[:genres] && params[:new_genre][:name]
      new_genre=Genre.create(name:params[:new_genre][:name])
      @song.genre_ids = new_genre.id
    elsif params[:genres]
      @song.genre_ids = params[:genres]
    end
    flash[:message] = "Successfully created song." if @song.save
    # binding.pry
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #  binding.pry
    erb :'/songs/show'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name:params[:song][:name])
    @song.artist = Artist.find_or_create_by(name:params[:song][:artist_name])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end
end
