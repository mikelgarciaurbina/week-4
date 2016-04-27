Project.create(name: "Ironhack", description: "Ou yeah!")

(1..10).each do |i|
  project = Project.create(name: "Project number #{i}", description: "description #{i}")
  loops = rand(1..5)
  loops.times.each do |num|
    project.time_entries << TimeEntry.new(hours: rand(1..10), minutes: rand(1..10), comments: "Comments #{num}", date: Time.now)
  end
end

puts "Projects created"