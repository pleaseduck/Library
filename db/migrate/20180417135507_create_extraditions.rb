class CreateExtraditions < ActiveRecord::Migration[5.1]
  def change
    create_table :extraditions do |t|
      t.belongs_to :subscriber, index: true
      t.belongs_to :book, index: true
      t.date :extradition_date
      t.date :return_date
      t.timestamps
    end
  end
end
