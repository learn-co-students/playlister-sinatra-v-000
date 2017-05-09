module Concerns
    module ClassMethods
        def find_by_slug(slug)
            all.detect {|a| a.name.to_s.downcase.gsub(" ", "-") == slug}
        end
    end

    module InstanceMethods
        def slug
            self.name.to_s.downcase.split.join("-")
        end
    end

end