module Slugifiable

  def self.included(base)
    base.extend(ClassMethods)
  end

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  module ClassMethods

    def find_by_slug(slug)
      self.all.find{ |instance| instance.slug == slug }
    end

  end

end
