class Dpm < ActiveRecord::Base
	mount_uploader :filename, DpmFileUploader
	attr_accessible :filename, :graph_number, :youngs_modulus, :id, :gauge_length, :necking_point, :fitting_param, :threshold
end
