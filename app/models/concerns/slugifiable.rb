module Slugifiable

    module ClassMethods
        def find_by_slug(slug)
            self.all.find do |model|
                model.slug == slug
            end
        end
    end

    module InstanceMethods
        def slug
            #self.name.gsub(/[^_\.\$\+\*'\(\)\,\-!A-Za-z0-9]/, "-").downcase
            self.name.split(" ").collect {|name| name.downcase}.join("-")
        end
    end

end