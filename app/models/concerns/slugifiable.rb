module Slugifiable
  extend ActiveSupport::Concern

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  module ClassMethods
    def find_by_slug(slug)
      #name = slug.split("-").collect {|w| w.capitalize}.join(" ")
      name = slug.gsub("-", " ").titleize
      self.find_by_name(name)
    end
  end
end
