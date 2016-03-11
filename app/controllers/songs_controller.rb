class SongsController < ApplicationController


#read all

  get "/songs" do 
    @songs = Song.all
    erb :"/songs/index"
  end


# create

  get "/songs/new" do 
    @genres = Genre.all
    erb :"/songs/new"
  end

  post "/songs" do 
    song = Song.create(params["song"])
    song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    Genre.find(params["genres"]).each { |genre| song.genres << genre }
    song.save
    erb :"/songs", locals: {message: "Successfully created song."}
  end

# read one

  get "/songs/:slug" do 
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end



# edit



  get "/songs/:slug/edit" do 
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"/songs/edit"
  end
  
  patch "/songs/:slug" do 
    @song = Song.find_by_slug(params[:slug])
    @song.update(params["song"]) unless params["song"]["name"].empty? 
    @song.artist = Artist.find_or_create_by(name: params["artist"]["name"]) unless params["artist"]["name"].empty?
    unless params["genres"].empty?
      int_genres = params["genres"].map { |id| id.to_i }
      Genre.find(int_genres).each { |genre| @song.genres << genre } 
    end
    @song.save
    erb :"/songs/show", locals: {message: "Song successfully updated."} 
  end





end