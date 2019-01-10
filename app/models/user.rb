class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy

  def name
    "#{first_name} " + "#{last_name}"
  end
end
