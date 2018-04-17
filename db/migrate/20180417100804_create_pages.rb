class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :name, null: false, default: ''
      t.text :description, null: false

      t.timestamps
    end
  end
end
