User.destroy_all
Subscription.destroy_all
Review.destroy_all

50.times do
    User.create(name:Faker::Name.name, email:Faker::Internet.email, payment_method:Faker::Subscription.payment_method)
end

50.times do
    Subscription.create(name:Faker::DcComics.heroine, price:Faker::Number.decimal(l_digits: 2), status:Faker::Subscription.status)
end

50.times do
    Review.create(user_id:User.all.sample.id, subscription_id:Subscription.all.sample.id, rating:rand(1...5), description:Faker::Restaurant.review)
end 

puts 'done'