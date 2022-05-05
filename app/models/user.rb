class User < ApplicationRecord
  # Include default devise modules.
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  include DeviseTokenAuth::Concerns::User
  has_many :orders
  enum role: { member: 0, editor: 1, moderator: 2, admin: 3, }
end
