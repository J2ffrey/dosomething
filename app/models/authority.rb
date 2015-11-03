class Authority < ActiveRecord::Base
  belongs_to :authority_bundle, :dependent => :destroy
end
