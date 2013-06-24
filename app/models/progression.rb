class Progression < ActiveRecord::Base
  attr_accessible :name, :lfrBossesKilled, :normalBossesKilled, :heroicBossesKilled
  belongs_to :character
  validates_uniqueness_of :name, :scope => :character_id, message: " / Raid combination must be unique"
end
