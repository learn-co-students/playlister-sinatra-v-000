class Slugifiable < Sinatra::Base

  def self.slug
    self.name.gsub(/[ .]/, "-")
  end
end
