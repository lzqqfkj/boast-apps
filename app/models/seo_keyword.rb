class SeoKeyword < ActiveRecord::Base
  belongs_to :company
  belongs_to :seo_companies,:foreign_key =>:company_id
  has_many :seo_results
  
  validates_presence_of :keyword, :on => :create,:message => "关键字不能为空！"
  #validates_uniqueness_of   :keyword
end
