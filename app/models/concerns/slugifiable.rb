module Slugifiable

  def slug
    self.name.downcase.gsub(' ','-').gsub(/[^\w-]/, '')
  end

end