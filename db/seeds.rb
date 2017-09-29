# Create user
gerardo = User.create(email: 'gerbonilla@gmail.com', password: '333333', password_confirmation: '333333')
diego = User.create(email: 'diegobonilla@gmail.com', password: '333333', password_confirmation: '333333')

# Create Profile
gerardo_profile = Profile.find_by(user: gerardo)
gerardo_profile.update(first_name: 'Gerardo', last_name: 'Bonilla', address: 'Stargarder Str. 72', transfer_pin: '3333', language: 'english')
diego_profile = Profile.find_by(user: diego)
diego_profile.update(first_name: 'Diego', last_name: 'Bonilla', address: 'Stargarder Str. 72', transfer_pin: '3333', language: 'english')
