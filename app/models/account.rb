class Account < ApplicationRecord
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
