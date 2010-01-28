require 'erb'
mongo_mail_config = Dir.getwd + "/config/mongo_mail_store.yml"
mongo_mail_config_template = Dir.getwd + "/vendor/plugins/mongo_mail_store/files/mongo_mail_store.yml.erb"
unless File.exist?(mongo_mail_config)
  pwd = Dir.getwd
  template = File.read(mongo_mail_config_template)
  result = ERB.new(template).result(binding)
  mongo_mail_config_file = File.open(mongo_mail_config, 'w+')
  mongo_mail_config_file.puts result
  mongo_mail_config_file.close
  puts "=> Copied mongo_mail configuration file."
else
  puts "=> mongo_mail configuration file already exists."
end