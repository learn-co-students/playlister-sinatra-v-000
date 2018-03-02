# module Slugifiable
#   module ClassMethods
#     def find_by_slug(name)
#            self.all.find {|s| s.slug == name}
#        end

#   end
#   module InstanceMethods
#     def slug
#        self.name.gsub(' ','-').downcase.strip
#      end
#   end

# end
