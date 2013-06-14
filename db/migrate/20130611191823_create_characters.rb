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
      
      t.timestamps
    end
  end
end
