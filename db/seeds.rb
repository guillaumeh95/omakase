puts 'Cleaning database...'
Trip.destroy_all
User.destroy_all


puts 'Creating users...'
alexia = User.create(firstname: "Alexia", lastname: "Le Tarnec", email: "alexia@gmail.com", password: "azertyuiop")
guillaume = User.create(firstname: "Guillaume", lastname: "Hercot", email: "guillaume@gmail.com", password: "azertyuiop")
julie = User.create(firstname: "Julie", lastname: "Simon", email: "julie@gmail.com", password: "azertyuiop")
mathilde = User.create(firstname: "Mathilde", lastname: "Ganancia", email: "mathilde@gmail.com", password: "azertyuiop")

puts 'Creating activities...'
addresses = ["5 rue François Rolland 94130 Nogent sur Marne", "28 rue de l'Université 75007 Paris", "23 rue André Barsacq 75018 Paris", "104 rue d'Aubervilliers Paris", "83 boulevard Vincent Auriol 75013 Paris", "39 rue des Francs Bourgeois 75004 Paris", "40 rue de Turbigo 75003 Paris", "122 rue Réaumur 75002 Paris", "82 avenue Denfert-Rochereau 75014 Paris", "43 avenue de la République 92120 Montrouge", "153 Boulevard Victor Hugo 92110 Clichy", "45 rue de Saint-Petersbourg 75008 Paris", "6 place du Marché 93100 Montreuil"]
activities_attributes = [
  {
    name:         'Tour Eiffel',
    t.string "address"
    t.string "photo"
    t.boolean "family", default: false
    t.boolean "couple", default: false
    t.boolean "friends", default: false
    t.boolean "solo", default: false
    t.boolean "sight_seeing_adventurer", default: false
    t.boolean "art_lover", default: false
    t.boolean "serial_shopper", default: false
    t.boolean "food_addict", default: false
    t.boolean "sport_lover", default: false
    t.boolean "history_passionate", default: false
    t.boolean "tech_fan", default: false
    t.boolean "nature_lover", default: false
    t.boolean "relaxed", default: false
    t.boolean "city_wanderer", default: false
    t.boolean "to_book", default: false


    price_per_day: 4,
    instruction: "Water cactus when the top 1/2 inch of the growing medium is dry to the touch. Soak the medium thoroughly and allow it to drain when watering -- do not leave the cacti constantly sitting in a dish of water.",
    address:      '19 boulevard Victor Hugo 92200 Neuilly sur Seine',
    category:     'Cactus',
    remote_photo_url: 'https://images.unsplash.com/photo-1459411552884-841db9b3cc2a?auto=format&fit=crop&w=409&q=80&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D',
    user: alexia
  },
  {
    name:         "#{superlatives.sample} Rubber Plants",
    price_per_day: rand(2..20),
    instruction: "The rubber plant requires bright, indirect light. You should only water it when the soil is dry",
    address:      addresses.sample,
    category:     'Green Plant',
    remote_photo_url: 'http://www.theborrowednursery.com.au/wp-content/uploads/2017/05/IMG_7575.jpg',
    user: User.all.sample
  },
]

Activity.create(activity_attributes)

puts 'Finished creating activities!'
