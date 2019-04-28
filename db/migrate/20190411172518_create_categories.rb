class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :cat
      t.boolean :show_teams?,  default: false
      t.boolean :show_schedule?, default: false
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
