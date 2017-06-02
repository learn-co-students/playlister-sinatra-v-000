require 'pry'
module Slugifiable
  module InstanceMethods
    def slug
      self.name.gsub(/\s/, "-").downcase
    end
  end
   module ClassMethods
      def find_by_slug(slug)
        unslug = slug.gsub(/-/, " ")
        array = ["the", "with", "a"]
        self.find_by(name: unslug.split.collect do |x|
        if array.include?(x)
          x
        else
          x.capitalize
          end
        end.join(" ") )
      end
    end
end
