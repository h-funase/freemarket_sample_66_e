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