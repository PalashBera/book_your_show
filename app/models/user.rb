class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :confirmable, :trackable, :lockable

  strip_attributes only: %i[first_name last_name email], collapse_spaces: true

  validates :first_name, :last_name, :email, presence: true, length: { maximum: 100 }
  validates :admin, inclusion: { in: [true, false] }

  def full_name
    "#{first_name} #{last_name}"
  end

  def initial
    "#{first_name[0].upcase}#{last_name[0].upcase}"
  end
end
