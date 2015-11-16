class BongsaTime < ActiveRecord::Base
  belongs_to :bongsa, :dependent => :destroy
end
