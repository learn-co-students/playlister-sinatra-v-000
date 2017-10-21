module Slugable

  def slug
    self.name.downcase.gsub(" ", "-")
  end

end