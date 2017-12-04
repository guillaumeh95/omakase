puts 'Cleaning database...'
Trip.destroy_all
User.destroy_all


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
  }
]

Activity.create(activities_attributes)

puts 'Finished creating activities!'
