module Slugifiable

  module InstanceMethods

    def slug
      # binding.pry
      self.name.gsub(" ", "-").gsub(/[^\w-]/, '').downcase
      # binding.pry
    end

  end


  module ClassMethods

    def find_by_slug(value)
      self.all.detect{ |a| a.slug == value}
    end

  end

end
