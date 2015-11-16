class BongsaLink < ActiveRecord::Base
  belongs_to :bongsa, :dependent => :destroy
end
