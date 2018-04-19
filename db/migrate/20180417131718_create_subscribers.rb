class CreateSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers do |t|
      t.belongs_to :library, index: true
      t.integer :subscriber_id
      t.integer :library_id
      t.integer :ticket_number, null: false
      t.string :surname, null: false, default: ''
      t.string :name, null: false, default: ''
      t.text :address, null: false
      t.string :phone_number, null: false, default: ''
      t.timestamps
    end
  end
end
