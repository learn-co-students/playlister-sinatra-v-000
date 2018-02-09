require 'pry'

module Slugify
  module Instances

    def slug
      word = self.name.downcase
      word.gsub(" ", "-")
    end

  end

  module Classes

    def find_by_slug(slug)
      self.all.detect{|object| object.slug == slug}
    end

  end

end
