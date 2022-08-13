class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :basic_info

  delegate :first_name, :last_name, :birthdate, to: :basic_info, allow_nil: true

  def full_name
    if first_name.present? && last_name.present?
      "#{first_name} #{last_name}"
    else
      'Stranger'
    end
  end

  def age
    (Date.today.year - birthdate.year)
  end

  def address?
    false
  end
end
