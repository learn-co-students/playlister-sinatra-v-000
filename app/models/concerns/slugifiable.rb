require 'pry'

module Concerns
  module Slugifiable

    module InstanceMethods
      def slug
        self.name.downcase.gsub(/\s/,'-')
      end
    end

    module ClassMethods
      def find_by_slug(slug)
        self.all.detect{|object| object.slug == slug}
      end
    end

    # unclear why the class method isn't defined as self.find_by_slug(slug)

  end
end
