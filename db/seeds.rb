TAGS = { 
  health: ['ALS', 'Allergies', "Alzheimer's", 'Arthritis', 'Asthma',
           'Bedridden', 'COPD', 'Cancer', 'Dementia', 'Diabetes',
           'Fall risk', 'Hearing Loss', 'Heart Disease', 'Hospice',
           'Incontinence', 'MS', 'Memory loss', "Parkinson's",
           'Prosthetics', 'Seizures', 'Skin Problems', 'Strokes',
           'Tracheostomy tube', 'Vertigo', 'Vision problems', 'Wounds'],
  environment: ['Clutter', 'Extreme Temperatures', 'Pets', 'Smoking'],
  task: ['Bathing', 'Cleaning', 'Communication', 'Companionship',
         'Cooking', 'Dressing', 'Feeding', 'Getting up',
         'Going to the bathroom', 'Grooming', 'Housekeeping',
         'Hoyer Lift', 'Incontinence Care', 'Laundry', 'Live in',
         'Medication reminders', 'Mobility Assistance',
         'Physical Therapy', 'Running errands', 'Transferring',
         'Transportation']
}

TAGS.each do |category, names|
  names.each do |name|
    Tag.create(name: name, category: category)
  end
end

def rand_tags(model, category, amount)
  model.tags << Tag.send(category).sample(amount)
end

ADDRESSES = JSON.parse(File.read("#{Rails.root}/db/addresses.json"))

def rand_address(model)
  address = ADDRESSES.sample
  model.street_address = address.first
  model.city = address.second
  model.state = address.third
  model.zip_code = address.fourth
end

def rand_phone_number(model)
  model.phone_number = Faker::Base.numerify('(479) 555-####')
end

def rand_name(model)
  model.first_name = Faker::Name.first_name
  model.last_name = Faker::Name.last_name
end

def rand_gender(model)
  model.gender = [0, 1].sample
end

def rand_birthdate(model, age_range)
  model.birthdate = Time.zone.now - rand(age_range).years
end

# Create organization
o = Organization.new(name: 'Acme Home Care', email: 'hello@acmehc.com')
rand_address(o)
rand_phone_number(o)
o.save

# Create manager
m = o.managers.new
m.login = Login.new(email: 'admin@acmehc.com', password: 'password')
rand_name(m)
rand_phone_number(m)
m.save
m.login.confirm

# Create caregivers
22.times do |i|
  cg = o.caregivers.new
  cg.login = Login.new(email: "caregiver#{i + 1}@example.com", password: 'password')
  rand_name(cg)
  rand_gender(cg)
  rand_birthdate(cg, 18..45)
  rand_address(cg)
  rand_phone_number(cg)
  cg.save
  rand_tags(cg, :health, rand(10..20))
  rand_tags(cg, :environment, rand(1..3))
  rand_tags(cg, :task, rand(8..16))
  cg.login.confirm
end

# Create clients
20.times do
  cl = o.clients.new
  rand_name(cl)
  rand_gender(cl)
  rand_birthdate(cl, 55..90)
  rand_address(cl)
  rand_phone_number(cl)
  cl.description = Faker::Lorem.paragraph
  cl.save
  rand_tags(cl, :health, rand(1..4))
  rand_tags(cl, :environment, rand(0..1))
  rand_tags(cl, :task, rand(2..8))
end
