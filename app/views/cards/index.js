alert("ajax worked!");

- data = []
- @cards.each do |c|
  - data << {:label => "#{c.person.last_name}", :value => "#{c.person.last_name}" }
  = data.to_json

