class User < ApplicationRecord

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :phone, presence: true, length: { minimum: 10, maximum: 15 }
  validates :position, presence: true, length: { minimum: 3 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  
  def admin?
    self.is_admin
  end
end
