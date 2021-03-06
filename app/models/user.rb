class User < ActiveRecord::Base

  
  has_many :reviews, dependent: :destroy


  # paginates_per 2

  has_secure_password

  validates :email,
    presence: true

  validates :firstname,
    presence: true

  validates :lastname,
    presence: true

  validates :password,
    length: { in: 1..20 }, on: :create

  def full_name
    "#{firstname} #{lastname}"
  end

end
