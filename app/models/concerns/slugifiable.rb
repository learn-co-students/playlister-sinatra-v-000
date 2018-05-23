require 'pry'
module Slugifiable

  module InstanceMethods
    def slug
      name = self.name.downcase
      name.parameterize
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      name = slug.split("-")
      cap = []

      name.collect do |n|
        cap << n.capitalize
      end

      all.detect { |a| a.slug == slug }
      # all.detect {|a| a.name == cap.join(" ")}

    end
  end
end
