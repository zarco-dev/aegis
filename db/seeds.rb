# User.destroy_all

SubscriptionPlan.create!(
  title: "basic",
  description: "Plan basico, almacena hasta 15 contraseñas",
  price: 10
)

SubscriptionPlan.create!(
  title: "Premium",
  description: "Plan premium, almacena contraseñas ilimitadas y crear grupos para compartirlas",
  price: 30
)

# # # 6.times do |c|
# # #   user1 = User.create!(
# # #     username: Faker::Internet.username,
# # #     email: Faker::Internet.email,
# # #     password: "123456",
# # #     full_name: Faker::Name.name,
# # #     premium_user: false,
# # #     group_user: false,
# # #     birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
# # #     cel_number: Faker::Number.number
# # #   )

# # #   subs = Subscription.create!(
# # #     begining_date: "2022-10-14",
# # #     expired_date: "2022-11-14",
# # #     subscription_plan_id: rand(1..2),
# # #     user_id: c + 1
# # #   )

# # #   if subs.subscription_plan_id == 2
# # #     user1.premium_user = true
# # #     user1.save
# # #   end
# # # end


# # # User.all.each do |user|
# # #   if user.premium_user
# # #     rand(1..3).times do
# # #       Group.create!(
# # #         name: %w[Streaming family socialmedia lospanas workteam].sample,
# # #         description: Faker::Lorem.paragraph,
# # #         users_number: 0,
# # #         user_id: user.id
# # #       )
# # #     end
# # #   end
# # # end

# # # 4.times do
# # #   Password.create!(
# # #     url: Faker::Internet.url,
# # #     site_name: Faker::Internet.domain_word,
# # #     category: %w[socialmedia streaming bets courses].sample,
# # #     site_username: Faker::Internet.username,
# # #     site_password: "123456",
# # #     isgroup: false,
# # #     user_id: rand(1..6)
# # #   )
# # # end

# # # # GroupInvitation.create!(
# # # #   status:
# # # # )

# # # 4.times do |c|
# # #   Password.create!(
# # #     url: Faker::Internet.url,
# # #     site_name: Faker::Internet.domain_word,
# # #     category: %w[socialmedia streaming bets courses].sample,
# # #     site_username: Faker::Internet.username,
# # #     site_password: "123456",
# # #     isgroup: true,
# # #     user_id: rand(1..6),
# # #     group_id: Group.all.sample.id
# # #   )
# # # end

# # # 2.times do
# # #   BankPassword.create!(
# # #     cardholder: Faker::Name.name,
# # #     account_type: %w[credit debit].sample,
# # #     bank_name: %w[Bancolombia Davivienda BBVA Falabella NuBank Popular Uala LuloBank Itau].sample,
# # #     franchise: %w[Visa Mastercard].sample,
# # #     account_number: Faker::Bank.account_number(digits: 16),
# # #     secure_code: rand(200..900),
# # #     expiration_date: "#{rand(2023..2029)}-#{rand(1..12)}-#{rand(1..30)}",
# # #     user_id: rand(1..6)
# # #   )
# # # end
