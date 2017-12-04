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
    name: 'Tour Eiffel',
    address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris",
    photo: "https://scontent.cdninstagram.com/t51.2885-15/sh0.08/e35/p640x640/23734568_185364498708118_2632002310275858432_n.jpg",
    user: User.all.sample
  },
  {
    name: 'Tour Eiffel',
    address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris",
    photo: "https://scontent.cdninstagram.com/t51.2885-15/sh0.08/e35/p640x640/23734568_185364498708118_2632002310275858432_n.jpg",
    user: User.all.sample
  },
  {
    name: 'Tour Eiffel',
    address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris",
    photo: "https://scontent.cdninstagram.com/t51.2885-15/sh0.08/e35/p640x640/23734568_185364498708118_2632002310275858432_n.jpg",
    user: User.all.sample
  },
  {
    name: 'Tour Eiffel',
    address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris",
    photo: "https://scontent.cdninstagram.com/t51.2885-15/sh0.08/e35/p640x640/23734568_185364498708118_2632002310275858432_n.jpg",
    user: User.all.sample
  },
]

Activity.create(activity_attributes)

puts 'Finished creating activities!'
