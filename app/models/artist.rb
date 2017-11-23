class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

    include Slugifiable::Slug

    def self.find_by_slug(slug)
    normalize =  slug.gsub("-"," ").split.select{|x|x.capitalize!}.join(" ")
    Artist.all.find_by({name: normalize})
    end

#TODO make the above code into a module
    # def self.find_by_slug(slug)
    #   Slugifiable::Find_by.find_by(slug)
    # end



end
