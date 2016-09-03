require 'pry'
class SongsController < ApplicationController
  def slug
    self.name.downcase.gsub(" ","-")
  end
def find_by_slug(slug)
   name = slug.split("-").map { |word| word.capitalize }.join(" ")
   self.find_by_name(name)
  end
  # songs route controller
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
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end



end
