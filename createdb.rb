require 'active_record'
 
     ActiveRecord::Base.logger = Logger.new(STDERR)
     ActiveRecord::Base.colorize_logging = false
     
     ActiveRecord::Base.establish_connection(
         :adapter => 'mysql',
         :host => 'localhost',
         :port => 53306,
         :encoding => 'utf8',
         :username => 'root',
         :password => 'password',
         :database => 'boast'            #rordb lzqdb
    )
    
#    ActiveRecord::Schema.define do
##        create_table :t_companies do |table|
##            table.column :name, :string
##        end
##    
#        create_table :seo_keywords do |table|
#            table.column :company_id, :integer
#            table.column :keys, :string
#       end
#       
#       create_table :seo_results do |table|
#            table.column :seo_keyword_id, :integer
#            table.column :t_search_id, :integer
#            table.column :time, :Date
#            table.column :total, :integer
#            table.column :page_num, :integer
#            table.column :rank, :integer
#            table.column :path, :string
#       end
#       
#       create_table :t_searches do |table|
#             table.column :stype, :string
#            table.column :domain_name, :string
#            table.column :sid, :string
#            table.column :charset, :string
#            table.column :max_page, :integer
#       end
#    end
##    
#    class Company < ActiveRecord::Base
#       set_table_name 'companies' 
#       has_many :seo_keywords
#    end
#    
#    class SeoKeyword < ActiveRecord::Base
##        set_table_name 'seo_keywords' 
#        belongs_to :company
#        has_many :seo_results
#    end
#    
#    class TSearch < ActiveRecord::Base
##       set_table_name 't_searches'
#       has_many :seo_results
#    end
#    
#    class SeoResult < ActiveRecord::Base
##        set_table_name 'seo_results'
#        belongs_to :seo_keyword
#        belongs_to :t_search
#    end
    class Sdata < ActiveRecord::Base
        set_table_name 'sdatas'
    end
    
    se = Sdata .create([
       {:stype => 0,:sname => '公司类型',:sid =>1},
       {:stype => 0,:sname => '经营模式',:sid =>2},
       {:stype => 0,:sname => '员工人数',:sid =>3},
       {:stype => 1,:sname => '企业单位',:sid =>1100},
       {:stype => 1,:sname => '个体经营',:sid =>1101},
       {:stype => 1,:sname => '事业单位或社会团体',:sid => 1102},
       {:stype => 1,:sname => '未经工商注册，个人',:sid => 1103},
       {:stype => 2,:sname => '生产型',:sid =>2100},
       {:stype => 2,:sname => '贸易型',:sid =>2101},
       {:stype => 2,:sname => '服务型',:sid => 2102},
       {:stype => 2,:sname => '政府或其他机构',:sid => 2103},
       {:stype => 3,:sname => '1～10人',:sid =>2100},
       {:stype => 3,:sname => '10～50人',:sid =>2101},
       {:stype => 3,:sname => '50～100人',:sid => 2102},
       {:stype => 3,:sname => '100人以上',:sid => 2103}
       ])
#    com = TCompany.create(:name => '永嘉县黄田康达金属制品厂')
#    com.seo_keywords.create(:keys => '纽扣')
#    com.seo_keywords.create(:keys => '装饰扣')
#    com.seo_keywords.create(:keys => '金属制品')
#           
#    com = TCompany.create(:name => '扬州鑫丰自动化设备有限公司')        
#    com.seo_keywords.create(:keys => '电子设备')
#    com.seo_keywords.create(:keys => '振动盘')
#    com.seo_keywords.create(:keys => '机械设备')
#    
#    com = TCompany.create(:name => '宝应为民深井水泵厂')
#    com.seo_keywords.create(:keys => '深井水泵')
#    com.seo_keywords.create(:keys => '离心泵')
#    com.seo_keywords.create(:keys => '变频器')
#           
#    com = TCompany.create(:name => '含山县洪泰油脂')        
#    com.seo_keywords.create(:keys => '麻油')
#    com.seo_keywords.create(:keys => '芝麻油')
#    com.seo_keywords.create(:keys => '香油')
#    
#    com = TCompany.create(:name => '宝应振明电热电器厂')
#    com.seo_keywords.create(:keys => '加热器')
#    com.seo_keywords.create(:keys => '电热器')
#    com.seo_keywords.create(:keys => '干燥器')
#           
#    com = TCompany.create(:name => '长江实业苏州分舵')        
#    com.seo_keywords.create(:keys => '电脑')
#    com.seo_keywords.create(:keys => '轮船')
#    com.seo_keywords.create(:keys => '钢材')
#    
#    com = TCompany.create(:name => '高盛财团')        
#    com.seo_keywords.create(:keys => '软件')
#    com.seo_keywords.create(:keys => '硬件')
#    com.seo_keywords.create(:keys => '组装电脑')
#    
#    com = TCompany.create(:name => '建湖县康达玻璃仪器有限公司')
#    com.seo_keywords.create(:keys => '玻璃管')
#    com.seo_keywords.create(:keys => '旋转蒸发器配套仪器')
#    com.seo_keywords.create(:keys => '实验标准口仪器')
#           
#    com = TCompany.create(:name => '南京秀门服饰有限公司')        
#    com.seo_keywords.create(:keys => '秀门服饰')
#    com.seo_keywords.create(:keys => '服饰')
#    com.seo_keywords.create(:keys => '西装')
#    
#    com = TCompany.create(:name => '六安金蜘蛛网络科技有限公司')
#    com.seo_keywords.create(:keys => '六安网络公司')
#    com.seo_keywords.create(:keys => '六安网站制作')
#    com.seo_keywords.create(:keys => '网站建设')
#           
#    com = TCompany.create(:name => '江都市国兴材料试验机械厂')        
#    com.seo_keywords.create(:keys => '拉力机')
#    com.seo_keywords.create(:keys => '拉力实验机')
#    com.seo_keywords.create(:keys => '硫化仪')
    
    
#    se = TSearch.create([
#       {:stype => '谷歌',:domain_name => 'google.com',:sid => 'Google',:charset => 'utf8',:max_page => 5},
#       {:stype => '百度',:domain_name => 'baidu.com',:sid => 'Baidu',:charset => 'gb2312',:max_page => 5},
#       {:stype => '搜搜',:domain_name => 'soso.com',:sid => 'Soso',:charset => 'gb2312',:max_page => 10},
#       {:stype => '搜狗',:domain_name => 'sogou.com',:sid => 'Sogou',:charset => 'gb2312',:max_page => 5},
#       {:stype => '有道',:domain_name => 'youdao.com',:sid => 'Youdao',:charset => 'utf8',:max_page => 10},
#       {:stype => '雅虎',:domain_name => 'yahoo.cn',:sid => 'Yahoo',:charset => 'utf8',:max_page => 10}
#       ])
    
#    puts TCompany.find(1).seo_keywords.length
#    puts TCompany.find(2).seo_keywords.length
#    
#    puts TSearch.find_by_charset('utf8').domain_name
#    puts SeoKeyword.find_by_keys('玉器厂').t_company_id
    
#    sekey = SeoKeyword.create(:keys => 'fenxiao')
#    sekey.seo_results.create(:t_search_id => 1,:time =>'2008-09-11', :rank => '123', :path => '11')
#    exit
