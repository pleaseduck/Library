class CreateExtraditions < ActiveRecord::Migration[5.1]
  def change
    create_table :extraditions do |t|
      t.belongs_to :subscriber, index: true
      t.belongs_to :book, index: true
      t.integer :book_id
      t.integer :subscriber_id
      t.datetime :extradition_date, default: ''
      t.timestamps
    end
  end
end
