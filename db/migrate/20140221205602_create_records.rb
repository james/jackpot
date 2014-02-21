class CreateRecords < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :number
      t.timestamps
    end
  end
end
