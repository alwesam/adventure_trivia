json.title             @adventure.title
json.description       @adventure.description
json.include_final     @adventure.include_final
json.created_at        @adventure.created_at.strftime("%Y-%b-%d")
json.challenges        @adventure.challenges do |c|
  json.id               c.id
  json.address          c.address
  json.latitude         c.latitude
  json.longitude        c.longitude
  json.riddle           c.riddle
  json.questions        c.questions do |q|
    json.content          q.content
    json.answer           q.answer
    json.answers          q.answers do |a|
      json.content          a.content
    end
  end
end
