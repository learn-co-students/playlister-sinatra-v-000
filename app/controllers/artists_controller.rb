class ArtistsController < ApplicationController

  gets '/artists' do
    erb :'/artists/index'
  end

end
