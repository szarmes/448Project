


namespace :db do
  desc "Fill database with Hardcoded Users"
  task populate: :environment do
        

  User.create!(email: 'employer@test.ca', username: 'employer', 
    password: 'testtest', password_confirmation: 'testtest', 
    fname: 'employer', lname: 'employer', employer: true)
  User.create!(email: 'employee@test.ca', username: 'employee', 
    password: 'testtest', password_confirmation: 'testtest', 
    fname: 'employee', lname: 'employee')
  end
end
