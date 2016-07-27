class SongsController < ApplicationController

  get "/songs" do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post "/songs" do
     @song = Song.create(name: params["Name"])
     @song.artist = Artist.create(name: params["Artist Name"])
#     @song.genres << Genre.find(params[:genres][])
     params[:genres][].each do |g|
       @song.genres << Genre.find(g)
     end

    # if !params[:pet][:name].empty?
    #   @owner.pets << Pet.create(name: params[:pet][:name])
    # end
    @song.save

    redirect "songs/#{@song.slug}"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
