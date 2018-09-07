module Slugifiable
  module InstanceMethods
    def slug
      name.downcase.split(' ').join("-")
      binding.pry
    end
  end
  
  module ClassMethods
    def self.find_by_slug(slug)
      param = slug.split("-").join(" ")
      Artist.find_by(name: param)
      binding.pry
    end
  end
end