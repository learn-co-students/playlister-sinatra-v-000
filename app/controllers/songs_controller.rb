
# require 'sinatra-flash'
require 'rack-flash'
#

class SongsController < ApplicationController
    use Rack::Flash
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
    # binding.pry

    erb :'songs/show'
  end


  post '/songs' do
# binding.pry
    @song = Song.create(:name => params["Name"])
    # # @song.name = params["Name"]
    # @genres = Genre.find_by_name(params[:genre])
    # if @genres
    #   @song.genres << @genres
    # else
    #   new_genre = Genre.create(name: @genres)
    #   @song.genres << new_genre
    # end
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    binding.pry
    @song.genre_ids = params[:genres]

    # if !params["Artist Name"].empty?
    #   if Artist.find_by_name(params["Artist Name"])
    #     @song.artist = Artist.find_by_name(params["Artist Name"])
    #   else
    #     @song.artist = Artist.create(name: params["Artist Name"])
    #   end
    # end

    @song.save
    # binding.pry
    flash[:message] = "Successfully created song."
    # binding.pry

    redirect to "/songs/#{@song.slug}"
  end





  get '/songs/:slug/edit' do
    #displays edit form
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
    # binding.pry

  end


  patch '/songs/:slug' do
    # binding.pry
    flash[:message] = "Successfully updated song."

    @song = Song.find_by_slug(params["slug"])
    # @song = Song.find_by_slug(:slug)
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    if !@song.genres.include?(Genre.find(params["genres"][0].to_i))
      @song.genres << Genre.find(params["genres"][0].to_i)
    end
    @song.name = params["Song Name"]
    # binding.pry

    # @song = Song.find_by_name(params["Song Name"])
    # @song.artist.name = params["Artist Name"]
    @song.save
    # binding.pry
    # redirect to "/songs/#{@song.slug}"
    redirect to "/songs/#{@song.slug}"
    binding.pry

  end



  post '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(:slug)
    @song.save
    erb :'songs/:slug'
  end


end
