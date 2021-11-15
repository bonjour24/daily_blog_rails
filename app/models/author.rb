class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :blogs, dependent: :destroy
  validates :firstname, presence: true
  validates :age, presence: true
  validates :email, :uniqueness => {:allow_blank => true}
end
