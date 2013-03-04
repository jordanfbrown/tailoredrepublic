namespace :db do
  namespace :backup do
    desc 'Backup the production database '
    task :production => :environment do
      `/usr/local/heroku/bin/heroku pgbackups:capture -a tailored-republic`
      backup_directory = '/Users/jordan/TR/db-backups/prod'
      date = Time.now.strftime('%m-%d-%Y')
      url = `/usr/local/heroku/bin/heroku pgbackups:url -a tailored-republic`
      command = "curl -o #{backup_directory}/#{date}.dump #{url}"
      exec command
    end

    task :staging => :environment do
      `/usr/local/heroku/bin/heroku pgbackups:capture -a tr-staging`
      backup_directory = '/Users/jordan/TR/db-backups/staging'
      date = Time.now.strftime('%m-%d-%Y')
      url = `/usr/local/heroku/bin/heroku pgbackups:url -a tr-staging`
      command = "curl -o #{backup_directory}/#{date}.dump #{url}"
      exec command
    end
  end
end