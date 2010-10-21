class CreateConsultas < ActiveRecord::Migration
  def self.up
    create_table :consultas do |t|
	  t.date	:date, :null => false
	  t.string	:medicalAlert, :null => false
	  t.string	:allergies
	  t.string	:vaccines
	  t.string	:medicalTests
	  t.string	:surgeries
	  t.decimal	:weight, :null => false
	  t.text	:diagnosis, :null => false
	  t.decimal	:temperature, :null => false
	  t.integer	:heartRate, :null => false
	  t.integer	:pulse, :null => false
	  t.text	:injuries
	  t.text	:treatment, :null => false
	  t.datetime :dateAdmission
	  t.datetime :dischargeDate	 
	  t.datetime :dateDeath
	  t.integer	:typeConsult_id, :null => false
	  t.integer	:animal_id, :null => false
	  t.integer	:doctor_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :consultas
  end
end
