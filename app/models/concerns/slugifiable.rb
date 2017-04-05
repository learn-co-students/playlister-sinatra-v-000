class Slugifiable
  module InstanceMethods
    def slug
      slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{ |instance| instance.slug == slug }
    end
  end
end
