class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.belongs_to :library, index: true
      t.string :name, null: false, default: ''
      t.string :cipher, null: false, default: ''

      t.timestamps
    end
  end
end
