class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name], genres: collect_genres(params))
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:song][:name], genres: collect_genres(params))
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

  helpers do
    def collect_genres(params)
      params[:song][:genre_ids].collect {|genre_id| Genre.find_by_id(genre_id.to_i)}
    end
  end
end
