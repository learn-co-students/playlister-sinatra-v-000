module Slugifiable
  include ActiveSupport::Concern
  def slug
    #binding.pry
    self.name.strip.downcase.gsub(" ", "-")
  end

end
