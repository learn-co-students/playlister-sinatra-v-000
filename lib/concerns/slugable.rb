
module Slugable
     module InstanceMethods

          def slug
               name.downcase.gsub(" ", "-")
          end

     end
end
