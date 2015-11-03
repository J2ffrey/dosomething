class Region2 < ActiveRecord::Base
    belongs_to :region, :dependent => :destroy
end
