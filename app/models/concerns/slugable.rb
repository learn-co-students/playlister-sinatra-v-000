
module Slugable
     module InstanceMethods

          def slug
               name.downcase.gsub(" ", "-")
          end

     end

     module ClassMethods

       def self.find_by_slug(slug)
          self.all.find do |instance|
               binding.pry

           instance.slug == slug

          end
         end

       end

end
