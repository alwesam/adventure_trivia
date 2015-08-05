json.array! @adventures do |adventure|
  json.id               adventure.id
  json.title            adventure.title
  json.description      adventure.description
  json.average_rating   adventure.average_rating
  json.include_final    adventure.include_final
  json.token            adventure.token
  json.url              adventure_url(adventure)
end
