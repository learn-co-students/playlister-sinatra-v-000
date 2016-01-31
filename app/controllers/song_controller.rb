require 'pry'
class SongController < Sinatra::Base
get '/songs' do
    @songs = Song.all
    @songs.collect do |s|
      "<ol><a href='/songs/#{s.slug}'>#{s.name}</a></ol>"
    end
  end

  get '/songs/:slug' do
    binding.pry
    song_name=Song.find_by_slug(params[:slug])
    artist_id=Song.find_by(name: song_name)
    artist_name = Artist.find_by(id: artist_id)
    "#{artist_name}"
  end


end
