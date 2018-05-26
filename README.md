# README

＜要件＞
①AttributeTypeテーブルの1つのレコードのnameカラムの値を取得して、同じSettingテーブルのsetting_valueを持ったactorをActorテーブルから検索、Movieに紐づける。
    例： AttributeType.nameが 'Actor1'の場合
      紐づいているSettingテーブルのsetting_valueは, 'Val1'と'Val2'の2つ、これを配列で取得。
      Settingテーブルのsetting_valueカラムを取得した配列で検索して、actor_idを配列で取得
      MovieActorテーブルのactor_idカラムを、取得した配列で検索。

      これでMovieActorと繋がったので、あとはこれをViewでeachで回して変数名.movieでアソシエーション先のMovieテーブルの情報が取れる。


② ①の処理は、AttributeTypeテーブルのname分行う。
    -> AttributeType.group(:name)で、nameカラムでGROUP BYが実行される。


例： ①と②
  result_array = []
  names = AttributeType.group(:name)
  names.each do |n|
    sv = n.settings.pluck(:setting_value)
    ac_id = Setting.where(setting_value: sv).pluck(:actor_id)
    result_array << MovieActor.where(actor_id: ac_id)
  end





③同じsetting_value1を持ったものを集めてさらにsetting_value2で集めたものでまとめる
  これを選択した回数分行う

④さらにActorのカラムを条件に追加できればなお良い。

