# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Registierte Benutzer

puts 'Registrierte Benutzer werden angelegt...'

u1 = User.create :name => 'Hetfield', :prename => 'James', :nick => 'jhetfield',
                 :email => 'jhetfield@metallica.com', :password => 'secret',
                 :show_name => true, :show_email => true,
                 :street => 'Bourbon Street 63', :show_street => true,
                 :zip => '33523', :city => 'New York', :show_city => true,
                 :homepage => 'www.metallica.com'

u2 = User.create :name => 'Ulrich', :prename => 'Jan', :nick => 'julrich',
                 :email => 'julrich@metallica.com', :password => 'secret'

u3 = User.create :name => 'Hammet', :prename => 'Kirk', :nick => 'khammet',
                 :email => 'khammet@metallica.com', :password => 'secret'

u4 = User.create :name => 'Trojillo', :prename => 'Robert', :nick => 'rtrojillo',
                 :email => 'rtrojillo@metallica.com', :password => 'secret'

u5 = User.create :name => 'McCartney', :prename => 'Paul', :nick => 'pmccartney',
                 :email => 'pmccartney@beatles.com', :password => 'secret'

u6 = User.create :name => 'Harrison', :prename => 'George', :nick => 'gharrison',
                 :email => 'gharrison@beatles.com', :password => 'secret',
                 :show_name => true, :show_email => true,
                 :street => 'Arlington Road 221', :show_street => true,
                 :zip => 'HN 383 F', :city => 'Hunstanton', :show_city => true,
                 :homepage => 'beatles.com'

u7 = User.create :name => 'Lennon', :prename => 'John', :nick => 'jlennon',
                 :email => 'jlennon@beatles.com', :password => 'secret'

u8 = User.create :name => 'Starr', :prename => 'Ringo', :nick => 'rstarr',
                 :email => 'rstarr@beatles.com', :password => 'secret'

u9 = User.create :name => 'Kirsten', :prename => 'Daniel', :nick => 'Kuerschten',
                 :email => 'daniel.kirsten@mni.thm.de', :password => 'secret',
                 :show_email => true,
                 :host => true

u10= User.create :name => 'Bader', :prename => 'Markus', :nick => 'moerkb',
                 :email => 'markus.bader@mni.thm.de', :password => 'secret',
                 :show_name => true, :show_email => true,
                 :about => 'Admin und Programmierer'

u11= User.create :name => 'Dummy', :prename => 'Klaus', :nick => 'dummy',
                 :email => 'dummy@unknown.net', :password => 'secret'

puts 'fertig.'

# Unregistrierte Benutzer

puts 'Unregistierte Benutzer werden angelegt...'

ur1 = UnregisteredUser.create :name => 'Kinski', :prename => 'Klaus'
ur2 = UnregisteredUser.create :name => 'Polo', :prename => 'Marco'
ur3 = UnregisteredUser.create :name => 'Gates', :prename => 'Bill'
ur4 = UnregisteredUser.create :name => 'Ante', :prename => 'Benjamin'
ur5 = UnregisteredUser.create :name => 'Kruse', :prename => 'Kevin'
ur6 = UnregisteredUser.create :name => 'Hafner', :prename => 'Benno'

puts 'fertig.'

# Gruppen

puts 'Gruppen werden angelegt...'

ag1 = ArtistGroup.create
g1 = Group.create :name => 'Metallica', :homepage => 'www.metallica.com', :groupable => ag1

ag2 = ArtistGroup.create
g2 = Group.create :name => 'Beatles', :homepage => 'beatles.com', :groupable => ag2

ag3 = ArtistGroup.create
g3 = Group.create :name => 'Love Muffins', :homepage => 'love-muffins.de', :groupable => ag3

fg1 = FanGroup.create :artist_group => ag1
g4 = Group.create :name => 'Metallica-Fan-Club', :groupable => fg1

fg2 = FanGroup.create :artist_group => ag2
g5 = Group.create :name => "Beatles-Fan-Club", :groupable => fg2

fg3 = FanGroup.create :artist_group => ag1
g6 = Group.create :name => 'noch ein Metallica-Fan-Club', :groupable => fg3

hg1 = HostGroup.create
g7 = Group.create :name => 'BullshitEvents', :groupable => hg1

hg2 = HostGroup.create
g8 = Group.create :name => 'Hogwards School of Rock', :groupable => hg2

puts 'fertig.'

# Instrumente

puts 'Instrumente werden angelegt...'

i1 = Instrument.create :name => 'Gitarre', :abbreviation => 'g'
i2 = Instrument.create :name => 'Gesang', :abbreviation => 'voc'
i3 = Instrument.create :name => 'Bass', :abbreviation => 'b'
i4 = Instrument.create :name => 'Schlagzeug', :abbreviation => 'dr'

puts 'fertig.'

# Memberships

puts 'Benutzer werden in Gruppen eingeschrieben...'

#Metallica
m1 = Membership.create :group => g1, :userable => u1
m2 = Membership.create :group => g1, :userable => u2
m3 = Membership.create :group => g1, :userable => u3
m4 = Membership.create :group => g1, :userable => u4

#Beatles
m5 = Membership.create :group => g2, :userable => u5
m6 = Membership.create :group => g2, :userable => u6
m7 = Membership.create :group => g2, :userable => u7
m8 = Membership.create :group => g2, :userable => u8

#Love Muffins
m9 = Membership.create :group => g3, :userable => u10
m10= Membership.create :group => g3, :userable => ur4
m11= Membership.create :group => g3, :userable => ur5
m12= Membership.create :group => g3, :userable => ur6

#Metallica-Fan-Gruppe
m13= Membership.create :group => g4, :userable => u9
m14= Membership.create :group => g4, :userable => u10

#Beatles-Fan-Gruppe
m15= Membership.create :group => g5, :userable => u10

#Bullshit Events
m16= Membership.create :group => g7, :userable => ur1
m17= Membership.create :group => g7, :userable => ur3

#Hogwards School of Rock
m18= Membership.create :group => g8, :userable => u10

puts 'fertig.'

# Instrumente

puts 'Instrumente werden zugewiesen...'

#Metallica
m1.instruments << i1
m1.instruments << i2

m2.instruments << i4

m3.instruments << i1

m4.instruments << i3

#Beatles
m5.instruments << i1
m5.instruments << i2
m5.instruments << i3

m6.instruments << i1
m6.instruments << i2

m7.instruments << i1
m7.instruments << i2

m8.instruments << i2
m8.instruments << i4

#Love Muffins
m9.instruments << i1
m9.instruments << i2

m10.instruments << i1
m10.instruments << i2

m11.instruments << i4

m12.instruments << i3

puts 'fertig.'
