class SongController < ApplicationController
  get '/' do
    erb :"artists/index"
  end
end
