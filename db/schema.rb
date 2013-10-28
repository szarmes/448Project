# encoding: UTF-8

ActiveRecord::Schema.define(version: 20131008164900) do

  create_table "users", force: true do |t|
    t.string   "username",               default: "",    null: false
    t.string   "fname",                  default: "",    null: false
    t.string   "lname",                  default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "phone_number"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "gender"
    t.datetime "birthday"
    t.boolean  "employee",               default: true
    t.string   "goals",                  default: "",    null: false

    t.boolean  "employer",               default: false, null: false
    t.string   "company_name",           default: ""
    t.string   "company_address",        default: ""
    t.string   "field",                  default: ""
 
    t.boolean  "admin",                  default: false, null: false
    
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "skills", force: true do |t|
    t.string   "label",                 default: "",      null: false
    t.string   "desc",                  default: "" 
  end

   create_table "experiences", force: true do |t|
    t.string   "title",                default: "",      null: false
    t.string   "desc",                 default: "",      null: false
    t.datetime "sdate",                null: false               
    t.datetime "fdate",                null: false
    t.string   "company_name",          default: "",      null: false
    t.string   "company_address"
    t.string   "company_city"
    t.string   "company_province"
    t.string   "company_country"
    t.string   "supervisor"
    t.string   "supervisor_phone"
   end

   create_table "references", force: true do |t|
    t.string   "fname",               default: "",      null: false  
    t.string   "lname",               default: "",      null: false 
    t.string   "phone_number"
    t.string   "relationship",        default: "",      null: false      
    t.integer   "yrsknown"
    t.string   "email"   
   end

   create_table "requirements", force: true do |t|
    t.boolean  "mandatory?",          default: true,    null: false 
    t.string   "degree"
    t.string   "educationLvl"
    t.string   "desc",                default: "",      null: false
    t.integer  "exp"
    t.string   "exp_area"
   end

   create_table "postings", force: true do |t|
    t.string   "title",               default: "",      null: false
    t.string   "desc",                default: "",      null: false
    t.integer  "salary"
   end

   create_table "keywords", force: true do |t|
    t.string   "keyword",               default: "",      null: false
   end
end
