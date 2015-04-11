class Dpm < ActiveRecord::Base
	mount_uploader :filename, DpmFileUploader
	attr_accessible :filename
end
