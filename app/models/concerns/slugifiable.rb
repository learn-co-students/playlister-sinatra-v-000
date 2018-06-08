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
        self.all.detect{|e| e.slug == slug}
      end
    end
end
