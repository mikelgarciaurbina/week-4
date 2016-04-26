Project.create(name: "Ironhack", description: "Ou yeah!")

(1..10).each do |i|
  Project.create(name: "Project number #{i}", description: "description #{i}")
end

puts "Projects created"