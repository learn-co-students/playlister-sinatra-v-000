module Slugifiable

  module ClassMethods
    def find_by_slug(slug)#Class Method
      self.all.find{|data| data.slug == slug}
    #  artist_arr = slug.gsub('-', ' ').split(" ").map do |word|
    #    word.capitalize
    #  end
    #  artist_name = artist_arr.join(" ")
    #  self.find_by(name:artist_name)
    end

  end

  module InstanceMethods

    def slug #Instance Method
      self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

  end

end
