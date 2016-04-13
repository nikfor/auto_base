class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.string :car_number
      t.string :car_passport
      t.date :date_of_issue_passport
      t.timestamps null: false
    end
  end
end
