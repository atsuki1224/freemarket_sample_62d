# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 30.times do
#   Product.create(
#      item_name: Faker::Book.unique.title,  
#      description: Faker::Number.between(from: 1, to: 3),
#      item_condition:Faker::Number.between(from: 1, to: 3),
#      trade_status: Faker::Number.between(from: 1, to: 3),
#      size: Faker::Number.between(from: 1, to: 3),
#      bland_id:Faker::Number.between(from: 1, to: 10),
#      category_id:Faker::Number.between(from: 1, to: 100),
#      delivery_charge: Faker::Number.between(from: 1, to: 3),
#      delivery_methot: Faker::Number.between(from: 1, to: 3),
#      delivery_area: Faker::Number.between(from: 1, to: 3),
#      delivery_time: Faker::Number.between(from: 1, to: 3),
#      price: Faker::Number.between(from: 100, to: 100000),
#      user_id: Faker::Number.between(from: 1, to: 3),
#    )
# end
##### プロダクトテーブル用フェイカーです#############

# 30.times do
#   Product.create(
#     item_name: Faker::Book.unique.title,
#     description: Faker::Number.between(from: 1, to: 3),
#     item_condition:Faker::Number.between(from: 1, to: 3),
#     trade_status: Faker::Number.between(from: 1, to: 3),
#     size: Faker::Number.between(from: 1, to: 3),
#     bland_id:Faker::Number.between(from: 1, to: 10),
#     category_id:Faker::Number.between(from: 1, to: 100),
#     delivery_charge: Faker::Number.between(from: 1, to: 3),
#     delivery_methot: Faker::Number.between(from: 1, to: 3),
#     delivery_area: Faker::Number.between(from: 1, to: 3),
#     delivery_time: Faker::Number.between(from: 1, to: 3),
#     price: Faker::Number.between(from: 100, to: 100000),
#     user_id: Faker::Number.between(from: 1, to: 3),
#   )
# end

# 10.times do
#   Image.create(
#      image: Faker::Avatar.unique.image,
#      product_id: 1
#    )
# end
#     image: Faker::Avatar.unique.image,
#     product_id: Faker::Number.unique.between(from: 1, to: 30),
#   )
# end

####カテゴリーテーブル用です###########
parent_array = ['レディース','メンズ','ベビー・キッズ','インテリア・住まい・小物','本・音楽・ゲーム','おもちゃ・ホビー・グッズ','コスメ・香水・美容','家電・スマホ・カメラ','スポーツ・レジャー','ハンドメイド','チケット','自動車・オートバイ','その他']
parent_array.each do |parent|
Category.create(name: parent)
end

child_array = [["トップス", 1], ["ジャケット/アウター", 1], ["パンツ", 1], ["スカート", 1], ["ワンピース", 1], ["靴", 1], ["ルームウェア/パジャマ", 1], ["レッグウェア", 1], ["帽子", 1], ["バッグ", 1], ["アクセサリー", 1], ["ヘアアクセサリー", 1], ["小物", 1], ["時計", 1], ["ウィッグ/エクステ", 1], ["浴衣/水着", 1], ["スーツ/フォーマル/ドレス", 1], ["マタニティ", 1], ["その他", 1], ["トップス", 2], ["ジャケット/アウター", 2], ["パンツ", 2], ["靴", 2], ["バッグ", 2], ["スーツ", 2], ["帽子", 2], ["アクセサリー", 2], ["小物", 2], ["時計", 2], ["水着", 2], ["レッグウェア", 2], ["アンダーウェア", 2], ["その他", 2], ["ベビー服(女の子用) ~95cm", 3], ["ベビー服(男の子用) ~95cm", 3], ["ベビー服(男女兼用) ~95cm", 3], ["キッズ服(女の子用) 100cm~", 3], ["キッズ服(男の子用) 100cm~", 3], ["キッズ服(男女兼用) 100cm~", 3], ["キッズ靴", 3], ["子ども用ファッション小物", 3], ["おむつ/トイレ/バス", 3], ["外出/移動用品", 3], ["授乳/食事", 3], ["ベビー家具/寝具/室内用品", 3], ["おもちゃ", 3], ["行事/記念品", 3], ["その他", 3], ["キッチン/食器", 4], ["ベッド/マットレス", 4], ["ソファ/ソファベッド", 4], ["椅子/チェア", 4], ["机/テーブル", 4], ["収納家具", 4], ["ラグ/カーペット/マット", 4], ["カーテン/ブラインド", 4], ["ライト/照明", 4], ["寝具", 4], ["インテリア小物", 4], ["季節/年中行事", 4], ["その他", 4], ["本", 5], ["漫画", 5], ["雑誌", 5], ["CD", 5], ["DVD/ブルーレイ", 5], ["レコード", 5], ["テレビゲーム", 5], ["おもちゃ", 6], ["タレントグッズ", 6], ["コミック/アニメグッズ", 6], ["トレーディングカード", 6], ["フィギュア", 6], ["楽器/器材", 6], ["コレクション", 6], ["ミリタリー", 6], ["美術品", 6], ["アート用品", 6], ["その他", 6], ["ベースメイク", 7], ["メイクアップ", 7], ["ネイルケア", 7], ["香水", 7], ["スキンケア/基礎化粧品", 7], ["ヘアケア", 7], ["ボディケア", 7], ["オーラルケア", 7], ["リラクゼーション", 7], ["ダイエット", 7], ["その他", 7], ["スマートフォン/携帯電話", 8], ["スマホアクセサリー", 8], ["PC/タブレット", 8], ["カメラ", 8], ["テレビ/映像機器", 8], ["オーディオ機器", 8], ["美容/健康", 8], ["冷暖房/空調", 8], ["生活家電", 8], ["その他", 8], ["ゴルフ", 9], ["フィッシング", 9], ["自転車", 9], ["トレーニング/エクササイズ", 9], ["野球", 9], ["サッカー/フットサル", 9], ["テニス", 9], ["スノーボード", 9], ["スキー", 9], ["その他スポーツ", 9], ["アウトドア", 9], ["その他", 9], ["アクセサリー(女性用)", 10], ["ファッション/小物", 10], ["アクセサリー/時計", 10], ["日用品/インテリア", 10], ["趣味/おもちゃ", 10], ["キッズ/ベビー", 10], ["素材/材料", 10], ["二次創作物", 10], ["その他", 10], ["音楽", 11], ["スポーツ", 11], ["演劇/芸能", 11], ["イベント", 11], ["映画", 11], ["施設利用券", 11], ["優待券/割引券", 11], ["その他", 11], ["自動車本体", 12], ["自動車タイヤ/ホイール", 12], ["自動車パーツ", 12], ["自動車アクセサリー", 12], ["オートバイ車体", 12], ["オートバイパーツ", 12], ["オートバイアクセサリー", 12], ["まとめ売り", 13], ["ペット用品", 13], ["食品", 13], ["飲料/酒", 13], ["日用品/生活雑貨/旅行", 13], ["アンティーク/コレクション", 13], ["文房具/事務用品", 13], ["事務/店舗用品", 13], ["その他", 13]]
child_array.each do |child|
Category.create(name: child[0],parent_id: child[1])
end

grandchild_array =  [["Tシャツ/カットソー(半袖/袖なし)", 14], ["Tシャツ/カットソー(七分/長袖)", 14], ["シャツ/ブラウス(半袖/袖なし)", 14], ["シャツ/ブラウス(七分/長袖)", 14], ["ポロシャツ", 14], ["キャミソール", 14], ["タンクトップ", 14], ["ホルターネック", 14], ["ニット/セーター", 14], ["チュニック", 14], ["カーディガン/ボレロ", 14], ["アンサンブル", 14], ["ベスト/ジレ", 14], ["パーカー", 14], ["トレーナー/スウェット", 14], ["ベアトップ/チューブトップ", 14], ["ジャージ", 14], ["その他", 14], ["テーラードジャケット", 15], ["ノーカラージャケット", 15], ["Gジャン/デニムジャケット", 15], ["レザージャケット", 15], ["ダウンジャケット", 15], ["ライダースジャケット", 15], ["ミリタリージャケット", 15], ["ダウンベスト", 15], ["ジャンパー/ブルゾン", 15], ["ポンチョ", 15], ["ロングコート", 15], ["トレンチコート", 15], ["ダッフルコート", 15], ["ピーコート", 15], ["チェスターコート", 15], ["モッズコート", 15], ["スタジャン", 15], ["毛皮/ファーコート", 15], ["スプリングコート", 15], ["スカジャン", 15], ["その他", 15], ["デニム/ジーンズ", 16], ["ショートパンツ", 16], ["カジュアルパンツ", 16], ["ハーフパンツ", 16], ["チノパン", 16], ["ワークパンツ/カーゴパンツ", 16], ["クロップドパンツ", 16], ["サロペット/オーバーオール", 16], ["オールインワン", 16], ["サルエルパンツ", 16], ["ガウチョパンツ", 16], ["その他", 16], ["ミニスカート", 17], ["ひざ丈スカート", 17], ["ロングスカート", 17], ["キュロット", 17], ["その他", 17], ["ミニワンピース", 18], ["ひざ丈ワンピース", 18], ["ロングワンピース", 18], ["その他", 18], ["ハイヒール/パンプス", 19], ["ブーツ", 19], ["サンダル", 19], ["スニーカー", 19], ["ミュール", 19], ["モカシン", 19], ["ローファー/革靴", 19], ["フラットシューズ/バレエシューズ", 19], ["長靴/レインシューズ", 19], ["その他", 19], ["パジャマ", 20], ["ルームウェア", 20], ["その他", 20], ["ソックス", 21], ["スパッツ/レギンス", 21], ["ストッキング/タイツ", 21], ["レッグウォーマー", 21], ["その他", 21], ["ニットキャップ/ビーニー", 22], ["ハット", 22], ["ハンチング/ベレー帽", 22], ["キャップ", 22], ["キャスケット", 22], ["麦わら帽子", 22], ["その他", 22], ["ハンドバッグ", 23], ["トートバッグ", 23], ["エコバッグ", 23], ["リュック/バックパック", 23], ["ボストンバッグ", 23], ["スポーツバッグ", 23], ["ショルダーバッグ", 23], ["クラッチバッグ", 23], ["ポーチ/バニティ", 23], ["ボディバッグ/ウェストバッグ", 23], ["マザーズバッグ", 23], ["メッセンジャーバッグ", 23], ["ビジネスバッグ", 23], ["旅行用バッグ/キャリーバッグ", 23], ["ショップ袋", 23], ["和装用バッグ", 23], ["かごバッグ", 23], ["その他", 23], ["ネックレス", 24], ["ブレスレット", 24], ["バングル/リストバンド", 24], ["リング", 24], ["ピアス(片耳用)", 24], ["ピアス(両耳用)", 24], ["イヤリング", 24], ["アンクレット", 24], ["ブローチ/コサージュ", 24], ["チャーム", 24], ["その他", 24], ["ヘアゴム/シュシュ", 25], ["ヘアバンド/カチューシャ", 25], ["ヘアピン", 25], ["その他", 25], ["長財布", 26], ["折り財布", 26], ["コインケース/小銭入れ", 26], ["名刺入れ/定期入れ", 26], ["キーケース", 26], ["キーホルダー", 26], ["手袋/アームカバー", 26], ["ハンカチ", 26], ["ベルト", 26], ["マフラー/ショール", 26], ["ストール/スヌード", 26], ["バンダナ/スカーフ", 26], ["ネックウォーマー", 26], ["サスペンダー", 26], ["サングラス/メガネ", 26], ["モバイルケース/カバー", 26], ["手帳", 26], ["イヤマフラー", 26], ["傘", 26], ["レインコート/ポンチョ", 26], ["ミラー", 26], ["タバコグッズ", 26], ["その他", 26], ["腕時計(アナログ)", 27], ["腕時計(デジタル)", 27], ["ラバーベルト", 27], ["レザーベルト", 27], ["金属ベルト", 27], ["その他", 27], ["前髪ウィッグ", 28], ["ロングストレート", 28], ["ロングカール", 28], ["ショートストレート", 28], ["ショートカール", 28], ["その他", 28], ["浴衣", 29], ["着物", 29], ["振袖", 29], ["長襦袢/半襦袢", 29], ["水着セパレート", 29], ["水着ワンピース", 29], ["水着スポーツ用", 29], ["その他", 29], ["スカートスーツ上下", 30], ["パンツスーツ上下", 30], ["ドレス", 30], ["パーティーバッグ", 30], ["シューズ", 30], ["ウェディング", 30], ["その他", 30], ["トップス", 31], ["アウター", 31], ["インナー", 31], ["ワンピース", 31], ["パンツ/スパッツ", 31], ["スカート", 31], ["パジャマ", 31], ["授乳服", 31], ["その他", 31], ["コスプレ", 32], ["下着", 32], ["その他", 32], ["Tシャツ/カットソー(半袖/袖なし)", 33], ["Tシャツ/カットソー(七分/長袖)", 33], ["シャツ", 33], ["ポロシャツ", 33], ["タンクトップ", 33], ["ニット/セーター", 33], ["パーカー", 33], ["カーディガン", 33], ["スウェット", 33], ["ジャージ", 33], ["ベスト", 33], ["その他", 33], ["テーラードジャケット", 34], ["ノーカラージャケット", 34], ["Gジャン/デニムジャケット", 34], ["レザージャケット", 34], ["ダウンジャケット", 34], ["ライダースジャケット", 34], ["ミリタリージャケット", 34], ["ナイロンジャケット", 34], ["フライトジャケット", 34], ["ダッフルコート", 34], ["ピーコート", 34], ["ステンカラーコート", 34], ["トレンチコート", 34], ["モッズコート", 34], ["チェスターコート", 34], ["スタジャン", 34], ["スカジャン", 34], ["ブルゾン", 34], ["マウンテンパーカー", 34], ["ダウンベスト", 34], ["ポンチョ", 34], ["カバーオール", 34], ["その他", 34], ["デニム/ジーンズ", 35], ["ワークパンツ/カーゴパンツ", 35], ["スラックス", 35], ["チノパン", 35], ["ショートパンツ", 35], ["ペインターパンツ", 35], ["サルエルパンツ", 35], ["オーバーオール", 35], ["その他", 35], ["スニーカー", 36], ["サンダル", 36], ["ブーツ", 36], ["モカシン", 36], ["ドレス/ビジネス", 36], ["長靴/レインシューズ", 36], ["デッキシューズ", 36], ["その他", 36], ["ショルダーバッグ", 37], ["トートバッグ", 37], ["ボストンバッグ", 37], ["リュック/バックパック", 37], ["ウエストポーチ", 37], ["ボディーバッグ", 37], ["ドラムバッグ", 37], ["ビジネスバッグ", 37], ["トラベルバッグ", 37], ["メッセンジャーバッグ", 37], ["エコバッグ", 37], ["その他", 37], ["スーツジャケット", 38], ["スーツベスト", 38], ["スラックス", 38], ["セットアップ", 38], ["その他", 38], ["キャップ", 39], ["ハット", 39], ["ニットキャップ/ビーニー", 39], ["ハンチング/ベレー帽", 39], ["キャスケット", 39], ["サンバイザー", 39], ["その他", 39], ["ネックレス", 40], ["ブレスレット", 40], ["バングル/リストバンド", 40], ["リング", 40], ["ピアス(片耳用)", 40], ["ピアス(両耳用)", 40], ["アンクレット", 40], ["その他", 40], ["長財布", 41], ["折り財布", 41], ["マネークリップ", 41], ["コインケース/小銭入れ", 41], ["名刺入れ/定期入れ", 41], ["キーケース", 41], ["キーホルダー", 41], ["ネクタイ", 41], ["手袋", 41], ["ハンカチ", 41], ["ベルト", 41], ["マフラー", 41], ["ストール", 41], ["バンダナ", 41], ["ネックウォーマー", 41], ["サスペンダー", 41], ["ウォレットチェーン", 41], ["サングラス/メガネ", 41], ["モバイルケース/カバー", 41], ["手帳", 41], ["ストラップ", 41], ["ネクタイピン", 41], ["カフリンクス", 41], ["イヤマフラー", 41], ["傘", 41], ["レインコート", 41], ["ミラー", 41], ["タバコグッズ", 41], ["その他", 41], ["腕時計(アナログ)", 42], ["腕時計(デジタル)", 42], ["ラバーベルト", 42], ["レザーベルト", 42], ["金属ベルト", 42], ["その他", 42], ["一般水着", 43], ["スポーツ用", 43], ["アクセサリー", 43], ["その他", 43], ["ソックス", 44], ["レギンス/スパッツ", 44], ["レッグウォーマー", 44], ["その他", 44], ["トランクス", 45], ["ボクサーパンツ", 45], ["その他", 45], ["その他", 46], ["トップス", 47], ["アウター", 47], ["パンツ", 47], ["スカート", 47], ["ワンピース", 47], ["ベビードレス", 47], ["おくるみ", 47], ["下着/肌着", 47], ["パジャマ", 47], ["ロンパース", 47], ["その他", 47], ["トップス", 48], ["アウター", 48], ["パンツ", 48], ["おくるみ", 48], ["下着/肌着", 48], ["パジャマ", 48], ["ロンパース", 48], ["その他", 48], ["トップス", 49], ["アウター", 49], ["パンツ", 49], ["おくるみ", 49], ["下着/肌着", 49], ["パジャマ", 49], ["ロンパース", 49], ["その他", 49], ["コート", 50], ["ジャケット/上着", 50], ["トップス(Tシャツ/カットソー)", 50], ["トップス(トレーナー)", 50], ["トップス(チュニック)", 50], ["トップス(タンクトップ)", 50], ["スカート", 50], ["パンツ", 50], ["ワンピース", 50], ["セットアップ", 50], ["パジャマ", 50], ["フォーマル/ドレス", 50], ["和服", 50], ["浴衣", 50], ["甚平", 50], ["水着", 50], ["その他", 50], ["コート", 51], ["ジャケット/上着", 51], ["トップス(Tシャツ/カットソー)", 51], ["トップス(トレーナー)", 51], ["パンツ", 51], ["セットアップ", 51], ["パジャマ", 51], ["フォーマル/ドレス", 51], ["和服", 51], ["浴衣", 51], ["甚平", 51], ["水着", 51], ["その他", 51], ["コート", 52], ["ジャケット/上着", 52], ["トップス(Tシャツ/カットソー)", 52], ["トップス(トレーナー)", 52], ["ボトムス", 52], ["パジャマ", 52], ["その他", 52], ["スニーカー", 53], ["サンダル", 53], ["ブーツ", 53], ["長靴", 53], ["その他", 53], ["靴下/スパッツ", 54], ["帽子", 54], ["エプロン", 54], ["サスペンダー", 54], ["タイツ", 54], ["ハンカチ", 54], ["バンダナ", 54], ["ベルト", 54], ["マフラー", 54], ["傘", 54], ["手袋", 54], ["スタイ", 54], ["バッグ", 54], ["その他", 54], ["おむつ用品", 55], ["おまる/補助便座", 55], ["トレーニングパンツ", 55], ["ベビーバス", 55], ["お風呂用品", 55], ["その他", 55], ["ベビーカー", 56], ["抱っこひも/スリング", 56], ["チャイルドシート", 56], ["その他", 56], ["ミルク", 57], ["ベビーフード", 57], ["ベビー用食器", 57], ["その他", 57], ["ベッド", 58], ["布団/毛布", 58], ["イス", 58], ["たんす", 58], ["その他", 58], ["おふろのおもちゃ", 59], ["がらがら", 59], ["オルゴール", 59], ["ベビージム", 59], ["手押し車/カタカタ", 59], ["知育玩具", 59], ["その他", 59], ["お宮参り用品", 60], ["お食い初め用品", 60], ["アルバム", 60], ["手形/足形", 60], ["その他", 60], ["母子手帳用品", 61], ["その他", 61], ["食器", 62], ["調理器具", 62], ["収納/キッチン雑貨", 62], ["弁当用品", 62], ["カトラリー(スプーン等)", 62], ["テーブル用品", 62], ["容器", 62], ["エプロン", 62], ["アルコールグッズ", 62], ["浄水機", 62], ["その他", 62], ["セミシングルベッド", 63], ["シングルベッド", 63], ["セミダブルベッド", 63], ["ダブルベッド", 63], ["ワイドダブルベッド", 63], ["クイーンベッド", 63], ["キングベッド", 63], ["脚付きマットレスベッド", 63], ["マットレス", 63], ["すのこベッド", 63], ["ロフトベッド/システムベッド", 63], ["簡易ベッド/折りたたみベッド", 63], ["収納付き", 63], ["その他", 63], ["ソファセット", 64], ["シングルソファ", 64], ["ラブソファ", 64], ["トリプルソファ", 64], ["オットマン", 64], ["コーナーソファ", 64], ["ビーズソファ/クッションソファ", 64], ["ローソファ/フロアソファ", 64], ["ソファベッド", 64], ["応接セット", 64], ["ソファカバー", 64], ["リクライニングソファ", 64], ["その他", 64], ["一般", 65], ["スツール", 65], ["ダイニングチェア", 65], ["ハイバックチェア", 65], ["ロッキングチェア", 65], ["座椅子", 65], ["折り畳みイス", 65], ["デスクチェア", 65], ["その他", 65], ["こたつ", 66], ["カウンターテーブル", 66], ["サイドテーブル", 66], ["センターテーブル", 66], ["ダイニングテーブル", 66], ["座卓/ちゃぶ台", 66], ["アウトドア用", 66], ["パソコン用", 66], ["事務机/学習机", 66], ["その他", 66], ["リビング収納", 67], ["キッチン収納", 67], ["玄関/屋外収納", 67], ["バス/トイレ収納", 67], ["本収納", 67], ["本/CD/DVD収納", 67], ["洋服タンス/押入れ収納", 67], ["電話台/ファックス台", 67], ["ドレッサー/鏡台", 67], ["棚/ラック", 67], ["ケース/ボックス", 67], ["その他", 67], ["ラグ", 68], ["カーペット", 68], ["ホットカーペット", 68], ["玄関/キッチンマット", 68], ["トイレ/バスマット", 68], ["その他", 68], ["カーテン", 69], ["ブラインド", 69], ["ロールスクリーン", 69], ["のれん", 69], ["その他", 69], ["蛍光灯/電球", 70], ["天井照明", 70], ["フロアスタンド", 70], ["その他", 70], ["布団/毛布", 71], ["枕", 71], ["シーツ/カバー", 71], ["その他", 71], ["ごみ箱", 72], ["ウェルカムボード", 72], ["オルゴール", 72], ["クッション", 72], ["クッションカバー", 72], ["スリッパラック", 72], ["ティッシュボックス", 72], ["バスケット/かご", 72], ["フォトフレーム", 72], ["マガジンラック", 72], ["モビール", 72], ["花瓶", 72], ["灰皿", 72], ["傘立て", 72], ["小物入れ", 72], ["置時計", 72], ["掛時計/柱時計", 72], ["鏡(立て掛け式)", 72], ["鏡(壁掛け式)", 72], ["置物", 72], ["風鈴", 72], ["植物/観葉植物", 72], ["その他", 72], ["正月", 73], ["成人式", 73], ["バレンタインデー", 73], ["ひな祭り", 73], ["子どもの日", 73], ["母の日", 73], ["父の日", 73], ["サマーギフト/お中元", 73], ["夏/夏休み", 73], ["ハロウィン", 73], ["敬老の日", 73], ["七五三", 73], ["お歳暮", 73], ["クリスマス", 73], ["冬一般", 73], ["その他", 73], ["その他", 74], ["文学/小説", 75], ["人文/社会", 75], ["ノンフィクション/教養", 75], ["地図/旅行ガイド", 75], ["ビジネス/経済", 75], ["健康/医学", 75], ["コンピュータ/IT", 75], ["趣味/スポーツ/実用", 75], ["住まい/暮らし/子育て", 75], ["アート/エンタメ", 75], ["洋書", 75], ["絵本", 75], ["参考書", 75], ["その他", 75], ["全巻セット", 76], ["少年漫画", 76], ["少女漫画", 76], ["青年漫画", 76], ["女性漫画", 76], ["同人誌", 76], ["その他", 76], ["アート/エンタメ/ホビー", 77], ["ファッション", 77], ["ニュース/総合", 77], ["趣味/スポーツ", 77], ["その他", 77], ["邦楽", 78], ["洋楽", 78], ["アニメ", 78], ["クラシック", 78], ["K-POP/アジア", 78], ["キッズ/ファミリー", 78], ["その他", 78], ["外国映画", 79], ["日本映画", 79], ["アニメ", 79], ["TVドラマ", 79], ["ミュージック", 79], ["お笑い/バラエティ", 79], ["スポーツ/フィットネス", 79], ["キッズ/ファミリー", 79], ["その他", 79], ["邦楽", 80], ["洋楽", 80], ["その他", 80], ["家庭用ゲーム本体", 81], ["家庭用ゲームソフト", 81], ["携帯用ゲーム本体", 81], ["携帯用ゲームソフト", 81], ["PCゲーム", 81], ["その他", 81], ["キャラクターグッズ", 82], ["ぬいぐるみ", 82], ["小物/アクセサリー", 82], ["模型/プラモデル", 82], ["ミニカー", 82], ["トイラジコン", 82], ["プラモデル", 82], ["ホビーラジコン", 82], ["鉄道模型", 82], ["その他", 82], ["アイドル", 83], ["ミュージシャン", 83], ["タレント/お笑い芸人", 83], ["スポーツ選手", 83], ["その他", 83], ["ストラップ", 84], ["キーホルダー", 84], ["バッジ", 84], ["カード", 84], ["クリアファイル", 84], ["ポスター", 84], ["タオル", 84], ["その他", 84], ["遊戯王", 85], ["マジック：ザ・ギャザリング", 85], ["ポケモンカードゲーム", 85], ["デュエルマスターズ", 85], ["バトルスピリッツ", 85], ["プリパラ", 85], ["アイカツ", 85], ["カードファイト!! ヴァンガード", 85], ["ヴァイスシュヴァルツ", 85], ["プロ野球オーナーズリーグ", 85], ["ベースボールヒーローズ", 85], ["ドラゴンボール", 85], ["スリーブ", 85], ["その他", 85], ["コミック/アニメ", 86], ["特撮", 86], ["ゲームキャラクター", 86], ["SF/ファンタジー/ホラー", 86], ["アメコミ", 86], ["スポーツ", 86], ["ミリタリー", 86], ["その他", 86], ["エレキギター", 87], ["アコースティックギター", 87], ["ベース", 87], ["エフェクター", 87], ["アンプ", 87], ["弦楽器", 87], ["管楽器", 87], ["鍵盤楽器", 87], ["打楽器", 87], ["和楽器", 87], ["楽譜/スコア", 87], ["レコーディング/PA機器", 87], ["DJ機器", 87], ["DTM/DAW", 87], ["その他", 87], ["武具", 88], ["使用済切手/官製はがき", 88], ["旧貨幣/金貨/銀貨/記念硬貨", 88], ["印刷物", 88], ["ノベルティグッズ", 88], ["その他", 88], ["トイガン", 89], ["個人装備", 89], ["その他", 89], ["陶芸", 90], ["ガラス", 90], ["漆芸", 90], ["金属工芸", 90], ["絵画/タペストリ", 90], ["版画", 90], ["彫刻/オブジェクト", 90], ["書", 90], ["写真", 90], ["その他", 90], ["画材", 91], ["額縁", 91], ["その他", 91], ["トランプ/UNO", 92], ["カルタ/百人一首", 92], ["ダーツ", 92], ["ビリヤード", 92], ["麻雀", 92], ["パズル/ジグソーパズル", 92], ["囲碁/将棋", 92], ["オセロ/チェス", 92], ["人生ゲーム", 92], ["野球/サッカーゲーム", 92], ["スポーツ", 92], ["三輪車/乗り物", 92], ["ヨーヨー", 92], ["模型製作用品", 92], ["鉄道", 92], ["航空機", 92], ["アマチュア無線", 92], ["パチンコ/パチスロ", 92], ["その他", 92], ["ファンデーション", 93], ["化粧下地", 93], ["コントロールカラー", 93], ["BBクリーム", 93], ["CCクリーム", 93], ["コンシーラー", 93], ["フェイスパウダー", 93], ["トライアルセット/サンプル", 93], ["その他", 93], ["アイシャドウ", 94], ["口紅", 94], ["リップグロス", 94], ["リップライナー", 94], ["チーク", 94], ["フェイスカラー", 94], ["マスカラ", 94], ["アイライナー", 94], ["つけまつげ", 94], ["アイブロウペンシル", 94], ["パウダーアイブロウ", 94], ["眉マスカラ", 94], ["トライアルセット/サンプル", 94], ["メイク道具/化粧小物", 94], ["美顔用品/美顔ローラー", 94], ["その他", 94], ["ネイルカラー", 95], ["カラージェル", 95], ["ネイルベースコート/トップコート", 95], ["ネイルアート用品", 95], ["ネイルパーツ", 95], ["ネイルチップ/付け爪", 95], ["手入れ用具", 95], ["除光液", 95], ["その他", 95], ["香水(女性用)", 96], ["香水(男性用)", 96], ["ユニセックス", 96], ["ボディミスト", 96], ["その他", 96], ["化粧水/ローション", 97], ["乳液/ミルク", 97], ["美容液", 97], ["フェイスクリーム", 97], ["洗顔料", 97], ["クレンジング/メイク落とし", 97], ["パック/フェイスマスク", 97], ["ジェル/ゲル", 97], ["ブースター/導入液", 97], ["アイケア", 97], ["リップケア", 97], ["トライアルセット/サンプル", 97], ["洗顔グッズ", 97], ["その他", 97], ["シャンプー", 98], ["トリートメント", 98], ["コンディショナー", 98], ["リンス", 98], ["スタイリング剤", 98], ["カラーリング剤", 98], ["ブラシ", 98], ["その他", 98], ["オイル/クリーム", 99], ["ハンドクリーム", 99], ["ローション", 99], ["日焼け止め/サンオイル", 99], ["ボディソープ", 99], ["入浴剤", 99], ["制汗/デオドラント", 99], ["フットケア", 99], ["その他", 99], ["口臭防止/エチケット用品", 100], ["歯ブラシ", 100], ["その他", 100], ["エッセンシャルオイル", 101], ["芳香器", 101], ["お香/香炉", 101], ["キャンドル", 101], ["リラクゼーショングッズ", 101], ["その他", 101], ["ダイエット食品", 102], ["エクササイズ用品", 102], ["体重計", 102], ["体脂肪計", 102], ["その他", 102], ["健康用品", 103], ["看護/介護用品", 103], ["救急/衛生用品", 103], ["その他", 103], ["スマートフォン本体", 104], ["バッテリー/充電器", 104], ["携帯電話本体", 104], ["PHS本体", 104], ["その他", 104], ["Android用ケース", 105], ["iPhone用ケース", 105], ["カバー", 105], ["イヤホンジャック", 105], ["ストラップ", 105], ["フィルム", 105], ["自撮り棒", 105], ["その他", 105], ["タブレット", 106], ["ノートPC", 106], ["デスクトップ型PC", 106], ["ディスプレイ", 106], ["電子ブックリーダー", 106], ["PC周辺機器", 106], ["PCパーツ", 106], ["その他", 106], ["デジタルカメラ", 107], ["ビデオカメラ", 107], ["レンズ(単焦点)", 107], ["レンズ(ズーム)", 107], ["フィルムカメラ", 107], ["防犯カメラ", 107], ["その他", 107], ["テレビ", 108], ["プロジェクター", 108], ["ブルーレイレコーダー", 108], ["DVDレコーダー", 108], ["ブルーレイプレーヤー", 108], ["DVDプレーヤー", 108], ["映像用ケーブル", 108], ["その他", 108], ["ポータブルプレーヤー", 109], ["イヤフォン", 109], ["ヘッドフォン", 109], ["アンプ", 109], ["スピーカー", 109], ["ケーブル/シールド", 109], ["ラジオ", 109], ["その他", 109], ["ヘアドライヤー", 110], ["ヘアアイロン", 110], ["美容機器", 110], ["電気シェーバー", 110], ["電動歯ブラシ", 110], ["その他", 110], ["エアコン", 111], ["空気清浄器", 111], ["加湿器", 111], ["扇風機", 111], ["除湿機", 111], ["ファンヒーター", 111], ["電気ヒーター", 111], ["オイルヒーター", 111], ["ストーブ", 111], ["ホットカーペット", 111], ["こたつ", 111], ["電気毛布", 111], ["その他", 111], ["冷蔵庫", 112], ["洗濯機", 112], ["炊飯器", 112], ["電子レンジ/オーブン", 112], ["調理機器", 112], ["アイロン", 112], ["掃除機", 112], ["エスプレッソマシン", 112], ["コーヒーメーカー", 112], ["衣類乾燥機", 112], ["その他", 112], ["その他", 113], ["クラブ", 114], ["ウエア(男性用)", 114], ["ウエア(女性用)", 114], ["バッグ", 114], ["シューズ(男性用)", 114], ["シューズ(女性用)", 114], ["アクセサリー", 114], ["その他", 114], ["ロッド", 115], ["リール", 115], ["ルアー用品", 115], ["ウエア", 115], ["釣り糸/ライン", 115], ["その他", 115], ["自転車本体", 116], ["ウエア", 116], ["パーツ", 116], ["アクセサリー", 116], ["バッグ", 116], ["工具/メンテナンス", 116], ["その他", 116], ["ランニング", 117], ["ウォーキング", 117], ["ヨガ", 117], ["トレーニング用品", 117], ["その他", 117], ["ウェア", 118], ["シューズ", 118], ["グローブ", 118], ["バット", 118], ["アクセサリー", 118], ["防具", 118], ["練習機器", 118], ["記念グッズ", 118], ["応援グッズ", 118], ["その他", 118], ["ウェア", 119], ["シューズ", 119], ["ボール", 119], ["アクセサリー", 119], ["記念グッズ", 119], ["応援グッズ", 119], ["その他", 119], ["ラケット(硬式用)", 120], ["ラケット(軟式用)", 120], ["ウェア", 120], ["シューズ", 120], ["ボール", 120], ["アクセサリー", 120], ["記念グッズ", 120], ["応援グッズ", 120], ["その他", 120], ["ボード", 121], ["バインディング", 121], ["ブーツ(男性用)", 121], ["ブーツ(女性用)", 121], ["ブーツ(子ども用)", 121], ["ウエア/装備(男性用)", 121], ["ウエア/装備(女性用)", 121], ["ウエア/装備(子ども用)", 121], ["アクセサリー", 121], ["バッグ", 121], ["その他", 121], ["板", 122], ["ブーツ(男性用)", 122], ["ブーツ(女性用)", 122], ["ブーツ(子ども用)", 122], ["ビンディング", 122], ["ウエア(男性用)", 122], ["ウエア(女性用)", 122], ["ウエア(子ども用)", 122], ["ストック", 122], ["その他", 122], ["ダンス/バレエ", 123], ["サーフィン", 123], ["バスケットボール", 123], ["バドミントン", 123], ["バレーボール", 123], ["スケートボード", 123], ["陸上競技", 123], ["ラグビー", 123], ["アメリカンフットボール", 123], ["ボクシング", 123], ["ボウリング", 123], ["その他", 123], ["テント/タープ", 124], ["ライト/ランタン", 124], ["寝袋/寝具", 124], ["テーブル/チェア", 124], ["ストーブ/コンロ", 124], ["調理器具", 124], ["食器", 124], ["登山用品", 124], ["その他", 124], ["旅行用品", 125], ["その他", 125], ["ピアス", 126], ["イヤリング", 126], ["ネックレス", 126], ["ブレスレット", 126], ["リング", 126], ["チャーム", 126], ["ヘアゴム", 126], ["アンクレット", 126], ["その他", 126], ["バッグ(女性用)", 127], ["バッグ(男性用)", 127], ["財布(女性用)", 127], ["財布(男性用)", 127], ["ファッション雑貨", 127], ["その他", 127], ["アクセサリー(男性用)", 128], ["時計(女性用)", 128], ["時計(男性用)", 128], ["その他", 128], ["キッチン用品", 129], ["家具", 129], ["文房具", 129], ["アート/写真", 129], ["アロマ/キャンドル", 129], ["フラワー/ガーデン", 129], ["その他", 129], ["クラフト/布製品", 130], ["おもちゃ/人形", 130], ["その他", 130], ["ファッション雑貨", 131], ["スタイ/よだれかけ", 131], ["外出用品", 131], ["ネームタグ", 131], ["その他", 131], ["各種パーツ", 132], ["生地/糸", 132], ["型紙/パターン", 132], ["その他", 132], ["Ingress", 133], ["クリエイターズ宇宙兄弟", 133], ["シンデレラガールズCPグッズ", 133], ["その他", 133], ["その他", 134], ["男性アイドル", 135], ["女性アイドル", 135], ["韓流", 135], ["国内アーティスト", 135], ["海外アーティスト", 135], ["音楽フェス", 135], ["声優/アニメ", 135], ["その他", 135], ["サッカー", 136], ["野球", 136], ["テニス", 136], ["格闘技/プロレス", 136], ["相撲/武道", 136], ["ゴルフ", 136], ["バレーボール", 136], ["バスケットボール", 136], ["モータースポーツ", 136], ["ウィンタースポーツ", 136], ["その他", 136], ["ミュージカル", 137], ["演劇", 137], ["伝統芸能", 137], ["落語", 137], ["お笑い", 137], ["オペラ", 137], ["サーカス", 137], ["バレエ", 137], ["その他", 137], ["声優/アニメ", 138], ["キッズ/ファミリー", 138], ["トークショー/講演会", 138], ["その他", 138], ["邦画", 139], ["洋画", 139], ["その他", 139], ["遊園地/テーマパーク", 140], ["美術館/博物館", 140], ["スキー場", 140], ["ゴルフ場", 140], ["フィットネスクラブ", 140], ["プール", 140], ["ボウリング場", 140], ["水族館", 140], ["動物園", 140], ["その他", 140], ["ショッピング", 141], ["レストラン/食事券", 141], ["フード/ドリンク券", 141], ["宿泊券", 141], ["その他", 141], ["その他", 142], ["国内自動車本体", 143], ["外国自動車本体", 143], ["その他", 143], ["タイヤ/ホイールセット", 144], ["タイヤ", 144], ["ホイール", 144], ["その他", 144], ["サスペンション", 145], ["ブレーキ", 145], ["外装、エアロパーツ", 145], ["ライト", 145], ["内装品、シート", 145], ["ステアリング", 145], ["マフラー・排気系", 145], ["エンジン、過給器、冷却装置", 145], ["クラッチ、ミッション、駆動系", 145], ["電装品", 145], ["補強パーツ", 145], ["汎用パーツ", 145], ["外国自動車用パーツ", 145], ["その他", 145], ["車内アクセサリー", 146], ["カーナビ", 146], ["カーオーディオ", 146], ["車外アクセサリー", 146], ["メンテナンス用品", 146], ["チャイルドシート", 146], ["ドライブレコーダー", 146], ["レーダー探知機", 146], ["カタログ/マニュアル", 146], ["セキュリティ", 146], ["ETC", 146], ["その他", 146], ["その他", 147], ["タイヤ", 148], ["マフラー", 148], ["エンジン、冷却装置", 148], ["カウル、フェンダー、外装", 148], ["サスペンション", 148], ["ホイール", 148], ["シート", 148], ["ブレーキ", 148], ["タンク", 148], ["ライト、ウィンカー", 148], ["チェーン、スプロケット、駆動系", 148], ["メーター", 148], ["電装系", 148], ["ミラー", 148], ["外国オートバイ用パーツ", 148], ["その他", 148], ["ヘルメット/シールド", 149], ["バイクウエア/装備", 149], ["アクセサリー", 149], ["メンテナンス", 149], ["カタログ/マニュアル", 149], ["その他", 149], ["その他", 150], ["ペットフード", 151], ["犬用品", 151], ["猫用品", 151], ["魚用品/水草", 151], ["小動物用品", 151], ["爬虫類/両生類用品", 151], ["かご/おり", 151], ["鳥用品", 151], ["虫類用品", 151], ["その他", 151], ["菓子", 152], ["米", 152], ["野菜", 152], ["果物", 152], ["調味料", 152], ["魚介類(加工食品)", 152], ["肉類(加工食品)", 152], ["その他", 152], ["コーヒー", 153], ["ソフトドリンク", 153], ["ミネラルウォーター", 153], ["茶", 153], ["ウイスキー", 153], ["ワイン", 153], ["ブランデー", 153], ["焼酎", 153], ["日本酒", 153], ["ビール、発泡酒", 153], ["その他", 153], ["タオル/バス用品", 154], ["日用品/生活雑貨", 154], ["洗剤/柔軟剤", 154], ["旅行用品", 154], ["防災関連グッズ", 154], ["その他", 154], ["雑貨", 155], ["工芸品", 155], ["家具", 155], ["印刷物", 155], ["その他", 155], ["筆記具", 156], ["ノート/メモ帳", 156], ["テープ/マスキングテープ", 156], ["カレンダー/スケジュール", 156], ["アルバム/スクラップ", 156], ["ファイル/バインダー", 156], ["はさみ/カッター", 156], ["カードホルダー/名刺管理", 156], ["のり/ホッチキス", 156], ["その他", 156], ["オフィス用品一般", 157], ["オフィス家具", 157], ["店舗用品", 157], ["OA機器", 157], ["ラッピング/包装", 157], ["その他", 157],["その他",158]]

grandchild_array.each do |grandchild|
Category.create(name: grandchild[0],parent_id: grandchild[1])

end

##########ブランドテーブル用です#################


