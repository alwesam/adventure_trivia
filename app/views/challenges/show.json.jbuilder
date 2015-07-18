json.riddle           @challenge.riddle
json.questions @challenge.questions do |question|
  json.id      question.id
  json.content question.content
end
