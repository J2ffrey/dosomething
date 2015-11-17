class BongTmp < ActiveRecord::Base
 
 mount_uploader :img_main, BongsaimgUploader
 mount_uploader :img_poster, BongsaimgUploader
# has_many :bongsa_times
# has_many :bongsa_dates
# has_many :bongsa_links
end
