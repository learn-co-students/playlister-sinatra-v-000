module Slugifiable

  # class methods
  module ClassMethods

  end

  # instance methods
  module InstanceMethods

    def slug
      self.name.downcase.split(" ").join("-").sub /[^a-zA-Z0-9 -]/, ""
    end

  end

end
