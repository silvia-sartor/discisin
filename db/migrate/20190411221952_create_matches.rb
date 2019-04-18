class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.date :day
      t.time :start_time
      t.string :name
      t.integer :game_length
      t.string :where
      t.float :latitude
      t.float :longitude
      t.string :field
      t.boolean :points?, default: true
      t.integer :hometeam_score, default: nil
      t.integer :awayteam_score, default: nil
      t.integer :hometeam_sotg, default: nil
      t.integer :awayteam_sotg, default: nil
      t.references :hometeam, foreign_key: {to_table: :teams}
      t.references :awayteam, foreign_key: {to_table: :teams}
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
