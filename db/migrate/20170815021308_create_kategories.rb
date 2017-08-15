class CreateKategories < ActiveRecord::Migration
  def up
    create_table :kategories do |t|
      t.string "nazwa"
      t.integer "pozycja"
      t.boolean "widoczna", :default=>true
      t.timestamps null: false
    end
  end
  def down
    drop_table :kategories
  end
end
