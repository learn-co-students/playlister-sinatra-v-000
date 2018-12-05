class SongsController < ApplicationController

<<<<<<< HEAD
  get '/songs' do
    @songs = Song.all.sort_by {|song| song.name}
    erb :'/songs/index'
  end

  get '/songs/new' do
  	erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(:name => params[:name])
    artist = Artist.find_or_create_by(:name => params[:artist])

    params[:genres].each do |genre_id|
      @song.genres << Genre.find_by_id(genre_id)
    end
    @song.artist = artist
    @song.save
    # flash[:message] = "Successfully created song."
    # redirect to("/songs/#{@song.slug}")
    erb :'/songs/show', locals: {message: "Successfully created song."}
end

  get '/songs/:slug' do
  	@song = Song.find_by_slug(params[:slug])
  	erb :'/songs/show'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])

    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save
    erb :'/songs/show', locals: {message: "Successfully updated song."}
  end


  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end



=======
 get '/songs' do
   @songs = Song.all
   erb :'/songs/index'
 end

 get '/songs/new' do
   erb :'/songs/new'
 end

 get '/songs/:slug' do
   @song = Song.find_by_slug(params[:slug])
   erb :'songs/show'
 end

 post '/songs' do
   @song = Song.create(:name => params["Name"])
   @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
   @song.genre_ids = params[:genres]
   @song.save

   erb :'songs/show', locals: {message: "Successfully created song."}
 end

 get '/songs/:slug/edit' do
   @song = Song.find_by_slug(params[:slug])

   erb :'songs/edit'
 end

 patch '/songs/:slug' do
   @song = Song.find_by_slug(params[:slug])

   @song.update(params[:song])

   @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
   @song.save

   erb :'songs/show', locals: {message: "Song successfully updated."}
 end
>>>>>>> e415e7cd986e05b5834fbcc02fa42d725277e25e
end
