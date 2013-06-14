class Character < ActiveRecord::Base
  attr_accessible :user_id, :name, :realm, :battlegroup, :race, :gender, :level, :achievementPoints, :character_class
  # has_many :progressions
  # validates_uniqueness_of :name, :scope => :realm, message: "/ Server combination must be unique"
  belongs_to :user
end
