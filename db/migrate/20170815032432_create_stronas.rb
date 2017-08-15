class CreateStronas < ActiveRecord::Migration
  def up
    create_table :stronas do |t|
      t.integer "kategorie_id"
      t.string "nazwa"
      t.integer "pozycja"
      t.boolean "widoczna", :default=>true
      t.timestamps null: false
    end
    add_index("stronas", "kategorie_id")
  end
  def down
    drop_table :stronas
  end
end
