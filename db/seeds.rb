require "faker"

User.destroy_all
Item.destroy_all
Cart.destroy_all
CartItem.destroy_all
Order.destroy_all
OrderItem.destroy_all

5.times do
  new_user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Name.first_name + "@yopmail.com",
    password: "azerty",
  )
  Cart.create!(user_id: new_user.id)
  puts "Create User and Cart"
end


20.times do |index|
  item = Item.create!(
    title: Faker::Creature::Cat.breed,
    description: Faker::Lorem.sentence(word_count: 8),
    price: rand(1.0..1000.0).round(2),
    image_url: "https://i-dja.unimedias.fr/sites/art-de-vivre/files/styles/large/public/dj115_chaton_jardin_annala.jpg?auto=compress%2Cformat&crop=faces%2Cedges&cs=srgb&fit=crop&h=599&w=900",
  )
  
  item.image.attach(io: File.open("app/assets/images/kitten_pictures/kitten_#{index+1}.jpg"), filename: "kitten_#{index+1}.jpg")
  puts "Create Item"
end

10.times do
  CartItem.create!(cart: Cart.all.sample, item: Item.all.sample)
  puts "Put Item in Cart"
end

3.times do
  cart_ordered = Cart.all.sample
  new_order = Order.create!(cart: cart_ordered, amount: cart_ordered.total)
  puts "Create Order"
  new_order.cart.items.each do |item|
    OrderItem.create!(order: new_order, item: item)
    puts "Register Order Items"
  end
end
