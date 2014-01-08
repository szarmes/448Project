class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      	t.integer  "user_id",     default: 0,  null: false
    	t.integer  "survey_id",     default: 0,  null: false
   		t.integer  "question1"
    	t.integer  "question2" 
    	t.integer  "question3"
    	t.integer  "question4"
    	t.integer  "question5"
    end
  end
end