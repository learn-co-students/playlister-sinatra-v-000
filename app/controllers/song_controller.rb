
class SongController < ApplicationController
	 set :views, Proc.new { File.join(root, "../views/") }
	
	get '/songs' do
		erb :'songs/songs', locals: {message: "Successfully created song!"}
	end
	
	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/edit'
	end
	
	get '/songs/new' do
		erb :'songs/form'
	end
	
	post '/songs' do
		
		@song = Song.create(name: params[:song_name])
		@song.genres=params[:genre_ids]
		@artist = Artist.find_by(name: params[:artist_name])
		if @artist.empty?
			@artist = Artist.create(name: params[:artist_name])
		end
		@song.artist=@artist
		@song.save
	end
	

	
	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/song'
	end
	

	
	post '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		@song.genre = Genre.find(params[:genre])
			@artist = Artist.find_by(name: params[:artist_name])
		if @artist.empty?
			@artist = Artist.create(name: params[:artist_name])
		end
		@song.artist=@artist
		@song.save
		redirect "/songs/#{params[:slug]}"
	end

end