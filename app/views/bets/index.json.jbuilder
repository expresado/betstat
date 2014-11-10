json.array!(@bets) do |bet|
  json.extract! bet, :id, :match, :course, :bet, :result
  json.url bet_url(bet, format: :json)
end
