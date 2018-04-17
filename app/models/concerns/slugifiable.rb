class Slugifiable

  attr_reader :instance

  def initialize(instance)
    @instance = instance
  end

  def slug
    self.name.downcase.gsub(/\s+/, '-')
  end

  def self.find_by_slug(slug)
    self.all.detect {|element| element.name.slug == slug}
  end


end
