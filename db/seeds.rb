puts 'Cleaning database...'
Trip.destroy_all
User.destroy_all
Activity.destroy_all

puts 'Creating users...'
alexia = User.create!(first_name: "Alexia", last_name: "Le Tarnec", email: "alexia@gmail.com", password: "azertyuiop")
guillaume = User.create!(first_name: "Guillaume", last_name: "Hercot", email: "guillaume@gmail.com", password: "azertyuiop")
julie = User.create!(first_name: "Julie", last_name: "Simon", email: "julie@gmail.com", password: "azertyuiop")
mathilde = User.create!(first_name: "Mathilde", last_name: "Ganancia", email: "mathilde@gmail.com", password: "azertyuiop")

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
    budget: 3,
    knows_the_city: 3,
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
    budget: 3,
    knows_the_city: 3,
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
    budget: 3,
    knows_the_city: 3,
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
    budget: 3,
    knows_the_city: 3,
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
    budget: 3,
    knows_the_city: 3,
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
    budget: 3,
    knows_the_city: 3,
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
    budget: 3,
    knows_the_city: 3,
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
    budget: 3,
    knows_the_city: 3,
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
    budget: 3,
    knows_the_city: 3,
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
    budget: 3,
    knows_the_city: 3,
    art_lover: true,
    to_book: false,
    website: "http://www.hallesaintpierre.org/2017/06/27/caro-jeunet/",
  },
  {
    title:"Balade au parc des Buttes-Chaumont",
    name: "Buttes-Chaumont",
    address: "1 Rue Botzaris, 75019 Paris",
    photo:"http://www.unjourdeplusaparis.com/files/2016/05/balade-parc-buttes-chaumont.jpg",
    family: true,
    couple: true,
    friends: true,
    solo: true,
    relaxed: true,
    nature_lover: true,
    to_book: false,
    budget: 3,
    knows_the_city: 3,
  },

  {
    title:"Promenade sur la Butte Bergeyre",
    name: "Butte Bergeyre",
    address: "76 Rue Georges Lardennois, 75019 Paris",
    photo:"https://3.bp.blogspot.com/-3RT2VoG97B8/VLqoHdOBT9I/AAAAAAAAXfc/M9L8t2LE98A/s1600/butte%2Bbergeyre%2Bparis%2B19%2B16%2Bbis.JPG",
    family: true,
    couple: true,
    friends: true,
    solo: true,
    relaxed: true,
    city_wanderer: true,
    nature_lover: true,
    to_book: false,
    budget: 3,
    knows_the_city: 3,
  },
  {
    title:"Promenade sur le canal de l'Ourcq",
    name: "Canal de l'Ourcq",
    address: "26-28 Quai de la Marne, 75019 Paris",
    photo:"https://upload.wikimedia.org/wikipedia/commons/3/33/Canal_Saint_Martin_vu_de_vers_la_Rotonde_de_la_Villette.jpg",
    family: true,
    couple: true,
    friends: true,
    solo: true,
    relaxed: true,
    city_wanderer: true,
    nature_lover: true,
    to_book: true,
    budget: 3,
    knows_the_city: 3,
  },
  {
    title:"Pause Bains d'Orient",
    name: "Les Bains d'Orient",
    address: "7 Place de la Bataille de Stalingrad, 75010 Paris",
    photo:"http://www.riadsmorocco.com/photos/riad-jnane-sherazade-hammam.jpg",
    couple: true,
    solo: true,
    relaxed: true,
    to_book: true,
    budget: 3,
    knows_the_city: 3,
    website: "https://www.lesbainsdorient.com/",
  },
  {
    title:"Break au Hammam du canal",
    name: "Hammam du canal",
    address: "156 Rue de Crimée, 75019 Paris",
    photo:"https://www.piscines-de-france.fr/images/pages/galerie46/hammam-carrele.jpg",
    couple: true,
    solo: true,
    relaxed: true,
    to_book: true,
    budget: 3,
    knows_the_city: 3,
    website: "https://www.hammam-du-canal.com/",
  },
  {
    title:"Visite de l'Église Saint-Serge",
    name: "Eglise Orthodoxe Saint-Serge",
    address: "93 Rue de Crimée, 75019 Paris",
    photo:"http://www.unjourdeplusaparis.com/files/2012/07/visite-saint-serge-radonege-paris.jpg",
    couple: true,
    solo: true,
    family: true,
    friends: true,
    relaxed: true,
    to_book: true,
    history_passionate: true,
    city_wanderer: true,
    sight_seeing_adventurer: true,
    knows_the_city: 3,
  },

    {
    title:"Break piscine au club Papillon",
    name: "Espace Sportif Pailleron",
    address: "32 Rue Edouard Pailleron, 75019 Paris",
    photo:"http://www.linternaute.com/paris/magazine/diaporama/06/piscine-patinoire-pailleron/images/complexe-sportif-pailleron-1.jpg",
    couple: true,
    solo: true,
    family: true,
    friends: true,
    to_book: true,
    sport_lover:true,
    budget: 3,
    knows_the_city: 3,
    website: "http://www.pailleron19.com/",
  },

  {
    title:"Boxe Thaï",
    name: "ASMBF",
    address: "5 Rue des Lilas, 75019 Paris",
    photo:"http://www1.pictures.zimbio.com/gi/Floyd+Mayweather+Jr+v+Canelo+Alvarez+j54F35Et2Etx.jpg",
    couple: true,
    solo: true,
    family: true,
    friends: true,
    to_book: true,
    sport_lover:true,
    budget: 3,
    knows_the_city: 3,
    website: "http://www.asmbf.fr/ASMBF_Paris_Boxing_Club/Home.html",
  },

  {
    title:"Détour au Marché de Noël Alsacien",
    name: "Marché de Noël",
    address: "Gare de l'Est, 75010 Paris",
    photo:"http://medias.tourism-system.com/7/4/307599_13196-marche_noel_87186.jpg",
    couple: true,
    solo: true,
    family: true,
    friends: true,
    to_book: false,
    food_addict: true,
    relaxed: true,
    budget: 3,
    knows_the_city: 3,
  },

  {
    title:"Découvrez le Tango Argentin",
    name: "La Casa del Tango",
    address: "11 Allée Darius Milhaud, 75019 Paris",
    photo:"https://tango-attitude.com/wp-content/uploads/2015/09/cours-tango-strasbourg.png",
    couple: true,
    solo: true,
    family: true,
    friends: true,
    to_book: true,
    sport_lover:true,
    budget: 3,
    knows_the_city: 3,
    website: "http://www.lacasadeltango.net/",
  },

  {
    title:"Cours de Pilates",
    name: "NEDJMA - École de danse",
    address: "41 Rue des Solitaires, 75019 Paris",
    photo:"http://www.kio-o.ca/wp-content/uploads/2016/05/fotolia_74609218.jpg",
    solo: true,
    friends: true,
    to_book: true,
    sport_lover:true,
    budget: 3,
    knows_the_city: 3,
    website: "http://www.nedjmadanse.com/ecole.htm",
  },
  {
    title:"Cours de danse au Studio Nilanthi",
    name: "Studio Nilanthi",
    address: "83 Rue Rebeval, 75019 Paris",
    photo:"https://studio-nilanthi.com/images/home-slide-1.jpg?crc=9313831",
    solo: true,
    friends: true,
    to_book: true,
    sport_lover:true,
    budget: 3,
    knows_the_city: 3,
    website: "http://www.http://studio-nilanthi.com/",
  },
  {
    title:"Break meditation",
    name: "Dojo Zen Paris",
    address: "210 Rue de Belleville, 75020 Paris",
    photo:"http://img.over-blog-kiwi.com/0/83/70/99/20150408/ob_1d8c39_img-3796.JPG",
    solo: true,
    couple: true,
    friends: true,
    to_book: false,
    relaxed: true,
    budget: 3,
    knows_the_city: 3,
    website: "www.dojozenparis.com/",
  },
    {
    title:"Balade en aviron le long du canal",
    name: "Base nautique de la Villette",
    address: "17 Quai de la Loire, 75019 Paris",
    photo:"https://www.momondo.fr/inspiration/wp-content/uploads/sites/11/2017/08/activites-sportives-paris-aviron-istock-low-reso.jpg",
    solo: true,
    couple: true,
    friends: true,
    to_book: true,
    relaxed: true,
    budget: 3,
    knows_the_city: 3,
    website: "https://www.paris.fr/services-et-infos-pratiques/sports-et-loisirs/ou-faire-du-sport/le-sport-en-plein-air-2016#les-bases-nautiques_6",
  },

]
Activity.create(activities_attributes)

puts 'Creating trips...'
trips_attributes = [
  {
    title: "John in Paris",
    date: DateTime.parse("09/01/2017 00:00"),
    host_id: User.first.id,
    tourist_id: User.last.id,
    art_lover: true,
    food_addict: true,
    status: "solo",
    tourist_first_name: User.last.first_name,
    tourist_email: User.last.email
  },
  {
    title: "Mike in Paris",
    date: DateTime.parse("09/01/2018 00:00"),
    host_id: User.first.id,
    tourist_id: User.all[2].id,
    tourist_first_name: User.first.first_name,
    tourist_email: User.first.email,
    status: "family"
  }
]
Trip.create!(trips_attributes)

puts 'Creating visits...'
visit_one = Visit.new
visit_two = Visit.new
visit_three = Visit.new

visit_one.trip = Trip.first
visit_two.trip = Trip.first
visit_three.trip = Trip.first

visit_one.activity = Activity.all[1]
visit_two.activity = Activity.all[3]
visit_three.activity = Activity.all[5]

visit_one.save!
visit_two.save!
visit_three.save!

visit_one_bis = Visit.new
visit_two_bis = Visit.new
visit_three_bis = Visit.new

visit_one_bis.trip = Trip.last
visit_two_bis.trip = Trip.last
visit_three_bis.trip = Trip.last

visit_one_bis.activity = Activity.all[2]
visit_two_bis.activity = Activity.all[4]
visit_three_bis.activity = Activity.all[3]

visit_one_bis.save!
visit_two_bis.save!
visit_three_bis.save!


puts 'Finished seed!'


