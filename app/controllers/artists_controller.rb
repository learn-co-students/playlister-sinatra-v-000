class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :"/artists/index"
  end

  get '/artists/:slug' do
    binding.pry
    @artist = Artist.find_by_slug(params[:slug])
    erb :"/artists/show"
  end

  helpers do
    def slug
      self.name.gsub(" ", "-").downcase
    end

    def find_by_slug(slug)
      self.all.find { |instance| instance.slug == slug}
    end
  end

end
