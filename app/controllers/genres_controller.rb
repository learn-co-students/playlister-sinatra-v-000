class GenresController < Sinatra::Base

  configure do
    set :views, "app/views/genres"
  end

  get "/genres" do
    @genres = Genre.all
    erb :index
  end

  get "/genres/:slug" do
    @genre = Genre.find_by_slug(params[:slug])
    erb :show
  end

end
