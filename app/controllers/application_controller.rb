class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  enable :sessions

    get '/' do
      erb :index
    end
end

    # =begin
    # all
    # this will
    # be commented
    # =end
    # get /songs/:slug #Where does this block go?
    # # Any given song's show page should have links to that song's artist and the each genre associated with the song.
    #
    #   erb :'songs/index/:sl'
    # end

    # get /artists/:slug #Where does this block go?
    # # Any given artist's show page should have links to each of his or her songs and genres.
    #
    #   erb :'artists/index'
    # end
    #
    #
    # get :'/genres/:slug' #Where does this block go?
    # # Any given genre's show page should have links to each of its artists and songs.
    #
    #   erb :'/genre/index'
    # end
