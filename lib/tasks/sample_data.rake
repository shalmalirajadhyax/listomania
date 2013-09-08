namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    users = User.all(limit: 2)
    3.times do
      content = Faker::Lorem.sentence(2)
	
      users.each { |user| user.tasks.create!( task_name: content, task_category: "School" ) }
    end
  end
end