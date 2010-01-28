 begin YAML.load_file("#{RAILS_ROOT}/config/mongo_mail_store.yml")
   MONGOMAILER = YAML.load_file("#{RAILS_ROOT}/config/mongo_mail_store.yml")[RAILS_ENV]
 rescue => e
   puts "WARNING! loading config file mongo_mail_store.yml , #{e}"
 end

# idea taken from http://blog.flvorful.com/articles/2009/12/20/deep-in-rails-actionmailer-deliver-part-vi
module ActionMailerMongoStore

    module InstanceMethods
        def deliver_with_mongo_store!(mail = @mail)
            deliver_without_mongo_store!(mail = @mail)
            logger.info "STORING MAIL IN MONGO!"
            MongoNotification.create(
            :from=>@mail.from , 
            :to=>@mail.to, :body=>@mail.body , 
            :content_type=>@mail.content_type ,
            :subject=> @mail.subject,
            :reply_to=> @mail.reply_to) if MONGOMAILER['store']
        end
    end

    def self.included(receiver)
        receiver.send :include, InstanceMethods
        receiver.class_eval do
            alias_method_chain :deliver!, :mongo_store
        end
    end
end

ActionMailer::Base.send :include, ActionMailerMongoStore

