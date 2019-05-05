class CreateSotgs < ActiveRecord::Migration[5.2]
  def change
    create_table :sotgs do |t|
      t.integer :sotg1
      t.integer :sotg2
      t.integer :sotg3
      t.integer :sotg4
      t.integer :sotg5
      t.integer :total
      t.text :comment
      t.references :voting_team, foreign_key: {to_table: :teams}
      t.references :voted_team, foreign_key: {to_table: :teams}
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
