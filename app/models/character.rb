class Character < ActiveRecord::Base
  attr_accessible :lastModified, :name, :realm, :battlegroup, :race, :gender, :level, :achievementPoints, :character_class
  # has_many :progressions
  # validates_uniqueness_of :name, :scope => :realm, message: "/ Server combination must be unique"
end
