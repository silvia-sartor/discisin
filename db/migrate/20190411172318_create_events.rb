class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :when
      t.string :city
      t.float :latitude
      t.float :longitude
      t.float :price
      t.string :currency
      t.text :description
      t.string :links
      t.string :contact
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
