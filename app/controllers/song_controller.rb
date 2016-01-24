class SongController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/songs")}
  
  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get "/songs/new" do
    @genres = Genre.all
    erb :new
  end

  post "/songs" do 
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    params["genre"].each do |genre|
      @song.genres << Genre.find_by(name: genre)
    end
    @song.save
    erb :show, :locals => {:message => "Successfully created song."}
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show 
  end

  get '/songs/:slug/edit' do
    @song = Song.all.find_by_slug(params[:slug])
    erb :edit
  end

  post '/songs/:slug' do 
    @song = Song.all.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params["Artist Name"]) if !params["Artist Name"].empty?
    @song.genres.clear
    @song.update(artist: @artist) if !!@artist 
    if !!params["genre"]
      params["genre"].each do |genre|
        @song.genres << Genre.find_by(name: genre)
      end
    end
    erb :show, :locals => {:message => "Song successfully updated."}
  end
end

