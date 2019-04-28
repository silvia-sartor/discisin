class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.boolean :accepted?, default: false
      t.references :team, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
