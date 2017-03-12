def get_first_name_of_season_winner(data, season)
  data[season].detect  { |contestant| contestant["status"] == "Winner"}["name"].split(" ").first
end


def get_contestant_name(data, occupation)
  all_contestants = data.values.reduce([]) { |all_contestants, contestants| all_contestants.concat(contestants) }
  all_contestants.detect  { |contestant| contestant["occupation"] == occupation }["name"]
end

def count_contestants_by_hometown(data, hometown)
  all_contestants = data.values.reduce([]) { |all_contestants, contestants| all_contestants.concat(contestants) }
  all_contestants.select { |contestant| contestant["hometown"] == hometown }.length
end

def get_occupation(data, hometown)
  all_contestants = data.values.reduce([]) { |all_contestants, contestants| all_contestants.concat(contestants) }
  all_contestants.detect  { |contestant| contestant["hometown"] == hometown }["occupation"]
end

def get_average_age_for_season(data, season)
  ages = data[season].collect {|contestant| contestant["age"].to_i}
  (ages.reduce(0) { |sum, age| sum + age }.to_f / ages.length).round
end
