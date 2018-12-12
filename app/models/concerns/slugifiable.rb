# module Slugifiable
#   module InstanceMethods
#     extend ActiveSupport::Concern
#
#     def find_by_slug(slug)
#       def slug
#         self.name.split(/\W/).map {|word| word.downcase unless word.empty?}.compact.join('-')
#
#       end
#     end
#   end
#
#   module ClassMethods
#     extend ActiveSupport::Concern
#
#
      # def self.find_by_slug(slug)
      #   unslugged = nil
      #   unslug_arr = slug.split('-')
      #   self.all.map do |obj|
      #     if obj.name.downcase.include?(unslug_arr[0]) && obj.name.downcase.include?(unslug_arr[-1])
      #       unslugged = obj
      #     end
      #   end
      #   self.find_by_name(unslugged.name)
      # end



#   end
# end
