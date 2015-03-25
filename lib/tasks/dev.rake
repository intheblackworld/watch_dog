namespace :dev do

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", :setup ]

  desc "Setup system data"
  task :setup => :environment do
      puts "Create system user"
      u = User.new( :password => "12345678", :email => "intheblackworld@gmal.com")
      u.is_admin = true
      u.save!

      a = Company.new( :name => '銓笙監視器')
      a.save!
  end
end