module Concerns
  module Slugifiable
    def slug
      self.name.split(' ').join('-').downcase
    end

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def find_by_slug(slug)
        self.where('name = ? COLLATE NOCASE', slug.split('-').join(" ")).take
        # self.find_by(name: slug.split('-').map(&:capitalize).join(" "))
      end
    end
  end
end
