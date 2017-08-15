class CreateUzytkowniks < ActiveRecord::Migration
  def up
    create_table :uzytkowniks do |t|
      t.string "imie", :limit=>20
      t.string "nazwisko", :limit=>60
      t.string "uzytkownik", :limit=>25
      t.string "email", :limit=>100, :default=>"", :null=>false
      t.string "telefon", :default=>"", :null=>false
      t.string "password_digest"
      t.timestamps null: false
    end
    add_index("uzytkowniks", "uzytkownik")
  end
  
  def down
    drop_table :uzytkowniks
  end
end
