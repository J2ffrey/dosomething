class User < ActiveRecord::Base
  mount_uploader :picture, UserimgUploader
  has_many :buckets
end
