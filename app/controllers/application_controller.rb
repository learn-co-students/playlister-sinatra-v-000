class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  # LibraryParser.new.call

  get '/' do
    # LibraryParser.new.call
    erb :index
  end

  # get '/songs' do
  #   @songs = Song.all
  #   erb :'songs/index'
  # end

  # get '/songs/:slug' do
  #   # @song = Song.all.find_by slug: :slug
  # end

end
