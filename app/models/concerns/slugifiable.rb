module Slugifiable
    module InstanceMethods
        def slug
            self.name.gsub(" ","-").downcase
        end
    end

    module ClassMethods
        def find_by_slung(slug)
            self.all.find{|instance|instance.slug == slug}
        end
    end
end