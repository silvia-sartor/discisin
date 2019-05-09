class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.datetime :day_time
      t.string :name
      t.string :category
      t.integer :game_length
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :field
      t.boolean :game_points, default: true
      t.integer :hometeam_score, default: nil
      t.integer :awayteam_score, default: nil
      t.references :hometeam, foreign_key: {to_table: :teams}
      t.references :awayteam, foreign_key: {to_table: :teams}
      t.references :category, foreign_key: true
      t.references :homepool, foreign_key: {to_table: :pools}
      t.references :awaypool, foreign_key: {to_table: :pools}

      t.timestamps
    end
  end
end
