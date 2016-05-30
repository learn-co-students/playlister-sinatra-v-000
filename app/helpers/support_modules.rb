module Slugs

  def slug
    self.name.gsub!(/\s/,'-')
    self.name.downcase!
  end

  def Slugs.unslug(slug)
    names = slug.split(/-/)
    names.each do |name|
      name.capitalize!
    end
    unslug = names.join(' ')
  end

end
