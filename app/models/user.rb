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
    validates :in_charge1_id, :in_charge2_id, :in_charge3_id, numericality: { other_than: 0, message: '担当を選んでください' }
  end

  validates :number_id, numericality: { only_integer: true, message: 'は半角数字で入力してください' }, length: { is: 6, message: 'は6桁で入力してください'}

  VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :in_charge1
  belongs_to :in_charge2
  belongs_to :in_charge3

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def self.guest
    find_or_create_by!(number_id: '999999', last_name: 'ゲスト', first_name: 'ユーザー', in_charge1_id: '1', in_charge2_id: '2',
                       in_charge3_id: '3') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
