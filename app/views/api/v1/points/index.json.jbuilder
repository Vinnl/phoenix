json.array! @points do |point|
  json.extract! point, :id, :title, :source, :analysis, :rating, :topic_id, :service_id
end
