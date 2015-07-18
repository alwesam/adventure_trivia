json.array! @adventures do |adventure|
  json.id            adventure.id
  json.title         adventure.title
  json.description   adventure.description
  json.include_final adventure.include_final
  json.url           adventure_url(adventure)
end
