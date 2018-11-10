class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @slug = params[:slug].gsub("-"," ")
    binding.pry
    erb :'songs/show'
  end


  # 4] pry(#<SongsController>)> Song.find_by_slug(@slug)
  # => nil
  # [5] pry(#<SongsController>)> Song.find(1)
  # => #<Song:0x00000004731208 id: 1, name: "That One with the Guitar", artist_id: 1>
  # [6] pry(#<SongsController>)> @slug
  # => "that one with the guitar"

  #  proper the name and find by artist_id
end
