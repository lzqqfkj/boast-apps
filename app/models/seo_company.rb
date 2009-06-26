class SeoCompany < ActiveRecord::Base
	has_many :seo_keywords,:foreign_key =>:company_id
	has_many :products
	has_many :employees
  has_many :regist_infos

  validates_uniqueness_of :name, :message => "该公司已存在！"
  validates_presence_of   :name,:message => "公司名称不能为空！"

end