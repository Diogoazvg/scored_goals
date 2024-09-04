file_path = 'soccer.dat'

team_with_smallest_difference = nil
smallest_difference = Float::INFINITY

pattern = /^\s*\d+\.\s+([\w_]+)\s+\d+\s+\d+\s+\d+\s+\d+\s+(\d+)\s+-\s+(\d+)/

File.foreach(file_path) do |line|
  match_data = line.match(pattern)

  if match_data
    team_name = match_data[1]
    goals_for = match_data[2].to_i
    goals_against = match_data[3].to_i

    # Calculate the difference
    difference = (goals_for - goals_against).abs

    # Determine if this is the smallest difference so far
    if difference < smallest_difference
      smallest_difference = difference
      team_with_smallest_difference = team_name
    end
  end
end

if team_with_smallest_difference
  puts "The team with the smallest difference in 'for' and 'against' goals is: #{team_with_smallest_difference}"
end
