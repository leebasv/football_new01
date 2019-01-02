100.times do |n|
  match_id = 1
  price = "200#{n+1}".to_f
  status = 0
  outcome = 0
  user_id = 103
  ScoreBet.create!(match_id: match_id,
                   price: price,
                   status: status,
                   outcome: outcome,
                   user_id: user_id)
end
