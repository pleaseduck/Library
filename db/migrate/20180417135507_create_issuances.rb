class CreateIssuances < ActiveRecord::Migration[5.1]
  def change
    create_table :issuances do |t|
      t.belongs_to :subscriber, index: true
      t.belongs_to :book, index: true
      t.date :issuance_date
      t.date :return_date
      t.timestamps
    end
  end
end
