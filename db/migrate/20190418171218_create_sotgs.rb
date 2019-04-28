class CreateSotgs < ActiveRecord::Migration[5.2]
  def change
    create_table :sotgs do |t|
      t.integer :sotg_score
      t.references :voting_team, foreign_key: {to_table: :teams}
      t.references :voted_team, foreign_key: {to_table: :teams}
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
