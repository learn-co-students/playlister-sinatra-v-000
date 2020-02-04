module Slugifiable 

        def slug(name)
            self.name.downcase.gsub(" ", "-")
        end

end
