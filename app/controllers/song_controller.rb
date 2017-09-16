class SongController < ApplicationController
  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    # binding.pry
    @song = Song.create(params[:song])
    if !params[:artist][:name].empty?
      @song.artist = Artist.create(params[:artist])
    end
    if !params[:genre][:name].empty?
      @song.genres << Genre.create(params[:genre])
    end
    @song.save

    redirect :"/songs/#{@song.slug}"
  end

end
