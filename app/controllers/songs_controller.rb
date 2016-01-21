class SongsController < ApplicationController
	
	get '/songs/new' do   
		erb :'song/new'
	end

	get '/songs/:slug/edit' do
  		@song=Song.find_by_slug(params[:slug])
    	erb :'song/edit'
	end

	patch '/songs/:slug' do
		edited_song=Song.find_by_slug(params[:slug])
		artist = Artist.find_or_create_by(name: params["Artist Name"]) unless params["Artist Name"]==""
		#binding.pry
		edited_song.artist = artist if artist
		puts params
		SongGenre.where(song_id: edited_song.id).destroy_all
		if params[:genres]
			params[:genres].each do |genre|
				genre_class = Genre.find(genre.to_i)
				bridge = SongGenre.new(genre_id: artist.id, song_id: new_song.id)
				bridge.save if bridge
			end
		end

		edited_song.save
		@song=edited_song
		erb :'song/song', locals: {message: "Song successfully updated."}
	end

	get '/songs/:slug' do
  		@song=Song.find_by_slug(params[:slug])
    	erb :'song/song'
	end

	get '/songs' do
  		@songs=Song.all
    	erb :'song/songs'
	end

	post '/songs' do
		new_song = Song.new(name: params["Name"])
		artist = Artist.find_or_create_by(name: params["Artist Name"]) unless params["Artist Name"]==""
		#binding.pry
		new_song.artist = artist if artist
		puts params
		new_song.save
		if params[:genres]
			params[:genres].each do |genre|
				genre_class = Genre.find(genre.to_i)
				bridge = SongGenre.new(genre_id: genre_class.id, song_id: new_song.id)
				#puts bridge
				bridge.save if bridge
			end
		end
		puts new_song.genres
		#binding.pry
		new_song.save
		@song=new_song
		erb :'song/song', locals: {message: "Successfully created song."}
	end

	

end