class ArtistsController < ApplicationController
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

end
