module Concerns

  module  Slugifiable

    module ClassMethods
      def find_by_slug(slug)
        self.all.detect {|o| o.slug == slug}
      end
    end

    module InstanceMethods
      def slug
        self.name.downcase.split.join("-")
      end
    end

  end

end
