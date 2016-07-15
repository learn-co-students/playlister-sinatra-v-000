module Slugifiable

  def slug
    self.name.gsub(/\s+/, '-').downcase
  end

  def self.included(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    def find_by_slug(param_slug)
      self.all.find do |x|
        x.slug == param_slug
      end
    end
  end

end
