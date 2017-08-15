class CreateArtykuls < ActiveRecord::Migration
  def up
    create_table :artykuls do |t|
      t.integer "strona_id"
      t.string "nazwa"
      t.integer "pozycja"
      t.boolean "widoczna", :default=>true
      t.text "zawartosc"
      t.attachment :zdjecie
      t.timestamps null: false
    end
  end
  def down
  drop_table :artykuls
  end
end
