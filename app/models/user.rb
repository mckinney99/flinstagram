class User < ActiveRecord::Base
    has_secure_password
    has_many :photos
  
    def slug
      self.username.gsub(" ","-").downcase
    end
  
    def self.find_by_slug(slug)
      self.all.find{|x| x.slug == slug}
    end
  
  end