class SongsController < ApplicationController

  get "/songs" do
    @song = Song.all
    erb :"songs/index"
  end

  post "/songs" do
    @song = Song.create(:name => params[:name])
    params[:genres].each do
      @song.genres << Genre.find_by_id(id)
    end
    artist = Artist.find_or_create_by(:name => params[:artist])

    artist.songs << @song
    artist.save
    @song.save

    flash[:message] = "Successfully created song."
    redirect to :"/songs/#{@song.slug}"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  get "/songs/new" do

  end

end
