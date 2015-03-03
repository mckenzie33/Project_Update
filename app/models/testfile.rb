class Testfile < ActiveRecord::Base
	belongs_to :material
	#validates :material, presence: true
	validates :material, :presence => true
	mount_uploader :filename, TestFileUploader
attr_accessible  :filename, :file_type, :file_contents, :confidence_rank, :material_id
end
