module Slug
  module ClassMethods
    def find_by_slug(slug)
      self.all.find do |record|
        record.slug == slug
      end
    end
  end

  module InstanceMethods
    def slug
      name.downcase.gsub(/\W/, " ").squeeze(" ").strip.gsub(" ", "-")
    end
  end
end
