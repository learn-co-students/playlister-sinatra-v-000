module Slugifiable

  def slug
    self.name.gsub(" ", "-").downcase
  end


end
