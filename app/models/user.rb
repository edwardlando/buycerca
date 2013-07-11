class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  :provider, :uid, :name, :image, :location, :first_name, :large_image, :story, :username,
  :facebook_email
  # attr_accessible :title, :body

  has_many :items

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create( name:auth.extra.raw_info.name,
                          first_name:auth.info.first_name,
                          username:auth.extra.raw_info.username,
                          facebook_email:auth.extra.raw_info.username+"@facebook.com",
                          provider:auth.provider,
                          uid:auth.uid,
                          email:auth.info.email,
                          image:auth.info.image,
                          large_image:"http://graph.facebook.com/"+auth.uid+"/picture?type=large",
                          location:auth.info.location,
                          password:Devise.friendly_token[0,20]
                        )
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
end
