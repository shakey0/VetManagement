class Pet < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2 }
    validates :animal, presence: true, length: { minimum: 2 }
    validates :dob, presence: true

    belongs_to :patient
end
