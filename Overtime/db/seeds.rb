100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content") #TODO connect posts to user
end

puts "100 Posts have been created"
