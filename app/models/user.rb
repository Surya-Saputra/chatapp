class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
  # validates :username, uniqueness: true, presence: true
=======
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
>>>>>>> bug_fix
end
