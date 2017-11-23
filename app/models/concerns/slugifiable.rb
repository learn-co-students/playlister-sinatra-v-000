module Slugifiable
  include ActiveSupport::Concern
  def slug
    self.name.downcase.gsub(" ", "-")
  end

end
