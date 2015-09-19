class Bongsa < ActiveRecord::Base
    
 mount_uploader :img_main, BongsaimgUploader
 mount_uploader :img_poster, BongsaimgUploader
 

end
