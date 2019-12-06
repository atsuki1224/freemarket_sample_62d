json.array! @children do |child|

  json.name  child.name
  json.id  child.id

end

json.array! @grand_children do |grandchild|

  json.grandchild_name  grandchild.name
  json.grandchild_id  grandchild.id

end

json.array! @blands do |bland|
  json.bland_name bland.name
  json.bland_id  bland.id
end
