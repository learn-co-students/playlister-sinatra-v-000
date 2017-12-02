class SongsController < ApplicationController
  enable :sessions

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
# puts "params= #{params}"
# puts "params[:genre_ids]= #{params[:genre_ids]}"
    artist = Artist.find_or_create_by(name: params[:artist][:name])
    artist.save
    @song = Song.create(params[:song])
    if !params[:genre_ids].empty?
      @song.genres = params[:genre_ids].collect { |id| Genre.find(id)}
    end
    @song.artist = artist
    @song.save

    flash[:message] = "Successfully created song."
# puts "artist.name= #{artist.name}"
# puts "@song.name= #{@song.name}"
# puts "@song.artist.name= #{@song.artist.name}"
# puts "@song.genres.first= #{@song.genres.first}"
# puts "Song.find_by(name: That One with the Guitar)= #{Song.find_by(name: "That One with the Guitar").name}"
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    erb :'/songs/edit'
  end
end
