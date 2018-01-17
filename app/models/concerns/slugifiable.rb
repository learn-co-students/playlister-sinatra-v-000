module Slugifiable
  
  module Instance

    def slug
      slug = self.name.strip.downcase.gsub(/[\&\$\+\,\/\:\;\=\?\@\#\s\<\>\[\]\{\}\|\~\^|\%\(\)\*]/, "-").gsub(/\-{2,}/, "-")
    end

  end

  module Class

    def find_by_slug(slug)
      self.all.each do |object|
        name = object.slug
        if name == slug
          return object
        end
      end
    end
    
  end

end