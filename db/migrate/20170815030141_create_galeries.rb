class CreateGaleries < ActiveRecord::Migration
  def up
    create_table :galeries do |t|
      t.string "nazwa"
      t.integer "pozycja"
      t.text "opis"
      t.boolean "widoczna", :default => false
      t.attachment :zdjecie
      t.timestamps null: false
    end
  end
  def down
    drop_table :galeries
  end
end
