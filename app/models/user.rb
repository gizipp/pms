class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]
  has_many :works
  has_many :tasks
  has_many :comments
  has_many :contributed_works, through: :contributor
  has_many :contributors

  validates :username, presence: true, uniqueness: true
  validates :role, inclusion: { in: %w(member admin), message: "%{value} is not a valid role" }

  mount_uploader :avatar, AvatarUploader

  after_create :send_admin_mail

  def send_admin_mail
    UserMailer.welcome_email(self).deliver_later
  end

  ROLES = %w[member admin]

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end
end
