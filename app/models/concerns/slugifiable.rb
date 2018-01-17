module Slugifiable

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def find_by_slug(slug)
      downcase_names = downcase_all
      slug = slug.gsub("-", " ").downcase
      id = downcase_names.index(slug) + 1
      thing = self.find(id)
    end

    def downcase_all
      self.all.collect do |thing|
        thing.name.downcase
      end
    end
  end

  def slug
    self.name.gsub(" ", "-").downcase
  end

end
