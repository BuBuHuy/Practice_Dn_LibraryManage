class User < ApplicationRecord
  after_create :create_cart
  devise :database_authenticatable, :registerable,
         :rememberable
  validates_uniqueness_of :email, case_sensitive: false
  has_many :carts, dependent: :destroy
  has_many :books, through: :cart
end
