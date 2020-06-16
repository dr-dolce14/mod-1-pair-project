class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|
      t.string :common_name
      t.string :color
      t.string :size
      t.string :food
    end
  end
end
