class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :tickets

  validates :name, presence: true

  def full_name
    surname.blank? ? name : "#{name} #{surname}"
  end
end
