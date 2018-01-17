module Slugifymodule
    module SlugMethod
        def slug
            name.downcase.tr(' ', '-')
        end
    end

    module FindbySlugMethod
        def find_by_slug(slug)
            self.all.detect do |item|
                item.slug == slug
            end
        end
    end
end
