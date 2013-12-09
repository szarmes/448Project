class CreateAuthentications < ActiveRecord""Migration
  def change
    
    create_table :authentications do |t|
    t.integer  :user_id
    t.string   :provider
    t.string   :uid
    t.string   :index
    t.string   :create
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :experiences do |t|
    t.string   :title,            default: "", null: false
    t.string   :desc,             default: "", null: false
    t.datetime :sdate,                         null: false
    t.datetime :fdate
    t.string   :company_name,     default: "", null: false
    t.string   :company_address
    t.string   :company_city
    t.string   :company_province
    t.string   :company_country
    t.string   :supervisor
    t.string   :supervisor_phone
    t.integer  :user_id,                       null: false
    t.integer  :experience_id,                 null: false
  end

  create_table :keywords do |t|
    t.string  :keyword,       default: "", null: false
    t.integer :posting_id,                 null: false
    t.integer :skill_id,                   null: false
    t.integer :experience_id,              null: false
  end

  create_table :links do |t|
    t.integer :project_id, null: false
    t.integer :link_id,    null: false
    t.string  :url,        null: false
  end

  create_table :postings do |t|
    t.string  :title,      default: "", null: false
    t.string  :desc,       default: "", null: false
    t.integer :salary
    t.integer :user_id,                 null: false
    t.integer :posting_id,              null: false
  end

  create_table :projects do |t|
    t.string  :name,          null: false
    t.string  :desc
    t.integer :project_id,    null: false
    t.integer :experience_id, null: false
  end

  create_table :references do |t|
    t.string  :fname,        default: "", null: false
    t.string  :lname,        default: "", null: false
    t.string  :phone_number
    t.string  :relationship, default: "", null: false
    t.integer :yrsknown
    t.string  :email
    t.integer :user_id,                   null: false
  end

  create_table :requirements do |t|
    t.boolean :mandatory,      default: true, null: false
    t.string  :degree
    t.string  :educationLvl
    t.string  :desc,           default: "",   null: false
    t.integer :exp
    t.string  :exp_area
    t.integer :posting_id,                    null: false
    t.integer :requirement_id,                null: false
  end

  create_table :skills do |t|
    t.string  :label,    default: "", null: false
    t.string  :desc,     default: ""
    t.integer :user_id,  default: 0,  null: false
    t.integer :skill_id, default: 0,  null: false
  end

  create_table :users do |t|
    t.integer  :user_id,                default: 0,     null: false
    t.string   :username,               default: "",    null: false
    t.string   :fname,                  default: "",    null: false
    t.string   :lname,                  default: "",    null: false
    t.string   :email,                  default: "",    null: false
    t.datetime :created_at
    t.datetime :updated_at
    t.string   :password_digest
    t.string   :remember_token
    t.string   :encrypted_password,     default: "",    null: false
    t.string   :reset_password_token
    t.datetime :reset_password_sent_at
    t.datetime :remember_created_at
    t.integer  :sign_in_count,          default: 0,     null: false
    t.datetime :current_sign_in_at
    t.datetime :last_sign_in_at
    t.string   :current_sign_in_ip
    t.string   :last_sign_in_ip
    t.string   :phone_number
    t.string   :city
    t.string   :province
    t.string   :country
    t.string   :gender
    t.datetime :birthday
    t.boolean  :employee,               default: true
    t.string   :goals,                  default: "",    null: false
    t.boolean  :employer,               default: false, null: false
    t.string   :company_name,           default: ""
    t.string   :company_address,        default: ""
    t.string   :field,                  default: ""
    t.boolean  :admin,                  default: false, null: false
    t.string   :uid
    t.string   :provider
  end





  end
end
