class Testfile < ActiveRecord::Base
	belongs_to :material
	belongs_to :user
	#validates :material, presence: true
	#validates :material, :presence => true
	mount_uploader :filename, TestFileUploader
	attr_accessible  :filename, :file_type, :file_contents, :confidence_rank, :material_id, :mat_name, :comments, :user_id
end
