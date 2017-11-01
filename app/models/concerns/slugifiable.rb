module Slugifiable

  module KlassMethods
    def find_by_slug(slug)
      # binding.pry
      split_slug = slug.split("-")
      split_slug.each do |word|
        word.capitalize!
      end
      name = split_slug.join(" ")
      self.find_by(name: name)
    end
  end


  module InstanceMethods
    def slug
      slug = self.name.strip
      # binding.pry
      split_slug = slug.split(" ")
      # binding.pry
      slug = split_slug.join("-")
      slug.downcase
    end
  end

end
