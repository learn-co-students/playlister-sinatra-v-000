class SongsController < ApplicationController
  
  get "/songs" do 
    @songs = Song.all
    erb :"/songs/index"
  end
  
  get "/songs/new" do 
    @artists = Artist.all
    @genres = Genre.all 
    erb :"songs/new"
  end
  
  post "/songs" do 
    @song = Song.find_or_create_by(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    params[:song][:genres].each do |song_genre|
      @song.song_genres.find_or_create_by(genre: Genre.find(song_genre))
    end
    if @song.save
      erb :"/songs/show", locals: {message: "Successfully created song."}
    else
      redirect "/songs/new"
    end
  end
  
  get "/songs/:slug" do 
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end
  
  get "/songs/:slug/edit" do 
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"/songs/edit"
  end
  
  post "/songs/:slug" do 
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song][:name]
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    # checks if the genre is still included in the song's
    # genres
    @song.song_genres.each do |sg|
      if !params[:song][:genres].include?(sg.id)
        sg.delete
      end
    end
    # checks if a genre from the params is 
    # already assigned to the song
    # if not, it adds the association
    params[:song][:genres].each do |song_genre|
      if !@song.song_genres.include?(SongGenre.find_by(genre_id: song_genre))
        @song.song_genres.create(genre: Genre.find(song_genre))
      end
    end
    @song.save
    erb :"/songs/show", locals: {message: "Song successfully updated."}
  end
  
  
    
end