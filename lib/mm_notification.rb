class MongoNotification
    include MongoMapper::Document
    
    key :content_type, String, :limit=> 80    
    key :from, String, :limit => 255, :default => nil
    key :to,   String, :limit => 255, :default => nil
    key :subject, String, :default => nil
    key :reply_to, String, :default => nil
    key :body, String
    timestamps! 
    
end
