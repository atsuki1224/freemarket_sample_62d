crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", mypage_index_path
end

crumb :notification do
  link "お知らせ", mypage_index_path
  parent :mypage
end

crumb :todo do
  link "やることリスト", mypage_index_path
  parent :mypage
end

crumb :nice_index do
  link "いいね一覧", mypage_index_path
  parent :mypage
end

crumb :listing do
  link "出品した商品 - 出品中", mypage_index_path
  parent :mypage
end

crumb :in_progress do
  link "出品した商品 - 取引中", mypage_index_path
  parent :mypage
end

crumb :completed do
  link "出品した商品 - 売却済み", mypage_index_path
  parent :mypage
end

crumb :purchase do
  link "購入した商品 - 取引中", mypage_index_path
  parent :mypage
end

crumb :purchased do
  link "購入した商品 - 過去の取引", mypage_index_path
  parent :mypage
end

crumb :profile do 
  link "プロフィール", mypage_index_path
  parent :mypage
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).