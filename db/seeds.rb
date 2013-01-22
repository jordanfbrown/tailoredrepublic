puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' },
  { :name => 'user' }
], :without_protection => true)

puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name
user.add_role :admin
