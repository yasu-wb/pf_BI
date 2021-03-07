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

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(['lower(number_id) = :value OR lower(email) = :value', { value: login.downcase }]).first
    elsif conditions.has_key?(:number_id) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
