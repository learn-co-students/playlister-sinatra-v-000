class SongsController < ApplicationController


  # get '/' do
  #   @songs = Song.all
  #   erb :'songs/index'
  #
  # end

  get '/songs' do
    # binding.pry
    @songs = Song.all
    erb :'songs/index'
    # @songs = Song.all
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    # binding.pry
    @song = Song.create(params[:song])
    @song.name = params["Name"]
    # @song.artist = params["Artist Name"]
    @song.genres <<  Genre.find(params[:genres][0].to_i)


    # binding.pry

    if !params["Artist Name"].empty?
      @song.artist = Artist.create(name: params["Artist Name"])
    end

    @song.save

    # binding.pry
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"

  end





  post '/songs/:slug' do

  end

end
