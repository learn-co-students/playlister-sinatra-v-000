class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    #def self.slug
    #    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    #end

    def slug
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.find_by_slug(slug)
        self.all.detect {|i| i.slug == slug}
    end
end
