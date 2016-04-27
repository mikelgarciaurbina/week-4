(1..9).each do |i|
  Contact.create(name: "Name #{i}", address: "Address #{i}", phone: "98765432#{i}", email: "email#{i}@example.com")
end

puts "Contacts created"