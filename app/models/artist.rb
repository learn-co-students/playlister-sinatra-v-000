class Artist < ActiveRecord::Base
    extend Slugify::ClassMethods
    include Slugify::InstanceMethods
    has_many :songs
    has_many :genres, through: :songs

    #def self.find_by_slug(slug)
       # self.all.find{|name| name.slug == slug}
   # end

    #def slug
     #   self.name.downcase.gsub(" ", "-")
    #end  

end