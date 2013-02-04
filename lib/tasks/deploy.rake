#Deploy and rollback on Heroku in staging and production
task :deploy_staging => ['deploy:set_staging_app', 'deploy:push', 'deploy:restart']
task :deploy_production => ['deploy:set_production_app', 'deploy:push', 'deploy:restart']

namespace :deploy do
  PRODUCTION_APP = 'tailored-republic'
  STAGING_APP = 'tailored-republic-staging'

  task :staging_migrations => [:set_staging_app, :push, :off, :migrate, :restart, :on]
  task :production_migrations => [:set_production_app, :push, :off, :migrate, :restart, :on]

  task :set_staging_app do
    APP = STAGING_APP
  end

  task :set_production_app do
    APP = PRODUCTION_APP
  end

  task :push do
    puts 'Deploying site to Heroku ...'
    puts `git push -f git@heroku.com:#{APP}.git`
  end

  task :restart do
    puts 'Restarting app servers ...'
    puts `heroku restart --app #{APP}`
  end

  task :migrate do
    puts 'Running database migrations ...'
    puts `heroku rake db:migrate --app #{APP}`
  end

  task :off do
    puts 'Putting the app into maintenance mode ...'
    puts `heroku maintenance:on --app #{APP}`
  end

  task :on do
    puts 'Taking the app out of maintenance mode ...'
    puts `heroku maintenance:off --app #{APP}`
  end
end