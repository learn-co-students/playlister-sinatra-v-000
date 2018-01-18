module Slugifiable
  extend ActiveSupport::Concern

  def slug
    self.name.parameterize
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.map{ |data| @name = data.name if data.slug == slug}

      self.find_by(name: @name)
    end
  end
end
