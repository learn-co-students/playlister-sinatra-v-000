class SongsController < ApplicationController
  require 'rack-flash'
  use Rack::Flash
 get "/songs" do
  erb :'songs/index'
 end

 get '/songs/new' do
  erb :'songs/new'
 end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb:'songs/show'
  end


post '/songs' do

  @artist = Artist.find_or_create_by(name: "#{params["artist_name"]}")
  @genre = Genre.find_or_create_by(name: "#{params["genres_name"]}")
  @song = Song.create(:name => params["song_name"], :artist => @artist)
  @song.song_genres.find_or_create_by(genre: @genre)
  # if !params["artist_name"].empty?
  #     @song.artist = Artist.create(name: params["artist_name"])
  #   end
    @song.save
    flash[:message] = "Successfully created song."
  redirect to "/songs/#{@song.slug}"
end

get '/songs/:slug/edit' do  #load edit form

    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

patch '/songs/:slug' do #edit action
@song = Song.find_by_slug(params[:slug])

  @artist = Artist.find_or_create_by(name: "#{params["artist_name"]}")
  @genre = Genre.find_or_create_by(name: "#{params["genres_name"]}")
  # @song = Song.create(:name => params["song_name"], :artist => @artist) Here is the problem
  @song.artist = @artist
  @song.song_genres.find_or_create_by(genre: @genre)
  @song.save
  flash[:message] = "Successfully updated song."
  redirect to "/songs/#{params[:slug]}"
end

# post '/songs/:slug' do
#   @song = Song.find_by_slug(params[:slug])
#   erb:'songs/show'
#   end
end
