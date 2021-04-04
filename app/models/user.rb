class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:number_id]

  VALID_NAME = /\A[ぁ-んァ-ン一-龥々]/.freeze

  with_options presence: true do
    validates :number_id, uniqueness: true
    validates :last_name, format: { with: VALID_NAME, message: 'は全角で入力してください' }
    validates :first_name, format: { with: VALID_NAME, message: 'は全角で入力してください' }
    validates :in_charge1, :in_charge2, :in_charge3, numericality: { other_than: 0, message: '担当を選んでください' }
  end

  validates :number_id, numericality: { only_integer: true, message: 'は半角数字で入力してください' }

  VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
