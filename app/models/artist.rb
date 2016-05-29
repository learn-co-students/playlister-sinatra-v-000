class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
    
    def self.find_by_slug(slug)
        self.where("LOWER(name) = ?",slug.gsub("-"," ")).first
    end
    
    def slug
        self.name.split(" ").map {|x| x.downcase}.join("-")
    end
end