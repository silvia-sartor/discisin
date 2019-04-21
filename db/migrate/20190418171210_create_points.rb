class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer :pt
      t.integer :metefatte
      t.integer :metesubite
      t.integer :metedifference
      t.references :team, foreign_key: true
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
