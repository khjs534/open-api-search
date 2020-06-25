# Get initial data from Bikewise API
# Incident type = Thefts
# around denver
# 100 mi radius
# first 200 entries

response = Bikewise.new.denver_thefts.parsed_response

response['incidents'].each do |incident|
  Theft.find_or_create_by(id: incident['id'], title: incident['title'], description: incident['description'], address: incident['address'], source_url: incident['source']['html_url'], image_url: incident['media']['image_url'], created_at: DateTime.strptime(incident['occurred_at'].to_s, '%s'), updated_at: DateTime.strptime(incident['updated_at'].to_s, '%s'))
end

puts "Seeded."
