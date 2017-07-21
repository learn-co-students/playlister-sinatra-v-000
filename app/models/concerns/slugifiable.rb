module Slugifiable
    module InstanceMethods
        def slug 
            self.name.downcase.gsub(/[^\s\w]/,"").gsub(/\s/, "-")
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            self.all.find{ |instance| instance.slug == slug }
        end
    end

end