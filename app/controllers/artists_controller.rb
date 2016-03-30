class ArtistController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  
  get '/artists' do
    @artist = Artist.all
    erb :"/artists/index"
  end
  
  get '/artists/:slug' do 
    @artist = Artist.find_by_slug(params[:slug])
    erb :"/artists/show"
  end
end