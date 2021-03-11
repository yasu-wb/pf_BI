class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:number_id]

  VALID_NAME = /\A[ぁ-んァ-ン一-龥々]/.freeze

  with_options presence: true do
    validates :number_id, uniqueness: true
    validates :last_name, format: { with: VALID_NAME, message: 'is invalid. Input full-width characters.' }
    validates :first_name, format: { with: VALID_NAME, message: 'is invalid. Input full-width characters.' }
    validates :in_charge1, :in_charge2, :in_charge3, numericality: { other_than: 0, message: 'Select' }
  end

  validates :number_id, numericality: { only_integer: true, message: 'Half-width number' }

  VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
