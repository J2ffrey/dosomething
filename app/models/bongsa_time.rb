class BongsaTime < ActiveRecord::Base
  belongs_to :bongsa, :dependent => :destroy
  # belongs_to :bong_tmp, :dependent => :destroy
end
