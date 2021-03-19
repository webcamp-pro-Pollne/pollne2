class Customer < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses

  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
