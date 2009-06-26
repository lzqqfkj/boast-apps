class SeoResult < ActiveRecord::Base
  belongs_to :t_search
  belongs_to :seo_keyword
  
  def self.mygsub(str)
   if str.include? "万"
      i = str.index("万")+ 4
      str = str.insert(i, ",") 
    end
    str.gsub(/[^(0-9,)]/,"")
  end
end
