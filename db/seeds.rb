users= ["agador", "spartacus", "willie123", "331marakh", "lenahop", "thotting", "scoup_"]

items= ["iced tea", "cold brew", "nonfat latte", "cappucino"]

users.each do |username| 
	User.create(username: username)
end

items.each do |item_name|
	Item.create(item_name: item_name, "small")
end 

# 50.times do  
# 	Order.create(user_id: rand(1..6), item_id: rand(1..4))
# end
