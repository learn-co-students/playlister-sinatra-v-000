# This is a custom object I'm building to expand the program out
# and mess around with all the functionality
class Author < ActiveRecord::Base
  has_many :tractates
  has_many :languages, through: :tractates
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
end
