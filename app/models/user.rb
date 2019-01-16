class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save{email.downcase!}

  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :news
  has_many :score_bets, dependent: :destroy

  validates :name,  presence: true,
    length: {maximum: Settings.users.name_length}
  validates :email, presence: true,
    length: {maximum: Settings.users.email_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

  def reduce_money price
    new_money = money.to_f - price.to_f
    update_attributes money: new_money
  end

  def extra_money extra
    new_money = money.to_f + extra.to_f
    update_attributes money: new_money
  end

  def refund_money price
    new_money = money.to_f + price.to_f
    update_attributes money: new_money
  end
end
