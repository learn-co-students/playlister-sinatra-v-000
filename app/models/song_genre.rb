class SongGenre < ActiveRecord::Base
belongs_to :genre
belongs_to :song

	include Slug::InstanceMethods
	extend Slug::ClassMethods


end 