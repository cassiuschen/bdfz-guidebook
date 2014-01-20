puts 'Start to Init Databases'
`vi config/database.yml`
`sudo cp config/nginx.conf /etc/nginx/conf.d/bdfz-guidebook.conf`
`RAILS_ENV=production bundle exec rake db:create`
`RAILS_ENV=production bundle exec rake db:migrate`
`RAILS_ENV=production bundle exec rake db:seed`
`sudo service nginx restart`
puts 'Now you can run ./run to run the App!'
puts 'Author : Cassius Chen'
