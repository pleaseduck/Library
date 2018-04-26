class CreateExtraditions < ActiveRecord::Migration[5.1]
  def change
    create_table :extraditions do |t|
      t.belongs_to :subscriber, index: true
      t.belongs_to :book, index: true
      t.datetime :extradition_date
      t.datetime :return_date
      t.timestamps
    end
  end
end
