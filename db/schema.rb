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

ActiveRecord::Schema.define(:version => 20140608172450) do

  create_table "accommodations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", :force => true do |t|
    t.string   "name"
    t.string   "post_code"
    t.string   "address_line"
    t.integer  "addressable_id",                                  :null => false
    t.string   "addressable_type", :limit => 20,                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "lat",                            :default => 0.0
    t.float    "lng",                            :default => 0.0
    t.integer  "region_id"
    t.integer  "district_id"
    t.integer  "city_id"
    t.integer  "town_id"
    t.integer  "street_id"
  end

  add_index "addresses", ["address_line"], :name => "index_addresses_on_address_line"
  add_index "addresses", ["addressable_id", "addressable_type"], :name => "index_addresses_on_addressable_id_and_addressable_type"

  create_table "card_categories", :force => true do |t|
    t.integer  "card_id",     :null => false
    t.integer  "category_id", :null => false
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "card_child_characters", :force => true do |t|
    t.integer  "card_id",            :null => false
    t.integer  "child_character_id", :null => false
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "card_child_helps", :force => true do |t|
    t.integer  "child_help_id",   :null => false
    t.date     "help_date"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "card_id"
  end

  create_table "card_companies", :force => true do |t|
    t.integer  "card_id",     :null => false
    t.integer  "company_id",  :null => false
    t.string   "period"
    t.date     "period_from"
    t.date     "period_to"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "card_doctors", :force => true do |t|
    t.integer  "card_id",      :null => false
    t.integer  "doctor_id",    :null => false
    t.date     "registration"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "card_family_helps", :force => true do |t|
    t.integer  "family_help_id",  :null => false
    t.date     "help_date"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "card_id"
  end

  create_table "card_locations", :force => true do |t|
    t.integer  "card_id",         :null => false
    t.integer  "location_id",     :null => false
    t.date     "entrance_date"
    t.date     "retirement_date"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "card_privacy_document_types", :force => true do |t|
    t.integer  "card_id",                  :null => false
    t.integer  "privacy_document_type_id"
    t.string   "name"
    t.string   "reg_num"
    t.date     "registered_at"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "card_registration_causes", :force => true do |t|
    t.integer  "card_id",               :null => false
    t.integer  "registration_cause_id", :null => false
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards", :force => true do |t|
    t.integer  "person_id",               :null => false
    t.string   "reg_num"
    t.date     "registered_at"
    t.date     "unregistered_at"
    t.boolean  "repeat"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "registration_reason_id"
    t.integer  "unregistration_cause_id"
    t.string   "registration_address"
    t.integer  "accommodation_id"
    t.text     "address_comment"
    t.integer  "employment_type_id"
    t.text     "status_comment"
    t.integer  "family_id"
    t.integer  "family_type_id"
    t.integer  "family_structure_id"
    t.text     "special_signs"
    t.integer  "health_status"
    t.text     "help_comment"
    t.date     "convicted_at"
    t.date     "released_at"
    t.integer  "release_cause"
    t.text     "issued_by"
    t.date     "issued_at"
    t.string   "pension_cert_num"
    t.integer  "passport_serie"
    t.string   "passport_num"
    t.integer  "company_id"
    t.boolean  "is_archived"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cc_articles", :force => true do |t|
    t.string   "number",     :null => false
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "child_characters", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "child_helps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name",                     :null => false
    t.integer  "region_id",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "district_id"
    t.integer  "code",        :limit => 8
  end

  create_table "city_districts", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name",                            :null => false
    t.string   "full_name",       :limit => 500
    t.string   "phone1"
    t.string   "phone2"
    t.string   "comment",         :limit => 2000
    t.integer  "company_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["full_name"], :name => "index_companies_on_full_name", :length => {"full_name"=>"255"}
  add_index "companies", ["name"], :name => "index_companies_on_name"

  create_table "company_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "convictions", :force => true do |t|
    t.date     "convicted_at"
    t.integer  "term"
    t.date     "released_at"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "card_id"
    t.integer  "release_cause"
    t.integer  "cc_article_id"
  end

  create_table "departments", :force => true do |t|
    t.string   "name",                       :null => false
    t.string   "full_name",  :limit => 500
    t.string   "phone1"
    t.string   "phone2"
    t.string   "comment",    :limit => 2000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["full_name"], :name => "index_departments_on_full_name", :length => {"full_name"=>"255"}
  add_index "departments", ["name"], :name => "index_departments_on_name"

  create_table "districts", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "region_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code",       :null => false
  end

  create_table "doctors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "document_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "electoral_districts", :force => true do |t|
    t.integer  "number",     :null => false
    t.string   "name"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "level"
  end

  create_table "employment_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eventlogs", :force => true do |t|
    t.integer  "event_type",                 :null => false
    t.integer  "user_id"
    t.string   "data",       :limit => 1000
    t.datetime "created_at"
  end

  create_table "families", :force => true do |t|
    t.string   "last_name",           :null => false
    t.string   "address",             :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "family_structure_id"
  end

  create_table "family_family_types", :force => true do |t|
    t.integer  "family_id",      :null => false
    t.integer  "family_type_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_helps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_structures", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_works", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", :force => true do |t|
    t.integer  "person_id",  :null => false
    t.integer  "friend_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "health_statuses", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "houses", :force => true do |t|
    t.text    "description",           :null => false
    t.integer "storeys"
    t.integer "porch_num"
    t.integer "apartments_num"
    t.string  "house_problems"
    t.integer "number"
    t.integer "electoral_district_id"
    t.integer "street_id"
    t.integer "district_id"
  end

  create_table "inspectors", :force => true do |t|
    t.integer  "person_id",  :null => false
    t.integer  "teen_id",    :null => false
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.integer  "region_committee_id",                      :null => false
    t.text     "mission"
    t.date     "entry_date"
    t.string   "membershipcard_number",                    :null => false
    t.string   "phone"
    t.string   "post"
    t.string   "party_post"
    t.boolean  "is_distributor",        :default => false
    t.text     "note"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                               :null => false
    t.string   "last_name",                                :null => false
    t.string   "middle_name"
    t.string   "honors"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name",                        :null => false
    t.string   "last_name",                         :null => false
    t.string   "middle_name"
    t.date     "birthday"
    t.string   "birthplace"
    t.string   "mobile"
    t.string   "phone"
    t.text     "comment"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gender",             :default => 0, :null => false
    t.integer  "house_id"
    t.integer  "apartment_num"
    t.integer  "birthyear"
  end

  add_index "people", ["last_name", "first_name", "middle_name"], :name => "index_people_on_last_name_and_first_name_and_middle_name"

  create_table "privacy_document_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professions", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "region_committees", :force => true do |t|
    t.string   "first_secretary",  :null => false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_district_id"
    t.integer  "district_id"
  end

  create_table "regions", :id => false, :force => true do |t|
    t.integer  "id",         :null => false
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code",       :null => false
  end

  create_table "registration_causes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registration_reasons", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gender",     :default => 0
  end

  create_table "relatives", :force => true do |t|
    t.integer  "person_id",                         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "relationship_id"
    t.integer  "card_id"
    t.boolean  "cohabitation",    :default => true
    t.string   "address"
    t.text     "comment"
    t.date     "birthday"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", :force => true do |t|
    t.integer  "company_id", :null => false
    t.integer  "teen_id",    :null => false
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "streets", :force => true do |t|
    t.string   "name",                               :null => false
    t.integer  "region_id",                          :null => false
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code",                  :limit => 8
    t.integer  "city_id",               :limit => 8
    t.integer  "town_id",               :limit => 8
    t.integer  "electoral_district_id"
  end

  create_table "subscribers", :force => true do |t|
    t.date     "subscription_date",                     :null => false
    t.date     "unsubscription_date"
    t.boolean  "is_subscribed",       :default => true, :null => false
    t.string   "subscription_reason"
    t.integer  "shipping_type"
    t.integer  "total_subscribers"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
    t.integer  "member_id"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name", :limit => 500
  end

  create_table "teachers", :force => true do |t|
    t.integer  "person_id",  :null => false
    t.integer  "teen_id",    :null => false
    t.integer  "school_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tics", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "chief"
    t.string   "phone"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "towns", :force => true do |t|
    t.string   "name",                     :null => false
    t.integer  "region_id",                :null => false
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code",        :limit => 8
  end

  create_table "uics", :force => true do |t|
    t.integer  "number",          :null => false
    t.integer  "tic_id",          :null => false
    t.string   "chairman"
    t.integer  "electors_number"
    t.string   "phone"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unregistration_causes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                            :null => false
    t.string   "email"
    t.string   "crypted_password",                 :null => false
    t.string   "password_salt",                    :null => false
    t.string   "persistence_token",                :null => false
    t.integer  "login_count",       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
