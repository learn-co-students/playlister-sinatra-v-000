module Slugifiable
    
    module InstanceMethods
        def slug
            name.downcase.gsub(" ","-").gsub(/([\.\,\@\!\?\&\#\$\%\*\"\'\`\:\/\=\+\(\)\/])/,"")
        end
    end

    module ClassMethods
        def find_by_slug(sluggified)
            all.find {|instance| instance.slug == sluggified}
        end
    end
    
end