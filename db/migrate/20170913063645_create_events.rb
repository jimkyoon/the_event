class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :when
      t.string :where
      t.references :user, index: true
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
    add_foreign_key :events, :users
  end
end
