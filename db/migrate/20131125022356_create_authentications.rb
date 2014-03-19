class CreateAuthentications < ActiveRecord::Migration
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

  create_table :chatviews do |t|
    t.integer  :id1,         default: 0, null: false
    t.integer  :id2,            default: 0, null: false
    t.integer  :viewer,         default: 0, null: false
    t.datetime :last_viewed_at,             null: false
  end

  create_table :experiences do |t|
    t.string   :title,            default: "", null: false
    t.string   :description,             default: "", null: false
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

  create_table :fields do |t|
    t.integer :field_id,    null: false
    t.text    :description
  end

  create_table :friendships do |t|
    t.integer  :friendship_id, default: 0,     null: false
    t.integer  :sender_id,                     null: false
    t.integer  :receiver_id,                   null: false
    t.datetime :sent_at,                       null: false
    t.boolean  :accepted,      default: false, null: false
    t.datetime :accepted_at
  end

  create_table :keywords do |t|
    t.string  :keyword,       default: "", null: false
    t.integer :posting_id,                 null: false
    t.integer :skill_id,                   null: false
    t.integer :experience_id,              null: false
  end

  create_table :messages do |t|
    t.integer  :sender_id,   default: 0,  null: false
    t.integer  :receiver_id, default: 0,  null: false
    t.datetime :sent_at,                  null: false
    t.text     :message,     default: "", null: false
    t.string   :sender_name
  end

  create_table :links do |t|
    t.integer :project_id, null: false
    t.integer :link_id,    null: false
    t.string  :url,        null: false
  end

  create_table :postings do |t|
    t.string  :title,      default: "", null: false
    t.string  :description,       default: "", null: false
    t.integer :salary
    t.integer :user_id,                 null: false
    t.integer :posting_id,  default: 0,  null: false
  end

  create_table :projects do |t|
    t.string  :name,          null: false
    t.string  :description
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
    t.integer :reference_id, default: 0,  null: false
    t.integer :user_id,                   null: false
  end

  create_table :skilllabels do |t|
    t.integer :skilllabel_id, default: 0,  null: false
    t.string  :label,         default: "", null: false
  end

  create_table :requirements do |t|
    t.boolean :mandatory,      default: true, null: false
    t.string  :degree
    t.string  :educationLvl
    t.string  :description,           default: "",   null: false
    t.integer :exp
    t.string  :exp_area
    t.integer :posting_id,                    null: false
    t.integer :requirement_id,                null: false
  end

  create_table :skills do |t|
    t.integer :skill_id,   default: 0,  null: false
    t.string  :label,      default: "", null: false
    t.integer :user_id,    default: 0,  null: false
    t.integer :posting_id
    t.boolean :mandatory
  end

  create_table :surveys do |t|
    t.integer :user_id,   default: 0, null: false
    t.integer :survey_id, default: 0, null: false
    t.integer :question1
    t.integer :question2
    t.integer :question3
    t.integer :question4
    t.integer :question5
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
    t.datetime :last_seen_at
  end
  end
end
