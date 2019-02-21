require 'rack-flash'
class SongsController < ApplicationController

use Rack::Flash

get '/songs' do
@songs = Song.all
  erb :'/songs/index'
end

get '/songs/new' do

  erb :'/songs/new'
end

post '/songs' do

newsong = Song.create(:name => params[:song_name], :genre_ids => params[:genres])
  if Artist.find{|artist| artist.name == params[:artist_name]}
    artistinput = Artist.find{|artist| artist.name == params[:artist_name]}
    newsong.artist_id = artistinput.id
    newsong.save
  else
    tempartist = Artist.create(:name => params[:artist_name])
    newsong.artist_id = tempartist.id
    newsong.save
  end
slug = newsong.slug
flash[:message] = "Successfully created song."
redirect "/songs/#{slug}"
end

get '/songs/:slug/edit' do
  @song = Song.find_by_slug(params[:slug])
  @genres = @song.genres.uniq
  erb :'/songs/edit'
end

patch '/songs/:slug' do

###bugfix
if !params.keys.include?("genres")
    params[:genre] = []
    end
###/bugfix
@song = Song.find(params[:slug])


if params[:artist_name] == ""
  @song.genre_ids = params[:genres]
  @song.save
elsif Artist.find{|artist| artist.name == params[:artist_name]}
  artistinput = Artist.find{|artist| artist.name == params[:artist_name]}
  @song.artist_id = artistinput.id
  @song.genre_ids = params[:genres]
  @song.save
else
  tempartist = Artist.create(:name => params[:artist_name])
  @song.artist_id = tempartist.id
  @song.genre_ids = params[:genres]
  @song.save
end

flash[:message] = "Successfully updated song."
  redirect :"/songs/#{@song.slug}"
end

get '/songs/:slug' do
@song = Song.find_by_slug(params[:slug])
@genres = @song.genres.uniq
@artist = @song.artist
  erb :'/songs/show'
end

end
