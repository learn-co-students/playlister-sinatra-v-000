class ArtistsController < Sinatra::Base

  get '/artists' do
    @artists=Artist.all
    erb :'artists/index'
  end

  get "/artists/:slug" do
    slug=
    erb :"artists/:slug"
  end

end
