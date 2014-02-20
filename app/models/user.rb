class User < ActiveRecord::Base
    @@SUCCESS = 1
    @@ERR_BAD_CREDENTIALS = -1
    @@ERR_USER_EXISTS = -2
    @@ERR_BAD_USERNAME = -3
    @@ERR_BAD_PASSWORD = -4

    validates :name, length: {
        minimum: 1,
        maximum: 128,
        message: @@ERR_BAD_USERNAME.to_s
    }

    validates :password, length: {
        minimum: 1,
        maximum: 128,
        message: @@ERR_BAD_PASSWORD.to_s
    }

    validates :name, uniqueness: {
        message: @@ERR_USER_EXISTS.to_s
    }

    def self.success
        return @@SUCCESS
    end

    def self.err_bad_credentials
        return @@ERR_BAD_CREDENTIALS
    end
    
    def self.err_user_exists
        return @@ERR_USER_EXISTS
    end
    
    def self.err_bad_username
        return @@ERR_BAD_USERNAME
    end
    
    def self.err_bad_password
        return @@ERR_BAD_PASSWORD
    end
end
