class Bongsa < ActiveRecord::Base
    
 mount_uploader :bongsa_img, BongsaimgUploader
 mount_uploader :foster_img, BongsaimgUploader
 

end
