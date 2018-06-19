class SongsController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs/new' do
    erb :"/songs/new"
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    @song.save

    if !params[:artist][:name].empty?
      @artist = Artist.create(name: params[:artist][:name])
      @artist.songs << @song
      if !params[:genre][:name].empty?
        @genre = Genre.create(name: params[:genre][:name])
        @artist.genres << @genre
      else
        params[:genre].each do |genre|
          @artist.genres << genre
        end
      end
      @artist.save
    end
    redirect "/songs/#{@song.slug}"
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :"/songs/show"
  end
end
