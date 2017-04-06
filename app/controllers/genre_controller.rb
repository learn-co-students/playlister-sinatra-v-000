class GenreController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }

  # READ

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.all.detect{|genre| genre.slug == params[:slug]}
    erb :'/genres/show'
  end

end
