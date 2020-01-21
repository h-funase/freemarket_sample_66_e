# ルート
crumb :root do
  link "トップページ", root_path, class: "breadcrumbs_link"
end

crumb :mypages do
  link "マイページ", mypages_path
  parent :root
end

crumb :mypage do
  link "プロフィール", mypage_path
  parent :mypages
end

crumb :logout do
  link "ログアウト", logout_mypages_path
  parent :mypages
end

crumb :person_check do
  link "本人情報の登録", person_check_items_path
  parent :mypages
end

crumb :items_screen do
  link "出品した商品 - 出品中", items_screen_mypages_path
  parent :mypages
end

crumb :selling do
  link "出品中", selling_mypages_path
  parent :items_screen
end

crumb :credit do
  link "支払い方法", credit_items_path
  parent :mypages
end