class Character < ActiveRecord::Base
  attr_accessible :name, :realm, :battlegroup, :race, :gender,
                  :level, :achievementPoints, :character_class,
                  :health, :powerType, :power, :strength, :agility,
                  :stamina, :intellect, :spirit, :mastery, :pvpResilience,
                  :pvpPower, :pvpPowerDamage, :pvpPowerHealing
  has_many :progressions
  validates_uniqueness_of :name, :scope => :realm, message: " / Server combination must be unique"
  belongs_to :user
end
