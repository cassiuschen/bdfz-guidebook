puts 'Start to Init Databases'
`cp config/nginx.conf /etc/nginx/conf.d/bdfz-guidebook.conf`
`RAILS_ENV=production rake db:create`
`RAILS_ENV=production rake db:migrate`
`RAILS_ENV=production rake db:seed`
`mkdir tmp/pids`
`RAILS_ENV=production rake assets:precompile`
`service nginx restart`
puts 'Now you can run ./run to run the App!'
puts 'Author : Cassius Chen'
