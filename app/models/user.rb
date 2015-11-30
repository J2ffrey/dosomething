class User < ActiveRecord::Base
  mount_uploader :picture, UserimgUploader
  has_many :buckets
  has_many :real_bongsas
  has_many :histories
  has_many :careers
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider 
      user.uid      = auth.uid
      user.f_name     = auth.info.name
      user.save
    end
  end
  # 여기까지
end
