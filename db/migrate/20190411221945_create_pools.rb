class CreatePools < ActiveRecord::Migration[5.2]
  def change
    create_table :pools do |t|
      t.string :name
      t.string :classific
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
