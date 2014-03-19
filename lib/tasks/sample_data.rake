namespace :db do
  desc "Fill database with Hardcoded Users"
  task populate: :environment do
        

  User.create!(email: 'employer@test.ca', username: 'employer', 
    password: 'testtest', password_confirmation: 'testtest', 
    fname: 'employer', lname: 'employer', employer: true)
  User.create!(email: 'employee@test.ca', username: 'employee', 
    password: 'testtest', password_confirmation: 'testtest', 
    fname: 'employee', lname: 'employee')
  User.create!(email: 'employee1@test.ca', username: 'employee1', 
    password: 'testtest', password_confirmation: 'testtest', 
    fname: 'employee1', lname: 'employee')
  Skilllabel.create!(label: "Java")
  Skilllabel.create!(label: "Ruby")
  Skilllabel.create!(label: "Educational development")
  Skilllabel.create!(label: "Typing")
  Skill.create!(label: "Java", user_id: 2)
  Skill.create!(label: "Ruby", user_id: 2)
  Skill.create!(label: "Educational development", user_id: 2)
  Skill.create!(label: "Typing", user_id: 2)
  Posting.create!(title: "Working with ruby", description: "Come wokr for us and make Ruby things!", user_id: 2)
  Posting.create!(title: "Working with Java", description: "Come wokr for us and make Java things!", user_id: 2)
  Posting.create!(title: "Working with Typing and Educational Development", 
  	description: "Come wokr for us and make typing and education things!", user_id: 2)
  Skill.create!(label: "Java", user_id: 1, posting_id: 1, mandatory: true)
  Skill.create!(label: "Ruby", user_id: 1, posting_id: 2, mandatory: false)
  Skill.create!(label: "Educational development", user_id: 1, posting_id: 3, mandatory: true)
  Skill.create!(label: "Typing", user_id: 1, posting_id: 3, mandatory: true)
  Friendship.create!(friendship_id: 1, sender_id: 2, receiver_id: 1, sent_at: "2014-02-21 02:31:24", accepted: true)
  end
end
