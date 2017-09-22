# Create user
gerardo = User.create(email: 'gerbonilla@gmail.com', password: '333333', password_confirmation: '333333')
diego = User.create(email: 'diegobonilla@gmail.com', password: '333333', password_confirmation: '333333')

# Create Profile
gerardo_profile = Profile.find_by(user: gerardo)
gerardo_profile.update(first_name: 'Gerardo', last_name: 'Bonilla', address: 'Stargarder Str. 72', transfer_pin: '3333', language: 'english')
diego_profile = Profile.find_by(user: diego)
diego_profile.update(first_name: 'Diego', last_name: 'Bonilla', address: 'Stargarder Str. 72', transfer_pin: '3333', language: 'english')

# Create Account
gerardo_account = Account.create(profile: gerardo_profile, account_number: 1000000, balance_cents: 100, iban: 'SAL123456')
diego_account = Account.create(profile: diego_profile, account_number: 1000000, balance_cents: 100, iban: 'SAL123456')

# Create Card
gerardo_card = Card.create(account: gerardo_account, card_number: 4242424242424242, cvv: 123, expiration: '12/12/2022'.to_date, pin: 3333)
diego_card = Card.create(account: diego_account, card_number: 4242424242424242, cvv: 123, expiration: '12/12/2022'.to_date, pin: 3333)

# Create Transactions
Transaction.create(date_posted: '09/01/2017'.to_date, status: 'posted', account: gerardo_account, amount_cents: 1000_00, description: "Initial transfer")
Transaction.create(date_posted: '09/04/2017'.to_date, status: 'posted', account: gerardo_account, amount_cents: -200_00, description: "Amazon.com")
Transaction.create(date_posted: '09/05/2017'.to_date, status: 'posted', account: gerardo_account, amount_cents: -50_00, description: "Dinner Cecconi's")


Transaction.create(date_posted: '09/01/2017'.to_date, status: 'posted', account: diego_account, amount_cents: 5000_00, description: "Initial transfer")
Transaction.create(date_posted: '09/04/2017'.to_date, status: 'posted', account: diego_account, amount_cents: -1000_00, description: "Shoes")
Transaction.create(date_posted: '09/05/2017'.to_date, status: 'posted', account: diego_account, amount_cents: -500_00, description: "More Shoes")

