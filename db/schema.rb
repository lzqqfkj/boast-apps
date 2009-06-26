# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090113031720) do

  create_table "b2bsites", :force => true do |t|
    t.string   "name",        :limit => 50
    t.string   "wsort",       :limit => 50
    t.string   "site"
    t.string   "file_name",   :limit => 50
    t.string   "module_name", :limit => 50
    t.string   "label_name",  :limit => 50
    t.integer  "product_max"
    t.integer  "message_max"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string "cname", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name",         :limit => 155
    t.date     "found"
    t.string   "website"
    t.integer  "regcapital"
    t.integer  "investpro"
    t.integer  "regcapitl"
    t.integer  "saleroom"
    t.string   "legalperson"
    t.integer  "employee"
    t.string   "saleorbuy"
    t.string   "scale"
    t.string   "pattern"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ctype"
    t.integer  "province_id"
    t.integer  "district_id"
    t.integer  "zip"
    t.string   "address"
    t.string   "logo"
    t.string   "banner"
    t.integer  "agent_id"
    t.text     "introduction"
    t.integer  "city_id"
  end

  add_index "companies", ["name"], :name => "index_name_on_companies", :unique => true

  create_table "companies_industries", :id => false, :force => true do |t|
    t.integer  "company_id"
    t.integer  "industry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies_industries", ["company_id", "industry_id"], :name => "index_companies_industries_on_company_id_and_industry_id", :unique => true
  add_index "companies_industries", ["industry_id"], :name => "index_companies_industries_on_industry_id"

  create_table "employees", :force => true do |t|
    t.string   "name",                      :limit => 128
    t.integer  "company_id",                               :null => false
    t.string   "nick_name",                 :limit => 128
    t.integer  "sex"
    t.string   "dept",                      :limit => 128
    t.string   "deptposition",              :limit => 128
    t.string   "email",                     :limit => 128
    t.string   "tel1",                      :limit => 128
    t.string   "tel2",                      :limit => 128
    t.string   "tel3",                      :limit => 128
    t.string   "fax1",                      :limit => 128
    t.string   "fax2",                      :limit => 128
    t.string   "fax3",                      :limit => 128
    t.string   "mobile",                    :limit => 128
    t.integer  "role_id"
    t.string   "login"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["company_id"], :name => "company_id"

  create_table "industries", :force => true do |t|
    t.string   "name",       :limit => 50, :null => false
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "industries", ["name"], :name => "index_industries_on_name", :unique => true

  create_table "last_seo_results", :id => false, :force => true do |t|
    t.integer "sid",  :null => false
    t.integer "tsid", :null => false
    t.integer "lid"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "post_infos", :force => true do |t|
    t.integer   "product_id"
    t.integer   "regist_info_id"
    t.integer   "post_type"
    t.timestamp "time",           :null => false
  end

  add_index "post_infos", ["product_id"], :name => "product_id"
  add_index "post_infos", ["regist_info_id"], :name => "regist_info_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.integer  "price"
    t.integer  "DeliveryLimit"
    t.integer  "TotalSupply"
    t.string   "specs"
    t.string   "MeasuringUnit"
    t.string   "picture"
    t.text     "Introduction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "minordernum"
    t.integer  "offerexpire"
    t.string   "brandname",     :limit => 128
    t.string   "model",         :limit => 128
    t.integer  "province"
    t.integer  "city"
    t.string   "pack_type",     :limit => 128
  end

  add_index "products", ["company_id"], :name => "company_id"

  create_table "regist_infos", :force => true do |t|
    t.integer   "company_id"
    t.string    "user_name",      :limit => 128
    t.string    "pass",           :limit => 128
    t.string    "question"
    t.string    "answer"
    t.integer   "regist_state"
    t.integer   "posted_product"
    t.integer   "posted_info"
    t.string    "shop_site"
    t.timestamp "time",                          :null => false
    t.integer   "b2bsite_id"
  end

  add_index "regist_infos", ["b2bsite_id"], :name => "website_id"
  add_index "regist_infos", ["company_id"], :name => "company_id"

  create_table "sdatas", :force => true do |t|
    t.integer  "stype"
    t.integer  "sid"
    t.string   "sname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seo_keywords", :force => true do |t|
    t.string    "keyword",    :limit => 128, :null => false
    t.integer   "company_id",                :null => false
    t.timestamp "created_at",                :null => false
    t.timestamp "updated_at",                :null => false
  end

  add_index "seo_keywords", ["company_id"], :name => "company_id"

  create_table "seo_results", :force => true do |t|
    t.integer   "seo_keyword_id", :null => false
    t.integer   "t_search_id",    :null => false
    t.integer   "total"
    t.integer   "page_num"
    t.integer   "rank"
    t.string    "path"
    t.timestamp "updated_at",     :null => false
    t.timestamp "created_at",     :null => false
    t.date      "time"
  end

  add_index "seo_results", ["seo_keyword_id", "t_search_id"], :name => "seo_keyword_id"
  add_index "seo_results", ["t_search_id"], :name => "t_search_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "t_searches", :force => true do |t|
    t.string    "chinese_name", :limit => 20
    t.string    "domain_name",  :limit => 20
    t.string    "class_name",   :limit => 10
    t.string    "charset",      :limit => 10
    t.integer   "max_page"
    t.timestamp "created_at",                 :null => false
    t.timestamp "updated_at",                 :null => false
  end

  create_table "unigram", :force => true do |t|
    t.string  "entry",                    :null => false
    t.integer "frequency", :default => 1
  end

  add_index "unigram", ["entry"], :name => "unigram_entry_idx", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email",                     :limit => 128
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.integer  "company_id",                               :null => false
    t.string   "nickname",                  :limit => 128
    t.integer  "role_id"
  end

  create_table "users2", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.integer  "company_id"
    t.string   "nickname",                  :limit => 40
    t.integer  "role_id"
  end

end
