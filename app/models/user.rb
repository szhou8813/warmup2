class User < ActiveRecord::Base
    SUCCESS = 1
    RR_BAD_CREDENTIALS = -1
    ERR_USER_EXISTS = -2
    ERR_BAD_USERNAME = -3
    ERR_BAD_PASSWORD = -4

    validates :name, length: {
        minimum: 1,
        maximum: 128,
        message: ERR_BAD_USERNAME
    }

    validates :password, length: {
        minimum: 1,
        maximum: 128,
        message: ERR_BAD_PASSWORD
    }

    validates :name, uniqueness: {
        message: ERR_USER_EXISTS
    }

end
