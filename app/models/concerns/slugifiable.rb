module Slugifiable
  def self.included base
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module InstanceMethods
    def slug
      if self.name.include?(" ")
        self.name.downcase.gsub(" ", "-")
      else
        self.name.downcase
      end
    end
  end

    module ClassMethods
      def find_by_slug(slug)
        name_array = slug.split("-").map {|e| e.capitalize}
        name = name_array.join(" ")
        self.find_by(name: name)
      end
    end
end
