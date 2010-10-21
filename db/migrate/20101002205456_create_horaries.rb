class CreateHoraries < ActiveRecord::Migration
  def self.up
    create_table :horaries do |t|
	  t.date	:day, :null => false
	  t.time	:startTime, :null => false
	  t.time	:finalHour, :null => false
	  t.integer	:doctor_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :horaries
  end
end
