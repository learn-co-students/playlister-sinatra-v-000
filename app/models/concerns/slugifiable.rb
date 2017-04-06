module Slugifiable

  # class methods
  module ClassMethods
    def find_by_slug(slug)
      song = nil
      self.all.each do |item|
        song = item if item.slug == slug
      end
      song
    end
  end

  # instance methods
  module InstanceMethods

    def slug
      self.name.downcase.split(" ").join("-").sub /[^a-zA-Z0-9 -]/, ""
    end

  end

end
