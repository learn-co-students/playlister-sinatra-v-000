class Genre < ActiveRecord::Base
    has_many :artists
    has_many :songs

    def slug
      name.downcase.gsub(" ","-")
end
    def self.find_by_slug_method(slug)
      Genre.all.find{|genre| genre.slug == slug}
    end
  end
