class Slugifiable < Sinatra::Base

  def self.slug
    self.gsub(/[ .]/, "-")
  end
end
