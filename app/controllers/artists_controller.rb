class ArtistsController < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  get '/artists' do
    @artists = Artist.all
    erb :artists
  end

  get '/artists/new' do

    erb :new_song
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :artist
  end

end
