class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:number_id]

  validates_uniqueness_of :number_id

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(number_id) = :value OR lower(email) = :value", { :value => login.downcase }]).first
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
