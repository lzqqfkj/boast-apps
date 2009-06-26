class RegistInfo < ActiveRecord::Base
 	  belongs_to :company
 	  belongs_to :b2bsite   
 	  has_many :post_infos                
end