namespace :admin do
  # admin:create email=email@example.com
  desc 'add admin role to user with specific email'
  task create: :environment do
    email = ENV['email']
    Role.find_or_create_by_name('admin')
    if user = User.find_by_email(email)
      user.role = Role.find_by_name('admin')
      user.save
      puts 'Successfully done!'
    else
      puts  'You must enter email that you used in registration form.'
    end
  end
end
