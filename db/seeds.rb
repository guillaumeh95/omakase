puts 'Cleaning database...'
Trip.destroy_all
User.destroy_all
Activity.destroy_all

puts 'Creating users...'
alexia = User.create(first_name: "Alexia", last_name: "Le Tarnec", email: "alexia@gmail.com", password: "azertyuiop")
guillaume = User.create(first_name: "Guillaume", last_name: "Hercot", email: "guillaume@gmail.com", password: "azertyuiop")
julie = User.create(first_name: "Julie", last_name: "Simon", email: "julie@gmail.com", password: "azertyuiop")
mathilde = User.create(first_name: "Mathilde", last_name: "Ganancia", email: "mathilde@gmail.com", password: "azertyuiop")

puts 'Creating activities...'
activities_attributes = [
  {
    name: 'Tour Eiffel',
    address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris",
    photo: "https://scontent.cdninstagram.com/t51.2885-15/sh0.08/e35/p640x640/23734568_185364498708118_2632002310275858432_n.jpg",
  },
  {
    name: 'Arc de Triomphe',
    address: "Place Charles de Gaulle, 75008 Paris",
    photo: "https://en.parisinfo.com/var/otcp/sites/images/media/1.-photos/02.-sites-culturels-630-x-405/arc-de-triomphe-ciel-bleu-630x405-c-thinkstock/35684-1-fre-FR/Arc-de-Triomphe-ciel-bleu-630x405-C-Thinkstock.jpg",
  },
  {
    name: 'Parc Monceau',
    address: "35 Boulevard de Courcelles, 75008 Paris",
    photo: "http://www.goodmorningparis.fr/blog/wp-content/uploads/2016/05/Parc-Monceau-Paris-colonnade-01.jpg",
  },
  {
    name: 'Notre-Dame de Paris',
    address: "6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris",
    photo: "https://media-cdn.tripadvisor.com/media/photo-s/00/12/6d/03/the-view-from-the-top.jpg",
  },
  {
    title:"Eugene Richards : the Run-on of Time",
    name: "Parvis de la Défense",
    address: "Parvis de la défense Puteaux",
    photo:"https://media.timeout.com/images/104684516/750/422/image.jpg",
    family: true,
    couple: true,
    friends: true,
    solo: true,
    art_lover: true,
    to_book: false,
    website: "https://www.lagrandearche.fr/actualites/le-photojournalisme/exposition-stephanie-sinclair",
  },
  {
    title:"Météorites, entre ciel et terre",
    name: "Grande Galerie de l'Evolution",
    address: "36 rue Geoffroy-Saint-Hilaire 75005 Paris",
    photo:"https://media.timeout.com/images/104677319/750/422/image.jpg",
    family: true,
    couple: true,
    friends: true,
    solo: true,
    art_lover: true,
    serial_shopper: false,
    food_addict: false,
    history_passionate: true,
    to_book: false,
    website: "http://meteorites.grandegaleriedelevolution.fr/",
  },
  {
    title:"Sophie Calle : beau doublé monsieur le Marquis",
    name: "Musée de la Chasse et de la Nature",
    address: "62 rue des Archives 75003 Paris",
    photo:"https://media.timeout.com/images/104623692/750/422/image.jpg",
    family: true,
    couple: true,
    friends: true,
    solo: true,
    art_lover: true,
    to_book: false,
    website: "http://www.chassenature.org/sophie-calle-et-son-invitee-serena-carone/",
  },
  {
    title:"Women House",
    name: "Monnaie de Paris",
    address: "11 quai de Conti 75006 Paris",
    photo:"https://media.timeout.com/images/104673306/750/422/image.jpg",
    family: true,
    couple: true,
    friends: true,
    solo: true,
    art_lover: true,
    to_book: false,
    website: "https://www.google.fr/search?q=women+house+monnaie+de+paris&oq=women+house+monair&aqs=chrome.1.69i57j0.5934j0j4&sourceid=chrome&ie=UTF-8",
  },
  {
    title:"Clément Cogitore",
    name: "Le Bal",
    address: "6 impasse de la Défense 75018 Paris",
    photo:"https://media.timeout.com/images/104093092/750/422/image.jpg",
    family: true,
    couple: true,
    friends: true,
    solo: true,
    art_lover: true,
    to_book: false,
    website: "http://www.le-bal.fr/2017/06/clement-cogitore",
  },
  {
    title:"Malick Sidibé : Mali Twist",
    name: "Fondation Cartier",
    address: "261 boulevard Raspail 75014 Paris",
    photo:"https://media.timeout.com/images/104097644/750/422/image.jpg",
    family: true,
    couple: true,
    friends: true,
    solo: true,
    art_lover: true,
    to_book: false,
    website: "https://www.fondationcartier.com/#/fr/art-contemporain/55/editions/289/toutes-les-publications/348/malick-sidibe-bamako-1962-1976/",
  },
  {
    title:"Barbara",
    name: "Philarmonie de Paris",
    address: "221 avenue Jean Jaurès 75019 Paris",
    photo:"https://media.timeout.com/images/104088792/710/399/image.jpg",
    family: true,
    couple: true,
    friends: true,
    solo: true,
    art_lover: true,
    to_book: false,
    website: "https://philharmoniedeparis.fr/fr/exposition-barbara",
  },
  {
    title:"Galerie d'art contemporain",
    name: "Galerie Thaddaeus Ropac",
    address: "7 rue Debelleyme",
    photo:"https://media.timeout.com/images/100017453/710/399/image.jpg",
    family: true,
    couple: true,
    friends: true,
    solo: true,
    art_lover: true,
    to_book: false,
    website: "http://ropac.net/",
  },
  {
    title:"Pierre Paulin – Boom boom, run run",
    name: "Le Plateau - FRAC",
    address: "22 rue des Alouettes 75019 Paris",
    photo:"https://www.fraciledefrance.com/wp/wp-content/uploads/Boom-boom-run-run-site2-1024x724.jpg",
    family: true,
    couple: true,
    friends: true,
    solo: true,
    art_lover: true,
    to_book: false,
    website: "https://www.fraciledefrance.com/pierre-paulin-boom-boom-run-run/",
  },
  {
    title:"Caro/Jeunet",
    name: "Halle Saint Pierre",
    address: "2 rue Ronsard 75018 Paris",
    photo:"https://media.timeout.com/images/103970015/750/422/image.jpg",
    family: true,
    couple: true,
    friends: true,
    solo: true,
    art_lover: true,
    to_book: false,
    website: "http://www.hallesaintpierre.org/2017/06/27/caro-jeunet/",
  }
]
Activity.create(activities_attributes)

puts 'Creating trips...'
trips_attributes = [
  {
    title: "John in Paris",
    date: DateTime.parse("09/01/2017 00:00"),
    host_id: User.first.id,
    tourist_id: User.last.id
  },
  {
    title: "Mike in Paris",
    date: DateTime.parse("09/01/2018 00:00"),
    host_id: User.first.id,
    tourist_id: User.all[2].id
  }
]
Trip.create(trips_attributes)

puts 'Creating visits...'
visit_one = Visit.new
visit_two = Visit.new
visit_three = Visit.new

visit_one.trip = Trip.first
visit_two.trip = Trip.first
visit_three.trip = Trip.first

visit_one.activity = Activity.all.sample
visit_two.activity = Activity.all.sample
visit_three.activity = Activity.all.sample

visit_one.save
visit_two.save
visit_three.save

visit_one_bis = Visit.new
visit_two_bis = Visit.new
visit_three_bis = Visit.new

visit_one_bis.trip = Trip.last
visit_two_bis.trip = Trip.last
visit_three_bis.trip = Trip.last

visit_one_bis.activity = Activity.all.sample
visit_two_bis.activity = Activity.all.sample
visit_three_bis.activity = Activity.all.sample

visit_one_bis.save
visit_two_bis.save
visit_three_bis.save


puts 'Finished seed!'


