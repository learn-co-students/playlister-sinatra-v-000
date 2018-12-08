class SongsController < ApplicationController


  get '/songs' do
     @songs = Song.all
     erb :'/songs/index'
   end

   get '/songs/new' do
     erb :'/songs/new'
   end

   post '/songs' do
     if !params["Artist Name"].empty?
       @new_artist = Artist.find_or_create_by(:name => params["Artist Name"])
       @song = Song.create(:name => params["Name"], :artist => @new_artist)
       genres = Genre.find_or_create_by(params[:genres])
       @song.genre_ids = genres.id
       @song.save
     else
       artist = Artist.find_by(id: params[:artist_id])
       @song = Song.create(:name => params["Name"], :artist => artist)
       genres = Genre.find_or_create_by(params[:genres])
       @song.genre_ids = genres.id
       @song.save
     end
     flash[:message] = "Successfully created song."
     redirect "/songs/#{@song.slug}"
   end

   get '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])
     erb :'/songs/show'
   end

   get '/songs/:slug/edit' do
     @song = Song.find_by_slug(params[:slug])
     erb :'/songs/edit'
   end

   patch '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])
     @song.update(params[@song])
     artist = Artist.find_or_create_by(name: params[:artist][:name])
     @song.update(artist: artist)
     @song.genre_ids = params[:genres]
     @song.save
     flash[:message] = "Successfully updated song."
     redirect "/songs/#{@song.slug}"
   end



end
