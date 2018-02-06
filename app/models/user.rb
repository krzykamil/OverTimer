class User < ActiveRecord::Base
  has_many :audit_logs
  has_many :posts
  PHONE_REGEX = /\A[0-9]*\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name, :phone
  validates_format_of :phone, with: PHONE_REGEX
  validates :phone, length: { is: 10 }


  def full_name
    last_name.upcase + ", " + first_name.upcase
  end
end