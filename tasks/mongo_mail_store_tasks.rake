 require  'fileutils'
 
 namespace :mongo_mail_store do
   desc "copy config file"
   task :config => :environment do
       src = "#{Rails.root}/vendor/plugins/mongo_mail_store/files/mongo_mail_store.yml.erb"
       dest = "#{Rails.root}/config/mongo_mail_store.yml"
       copy_entry(src, dest, preserve = false, dereference = false)
       puts "CONFIG FILE COPIED!"
    end
   
 end
 
 