class CreateMeetings < ActiveRecord::Migration
  def self.up
    create_table :meetings do |t|
	  t.string	:ownerName, :null => false
	  t.integer :ownerId, :null => false
	  t.date	:meetingDate, :null =>false
	  t.time	:meetingHour, :null =>false #retornar citas disponibles una hora antes y una hora despues
	  t.integer	:doctor_id, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :meetings
  end
end
