class SongsController < ApplicationController

  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end


    post '/songs' do
       @song = Song.create(name: params[:Name])
       #binding.pry
       @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
       params["genres"].each do |genre_id|
         songgenre = Genre.find_by_id(genre_id.to_i)
         @song.genres << songgenre
       end
       #@song.genres = Genre.find_by_id(params["genres"][0].to_i)
       @song.save

      #  @songgenre = SongGenre.create(song_id: @song.id, genre_id: params[:genres][0].to_i)
      #  @genre = Genre.find_by_id(@songgenre.genre_id)
       redirect to "/songs/#{@song.slug}"
     end

     get '/songs/:slug' do

       @song = Song.find_by_slug(params[:slug])
       @genre_names = ""
       @song.genres.each do |genre1|
        @genre_names << " #{genre1.name}"
       end
      # binding.pry
       #@artist = Artist.find_by_id(@song.artist_id)
   #binding.pry
       #@songgenre = SongGenre.find_by_song_id(@song.id)
       #@genre = Genre.find_by_id(@songgenre.genre_id)

       #<h4>Genre : <%= @song.genres.each do |genre1|%>
        # <a href= "/genres/<%=genre1.slug%>"><%= genre1.name %></a></h4><%=end%>
       erb :'songs/show'
     end

     get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/pets/:id' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
  #binding.pry
  @song.update(params[:pet])
    #@pet.update(name: params[:pet][:name], owner_id: params[:pet][:owner_id])
  #  if !params[:owner][:name].empty?
  #    @pet.owner = Owner.create(name: params[:owner][:name])
  #  end
      @song.save
    redirect to "songs/#{@song.slug}"
  end




end
