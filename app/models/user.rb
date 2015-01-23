class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy, inverse_of: :user
  has_many :comment, inverse_of: :user
  belongs_to :role, inverse_of: :users

  ##### ALL VALIDATION
    ##### Unique email and populated.

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  before_create :set_default_role

  def is_admin?
    persisted? and role and (role.name == Role::ADMIN) 
  end

  def self.from_omniauth(auth)
    where('(provider = ? and uid = ?) or lower(email) = ?' , auth.provider, auth.uid, auth.info.email.downcase).last || new
    #where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #  user.email ||= auth.info.email
    #  user.password ||= Devise.friendly_token[0,20]
    #end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  private
  def set_default_role
    self.role ||= Role.find_by_name(Role::REGISTERED)
  end
end
