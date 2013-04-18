Order.transaction do 
	(1..12).each do |i|
		Order.create(name: "Customer #{i}", address: "#{i} main Street", 
			email: "Customer-#{i}@gmail.com", phone: "#{i}*7")
		end
end