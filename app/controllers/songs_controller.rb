class SongsController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }

  get "/songs/new" do
    erb :"songs/new"
  end

  post "/songs/new" do
    #binding.pry
    @song = Song.find_or_create_by(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    params[:genres].each do |id|
      @song.genres << Genre.find(id)
    end
    @song.save
    #binding.pry
    redirect "/songs/#{@song.slug}"

  end



  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'

  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :"/songs/show"
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :"songs/edit"
  end

  post "/songs/edit" do
    @song = Song.find_by(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    #@song.genres.clear
    params[:genres].each { |genre_id| @song.genres << Genre.find(genre_id.to_i)}
    @song.save
    redirect "/songs/#{@song.slug}"
  end
end
