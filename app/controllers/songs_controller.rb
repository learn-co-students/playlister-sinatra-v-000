class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs/:slug' do
    raise params.inspect
    if !Artist.find_by_name(params[:song][:artist][:name])

      artist = Artist.create(params[:song][:artist])
      genres = params[:genres].collect {|g| Genre.find(g.to_i)}
      song = Song.create(name: params[:song][:name], artist: artist, genres: genres)
      #flash message
      redirect to '/songs/#{song.slug}'
    else
      artist = Artist.find_by_name(params[:song][:artist][:name])
      genres = params[:genres].collect {|g| Genre.find(g.to_i)}
      song = Song.create(name: params[:song][:name], artist: artist, genres: genres)

    end
    #redirect to '/songs/:slug'
  end

#{"song"=>{"name"=>"Take this Job and Shove It", "artist"=>{"name"=>"Johnny Paycheck"}}, "genres"=>["9"], "captures"=>[]}

end
