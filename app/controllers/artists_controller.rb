class ArtistController < Sinatra::Base
   register Sinatra::ActiveRecordExtension
   set :session_secret, "my_application_secret"
   set :views, Proc.new { File.join(root, "../views/") }

  get '/artists' do
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @slug = params[:slug]
    @artist = Artist.find_by_slug(@slug)
    # binding.pry
    erb :'/artists/show'
  end

end