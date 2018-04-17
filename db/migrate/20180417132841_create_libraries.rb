class CreateLibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :libraries do |t|
      t.string :number, null: false, default: ''
      t.text :name, null: false
      t.text :address, null: false

      t.timestamps
    end
  end
end
