class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :when
      t.string :where
      t.float :price
      t.string :currency
      t.text :description
      t.string :category
      t.string :links
      t.string :contact
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
