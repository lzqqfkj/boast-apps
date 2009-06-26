{
  :'zh' => {
    :date => {
      :formats => {
        :default      => "%Y-%m-%d",
        :short        => "%b %e日",
        :long         => "%Y年 %B %e日",
        :long_ordinal => lambda { |date| "%B #{date.day}日, %Y年" },
        :only_day     => "%e日"
      },
      :day_names => %w(星期天 星期一 星期二 星期三 星期四 星期五 星期六),
      :abbr_day_names => %w(日 一 二 三 四 五 六),
      :month_names => [nil] + %w(1月 2月 3月 4月 5月 6月 7月 8月 9月 10月 11月 12月),
      :abbr_month_names => [nil] + %w(1月 2月 3月 4月 5月 6月 7月 8月 9月 10月 11月 12月),
      :order => [:year, :month, :day]
    },
    :time => {
      :formats => {
        :default      => "%a %b %d %H:%M:%S %Z %Y",
        :time         => "%H:%M",
        :short        => "%d %b %H:%M",
        :long         => "%B %d, %Y %H:%M",
        :long_ordinal => lambda { |time| "%B #{time.day}, %Y %H:%M" },
        :only_second  => "%S"
      },
      :am => '上午',
      :pm => '下午'
    },
    # date helper distance in words
    #NOTE: Pluralization rules have changed! Rather than simply submitting an array, i18n now allows for a hash with the keys:
    # :zero, :one & :other   - FUNKY (but a pain to find...)!
    :datetime => {
      :distance_in_words => {
        :half_a_minute       => '半分钟',
        :less_than_x_seconds => {:zero => '一秒内', :one => '1 秒', :other => '{{count}} 秒'},
        :x_seconds           => {:one => '一秒', :other => '{{count}} 秒'},
        :less_than_x_minutes => {:zero => '一分钟内', :one => '1 分钟', :other => '{{count}} 分钟'},
        :x_minutes           => {:one => "一分钟", :other => "{{count}} 分钟"},
        :about_x_hours       => {:one => '一小时內', :other => '{{count}} 小时'},
        :x_days              => {:one => '一天', :other => '{{count}} 天'},
        :about_x_months      => {:one => '一个月内', :other => '{{count}} 个月'},
        :x_months            => {:one => '一个月', :other => '{{count}} 个月'},
        :about_x_years       => {:one => '一年以上', :other => '{{count}} 年'},
        :over_x_years        => {:one => '超过一年', :other => '{{count}} 年'}
      }
    },
 
    # numbers
    :number => {
      :format => {
        :precision => 3,
        :separator => ',',
        :delimiter => '.'
      },
      :currency => {
        :format => {
          :unit => '￥',
          :precision => 2,
          :format => '%u %n'
        }
      }
    },
 
    # Active Record
    :active_record => {
      :error => {
        :header_message => ["无法保存 {{object_name}}: 1 错误", "无法保存 {{object_name}}: {{count}} 错误."],
        :message => "请检查以下字段:"
      },
      :error_messages => {
        :inclusion => "不包含于列表中",
        :exclusion => "不能用",
        :invalid => "不合法",
        :confirmation => "与确认值不匹配",
        :accepted  => "必须接受",
        :empty => "不能留空",
        :blank => "不能为空字符",
        :too_long => "过长 (不能超过 {{count}} 个字符)",
        :too_short => "过短 (不能少于 {{count}} 个字符)",
        :wrong_length => "长度非法 (必须为 {{count}} 个字符)",
        :taken => "不可用",
        :not_a_number => "不是数字",
        :greater_than => "必须大于 {{count}}",
        :greater_than_or_equal_to => "必须大于或等于 {{count}}",
        :equal_to => "必须等于 {{count}}",
        :less_than => "必须小于 {{count}}",
        :less_than_or_equal_to => "必须小于或等于 {{count}}",
        :odd => "必须为单数",
        :even => "必须为双数"
      }
    },
    :txt => {
      :main_title => "Rails本地化",
      :app_name => "样例应用",
      :sub_title => "怎样使用Rails的i18n新特性本地化你的应用",
      :contents => "内容",
      :menu => {
        :introduction => "介绍",
        :about => "关于",
        :setup => "设置",
        :date_formats => "日期格式",
        :time_formats => "时间格式"
      },
      :about => {
        :title => "关于这个样例应用",
        :author => "此样例应用由 {{mail_1}} 开发.",
        :feedback => "如果你有任何想法可以告诉我。也可以去到{{blog_href}} 和我讨论关于Rails或其他话题。",
        :licence => "本样例应用和它所有内容使用 {{licence_href}} 许可. 如果要超出许可使用本样例，请联系我并得到我的认可。"
      },
      :active_record => {
        :too_lazy => "这里没有示例，因为我懒得去凭空想一些属性去展示所有的自定义错误信息。 ;-)",
        :easy_to_understand => "但它真的简单易懂。"
      },
      :date_formats => {
        :rails_standards_work => "Rails 标准格式 (Date::DATE_FORMATS) 仍然可以用:"
      },
      :date_helper => {
        :date_time_title => "Date/Time 缩放",
        :forms_title => "表单"
      },
      :index => {
        :others => "其它",
        :introduction => "最近，{{sven_blog}} 和 {{sven_github}} 完成了许多促进Rails国际化和本地化的工作。",
        :story_so_far => "本样例应用展示怎样使用i18n特性来完成本地化Rails应用这个重大的任务。"
      },
      :number_helper => {
        :note_one => "注意: <code>number_to_phone</code> 还未本地化并可能永远不会。要留意新的国际化/本地化插件像新版本的 {{globalize}} 可能会实现如上门提到的本地化工作。",
        :note_two => "其它注意: <code>number_to_currency</code>, <code>number_to_percentage</code> 和 <code>number_to_human_size</code> 都使用内置的 <code>number_with_precision</code> ， <code>number_with_precision</code> 使用内置的 <code>number_with_delimiter</code> 。"
      },
      :setup => {
        :freezing_edge_and_adding => "冻结Rails版本并初始化 localized_dates 插件",
        :you_need_to_be_on_edge => "使用Rails的i18n特性需要Edge Rails:",
        :date_time_formats => "用于日期和时间的格式化需要安装插件 {{localized_dates_link}}:",
        :config_locale => "配置本地化",
        :best_place => "放置本地化配置的最佳位置，在我看来是在 <code>config/locales</code>。 localized_dates 插件将会拷贝两个本地化配置, zh-CN and de-AT, 到在这个目录下. 使用者可以扩展或修改它们，也可以创建新的本地化配置。",
        :locale => "这是样例应用当前使用的样例本地化配置:",
        :defaults => "需要时可以设置默认地区或地区到 <code>environment.rb</code> 或者一个启动器中(initializer)。",
        :locale_structure_title => "对本地化结构的一些想法",
        :locale_structure_number => "可能会注意到在本地化的 <code>:number</code> 中，定义了 <code>:format</code> 和 <code>:currency</code>。 一般来说，本地化是自成体系结构的，如货币是数字，百分数是数字等。 <code>:currency</code> 可以覆盖基本的 <code>:format</code> 设置 (在这里的案例中, 把 <code>:precision</code> 设为2而不是3) 或扩展 (我们添加了两个选项, <code>:unit</code> 和 <code>:format</code>).",
        :locale_structure_date_time => "以下适用于日期和时间: 如果需要, <code>:datetime</code> 和 <code>:time_with_zone</code> 可以用来指定地址格式，取代只是设置 <code>:time</code>。注意，无论如何，用统一的格式处理 <code>:time</code> 是很有用的。"   
      },
      :time_formats => {
        :rails_standards_work => "Rails 标准格式 (Time::DATE_FORMATS) 仍可用:"
      },
      :ipe => {
        :click => "点击这里!"
      }
    }
  }
}