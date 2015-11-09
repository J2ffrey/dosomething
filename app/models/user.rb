class User < ActiveRecord::Base
  mount_uploader :picture, UserimgUploader
  has_many :buckets
  has_many :real_bongsas
end
