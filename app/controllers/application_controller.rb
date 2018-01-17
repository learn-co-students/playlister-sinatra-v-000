class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    # @song = Song.create(name: "Person with a Face")
    # @genre = Genre.create(name: "New Age Garbage")
    # @artist = Artist.create(name: "That One with the Guitar")
    #
    # @song.song_genres.create(genre: @genre)
    # @song.artist = @artist
    #
    # @song.save
    erb :index
  end
end
