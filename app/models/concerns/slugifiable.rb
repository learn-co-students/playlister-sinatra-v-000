class Slugify
  module ClassMethods
    def find_by_slug(slug)
      name = slug.split('-').collect{|word| word.capitalize}.join(' ')
      self.all.find_by_name(name)
    end

  end

  module InstanceMethods
    def slug
      self.name.sub!(' ', '-').downcase
    end
  end

end
