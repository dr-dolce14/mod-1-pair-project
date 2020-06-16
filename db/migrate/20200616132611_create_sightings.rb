class CreateSightings < ActiveRecord::Migration[5.2]
  def change
    create_table :sightings do |t|
      t.integer :birdwatcher_id
      t.integer :bird_id 
      t.datetime :time_of_day
      t.string :weather
      t.string :location
    end
  end
end
