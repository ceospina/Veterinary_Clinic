# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101106232843) do

  create_table "animals", :force => true do |t|
    t.string   "name",                           :null => false
    t.date     "birthDay"
    t.string   "description",                    :null => false
    t.boolean  "spayed",      :default => false
    t.string   "diet"
    t.integer  "breed_id",                       :null => false
    t.integer  "client_id",                      :null => false
    t.string   "habitat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sex",         :default => false
  end

  create_table "breeds", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description", :null => false
    t.integer  "specie_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "name",                         :null => false
    t.string   "lastName",                     :null => false
    t.integer  "idDocument",                   :null => false
    t.string   "email"
    t.integer  "phoneHome"
    t.integer  "phoneCell"
    t.integer  "phoneWork"
    t.string   "address",                      :null => false
    t.integer  "town_id"
    t.boolean  "isowner",    :default => true
    t.string   "userName"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultas", :force => true do |t|
    t.date     "date",           :null => false
    t.string   "medicalAlert",   :null => false
    t.string   "allergies"
    t.string   "vaccines"
    t.string   "medicalTests"
    t.string   "surgeries"
    t.decimal  "weight",         :null => false
    t.text     "diagnosis",      :null => false
    t.decimal  "temperature",    :null => false
    t.integer  "heartRate",      :null => false
    t.integer  "pulse",          :null => false
    t.text     "injuries"
    t.text     "treatment",      :null => false
    t.datetime "dateAdmission"
    t.datetime "dischargeDate"
    t.datetime "dateDeath"
    t.integer  "typeConsult_id", :null => false
    t.integer  "animal_id",      :null => false
    t.integer  "doctor_id",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "lastName",   :null => false
    t.integer  "idDocument", :null => false
    t.string   "email"
    t.integer  "phoneHome"
    t.integer  "phoneCell"
    t.string   "speciality", :null => false
    t.string   "address",    :null => false
    t.string   "userName"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "horaries", :force => true do |t|
    t.date     "day",        :null => false
    t.time     "startTime",  :null => false
    t.time     "finalHour",  :null => false
    t.integer  "doctor_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetings", :force => true do |t|
    t.string   "ownerName",   :null => false
    t.integer  "ownerId",     :null => false
    t.date     "meetingDate", :null => false
    t.time     "meetingHour", :null => false
    t.integer  "doctor_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "species", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "sqlite_stat1" because of following StandardError
#   Unknown type '' for column 'tbl'

  create_table "type_consults", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
