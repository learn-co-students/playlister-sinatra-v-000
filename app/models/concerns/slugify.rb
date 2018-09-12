# module Slugify
#   module InstanceMethods
#     def slug (filename)
#       song_name = filename.gsub(/^(.*) - /, "").gsub(/\[([^\]]*)\].*/, "")
#     end
#   end
#
#   module Class Methods
#     def find_by_slug(slug)
#       instance = self.class.find_by(name: slug)
#     end
#   end
# end
