module Slugifiable
  module ClassMethods
    def find_by_slug(slug)
      Artist.all.find{ |artist| artist.slug == slug}
    end
  end

  module InstanceMethods
    def slug
      name.downcase.gsub(" ", "-")
    end
  end

end
