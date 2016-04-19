class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    Song.all
#This should present the user with a 
#list of all songs in the library.
#Each song should be a clickable link 
#to that particular song's show page.
  end

  get '/genres' do
    Genre.all
#This should present the user with a 
#list of all genres in the library.
#Each genre should be a clickable link 
#to that particular genre's show page.
  end

  get '/artists' do
    Artist.all
#This should present the user with a 
#list of all artists in the library.
#Each artist should be a clickable link 
#to that particular artist's show page.
  end

  get '/songs/:slug' do
#Any given song's show page should have 
#links to that song's artist and the each 
#genre associated with the song.
#Pay attention to the order of /songs/new 
#and /songs/:slug. The route /songs/new 
#could interpret new as a slug if that controller
#action isn't defined first.
  end

  get '/artists/:slug' do
#Any given artist's show page should have 
#links to each of his or her songs and genres.
  end

  get '/genres/:slug' do
#Any given genre's show page should have 
#links to each of its artists and songs.  
  end

end