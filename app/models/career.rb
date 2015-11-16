class Career < ActiveRecord::Base
    belongs_to :user, :dependent => :destroy
end
