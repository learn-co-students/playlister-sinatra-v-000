module SlugMethods
  module InstanceMethods
    def slug
      self.name.downcase.split(' ').join('-')
    end
  end
  module ClassMethods
    def find_by_slug(slug) # IS THERE A MORE EFFICIENT WAY???
      match = nil
      self.all.each do |artist|
        if artist.slug == slug
          match = artist
        end
      end
      match
    end
  end
end
