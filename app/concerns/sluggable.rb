module Concerns::Sluggable

  def slug
    self.name.downcase.gsub(" ", '-')
  end

end  