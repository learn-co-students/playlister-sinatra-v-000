class ArtistController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }

  # READ

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.all.detect{|artist| artist.slug == params[:slug]}
    erb :'/artists/show'
  end


end
