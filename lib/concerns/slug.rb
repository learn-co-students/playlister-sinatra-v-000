module Slug

  module InstanceMethods

    def slug
      @slug || self.slugify
    end

    def slugify
      @slug = self.name.downcase.gsub(/[^\s^a-z^0-9]/,"").gsub(" ","-")
      self.slug = @slug
      self.save
      @slug
    end

  end

  module ClassMethods

    def find_by_slug(slug)
      self.find_by(slug: slug) ||
      self.all.each do |record|
        if !record.slug
          slug.slugify
        end
      end
      self.find_by(slug: slug)
    end

  end

end
