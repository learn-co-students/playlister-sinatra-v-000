module Slugifiable

  module InstanceMethods
    def slug
      self.name.downcase.split(" ").join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)

      @@song_name = slug.gsub(/-/, " ").split(" ").map do |word|
        word.capitalize
      end.join(" ")
      #song = self.find_by(name: song_name)

      song = self.all.find do |something|
        something.slug == slug
      end

    end
  end


end
