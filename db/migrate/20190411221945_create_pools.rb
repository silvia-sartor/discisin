class CreatePools < ActiveRecord::Migration[5.2]
  def change
    create_table :pools do |t|
      t.boolean :notification?, default: true
      t.string :name
      t.integer :classific

      t.timestamps
    end
  end
end
