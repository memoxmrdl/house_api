class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.integer :type, null: false
      t.string  :title, limit: 45, null: false
      t.string  :address, limit: 140, null: false
      t.string  :zipcode, limit: 5, null: false
      t.string  :country, limit: 2, null: false
      t.text    :notes, limit: 300
      t.timestamps
    end
  end
end
