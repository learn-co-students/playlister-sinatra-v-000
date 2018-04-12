class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
    #<h2><a href='/genre/<%=@song.genres.slug%>'>
    #<%=@song.genre%></a></h2>
    #<%end%>
  end

  get '/songs' do
    erb :'/songs/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end

  get '/genres' do
    erb :'/genres/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end

  get '/artists' do
    erb :'/artists/index'
  end


end
