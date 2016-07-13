class GenresController < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  get '/genres' do
    @genres = Genre.all
    erb :genres
  end

  get '/genres/new' do

    erb :new_song
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :genre
  end

end
