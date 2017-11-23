
module Slugifiable

  module Slug
    def slug
      self.name.gsub(/\W/,"-").downcase
    end

    def unslug
      slug.gsub("-"," ").split.select{|x|x.capitalize!}.join(" ")
    end
  end

  module Find_by
    def self.find_by(slug)
      normalize =  slug.gsub("-"," ").split.select{|x|x.capitalize!}.join(" ")
      Artist.all.find_by({name: normalize})
    end
  end

end
