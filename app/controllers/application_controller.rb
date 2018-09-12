class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/error' do

    erb :error
  end


  get '/load' do

    erb :load
  end

  post '/load' do
    #first three songs
    songs = []
    i = 0
    while i < 3
      songs << Song.all[i]
      i += 1
    end

    songs.each do |song|
      song.artist = Artist.third
      song.genres << Genre.second
      song.save
    end

    songs.clear
  
    #NEXT BATCH OF SONGS

    i = 3
    while i < 6
      songs << Song.all[i]
      i += 1
    end

    songs.each do |song|
      song.artist = Artist.first
      song.genres << Genre.first
      song.save
    end

    songs.clear

    #NEXT BATCH OF SONGS

    i = 6
    while i < 9
      songs << Song.all[i]
      i += 1
    end

    songs.each do |song|
      song.artist = Artist.second
      song.genres << Genre.third
      song.save
    end

    songs.clear
    
  end
end