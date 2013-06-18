class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :user_id
      t.string :name
      t.string :realm
      t.string :battlegroup
      t.string :character_class
      t.string :race
      t.string :gender
      t.integer :level
      t.integer :achievementPoints
      t.integer :health
      t.string :powerType
      t.integer :power
      t.integer :strength
      t.integer :agility
      t.integer :stamina
      t.integer :intellect
      t.integer :spirit
      t.decimal :mastery, :precision => 4, :scale => 2
      t.decimal :pvpResilience, :precision => 4, :scale => 2
      t.decimal :pvpPower, :precision => 4, :scale => 2
      t.decimal :pvpPowerDamage, :precision => 4, :scale => 2
      t.decimal :pvpPowerHealing, :precision => 4, :scale => 2

      t.timestamps
    end
  end
end
