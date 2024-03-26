class Patient < ApplicationRecord
    validates :first_name, presence: true, length: { minimum: 2 }
    validates :last_name, presence: true, length: { minimum: 2 }
    validates :email, presence: true, length: { minimum: 5 }
    validates :phone, presence: true, length: { minimum: 10, maximum: 15 }
end
