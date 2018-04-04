module Slugifiable

  module InstanceMethods
    def slug
      self.name.downcase.split(" ").join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      name = slug.gsub(/-/, " ").split(" ").map do |word|
        word.capitalize
      end.join(" ")
      song = self.find_by(name: "#{name}")
      #song = self.find_by(name: name)
        binding.pry
    end
  end


end
