class PostInfo < ActiveRecord::Base
 	  belongs_to :regist_info
 	  belongs_to :product                   
end