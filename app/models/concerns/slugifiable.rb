module Slugifiable
  module slug
    def slug
      str = self.name
      str = str.downcase
      return str.gsub " ", "-"
    end
  end
  module find_slug
    def self.find_by_slug(slug)
      self.all.detect{|inst|
        slug == inst.slug
      }
    end
  end
end
