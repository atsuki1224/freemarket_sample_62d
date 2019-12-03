class Product < ApplicationRecord

  has_many :images,dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy:true

  # has_many :commnets
  # has_many :messages
  # has_many :nices

  
  has_one :trade
  belongs_to :user,optional:true
  belongs_to :category,optional:true
  belongs_to :bland,optional:true
  validates :item_name,presence:true
  validates :description,presence:true
  validates :item_condition,presence:true
  validates :trade_status,presence:true
  validates :category_id,presence:true
  validates :delivery_charge,presence:true
  validates :delivery_method,presence:true
  validates :delivery_area,presence:true
  validates :delivery_time,presence:true
  validates :price,presence:true
  validates :user_id,presence:true
  

#######enum用です#######################
  enum size:{'XXS以下':0,'XS(SS)':1,'S':2,'M':3,'L':4,'XL(LL)':5,'2XL(3L)':6,'3XL(4L)':7,'4XL(5L)以上':8,'FREESIZE':9}
  enum delivery_time:{'1~2日で発送':0,'2~3日で発送':1,'4~7日で発送':2}
  enum delivery_method:{'未定':0,'らくらくメルカリ便':1,'ゆうメール':2,'レターパック':3,'普通郵便(定型、定形外)':4,'クロネコヤマト':5,'ゆうパック':6,'クリックポスト':7,'ゆうパケット':8}
  enum delivery_charge:{'送料込み':0,'着払い':1}
  enum delivery_area:{'北海道':0,'青森県':1,'岩手県':2,'宮城県':3,'秋田県':4,'山形県':5,'福島県':6,'茨城県':7,'栃木県':8,'群馬県':9,'埼玉県':10,'千葉県':11,'東京都':12,'神奈川県':13,'新潟県':14,'富山県':15,'石川県':16,'福井県':17,'山梨県':18,'長野県':19,'岐阜県':20,'静岡県':21,'愛知県':22,'三重県':23,'滋賀県':24,'京都府':25,'大阪府':26,'兵庫県':27,'奈良県':28,'和歌山県':29,'鳥取県':30,'島根県':31,'岡山県':32,'広島県':33,'山口県':34,'徳島県':35,'香川県':36,'愛媛県':37,'高知県':38,'福岡県':39,'佐賀県':40,'長崎県':41,'熊本県':42,'大分県':43,'宮崎県':44,'鹿児島県':45,'沖縄県':46}
  enum item_condition:{ '新品、未使用に近い':0,'未使用に近い':1,'目立った傷や汚れなし':2,'やや汚れや傷あり':3,'傷や汚れあり':4,'全体的に状態が悪い':5 }
###########################################
end
