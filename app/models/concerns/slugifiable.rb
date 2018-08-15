module Slugifiable
  module InstanceMethods
    def slug
      self.name.gsub(/[^_\.\$\+\*'\(\)\,\-!A-Za-z0-9]/, "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|obj| obj.slug == slug}
    end

    def slugify(name)
      sname.gsub(/[^_\.\$\+\*'\(\)\,\-!A-Za-z0-9]/, "-")
    end
  end

end
