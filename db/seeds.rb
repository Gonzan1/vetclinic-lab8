# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning the database..."
Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Vet.destroy_all
Owner.destroy_all

puts "Creating Owners..."
owner1 = Owner.create!(first_name: "Gonzalo", last_name: "Salinas", email: "gesalinas@miuandes.cl", phone: "+56912345678", address: "Mi Casa 123, Las Condes")
owner2 = Owner.create!(first_name: "Vicente", last_name: "Santolaya", email: "vasantolaya@miuandes.cl", phone: "+56987654321", address: "Warren Smith 99, Las Condes")
owner3 = Owner.create!(first_name: "Pedro", last_name: "Pascal", email: "pedro.pascal@miuandes.cl", phone: "+56911223344", address: "Brown Norte 19, Ñuñoa")

puts "Creating Pets..."
pet1 = owner1.pets.create!(name: "Firulais", species: "dog", breed: "Quiltro", date_of_birth: "2020-05-10", weight: 15.5)
pet2 = owner1.pets.create!(name: "Michi", species: "cat", breed: "Siamese", date_of_birth: "2021-08-22", weight: 4.2)
pet3 = owner2.pets.create!(name: "Bugs", species: "rabbit", breed: "Holland Lop", date_of_birth: "2023-01-15", weight: 1.8)
pet4 = owner3.pets.create!(name: "Rex", species: "dog", breed: "German Shepherd", date_of_birth: "2019-11-05", weight: 30.0)
pet5 = owner3.pets.create!(name: "Garfield", species: "cat", breed: "Persian", date_of_birth: "2018-02-28", weight: 6.5)

puts "Creating Vets..."
vet1 = Vet.create!(first_name: "Dr. Genaro", last_name: "Soto", email: "Genarosoto.vet@clinic.cl", phone: "22334455", specialization: "General Practice")
vet2 = Vet.create!(first_name: "Dra. Fernanda", last_name: "Méndez", email: "fernandamendez.vet@clinic.cl", phone: "22998877", specialization: "Surgery")

puts "Creating Appointments..."
# IMPORTANTE -> Status (0: scheduled, 1: in progress, 2: completed, 3: cancelled)
app1 = Appointment.create!(pet: pet1, vet: vet1, date: DateTime.now + 2.days, reason: "Annual checkup", status: "scheduled")
app2 = Appointment.create!(pet: pet2, vet: vet2, date: DateTime.now, reason: "Stomach ache", status: "in_progress")
# Citas históricas (saltamos la validación porque ya ocurrieron)
app3 = Appointment.new(pet: pet3, vet: vet1, date: DateTime.now - 1.week, reason: "Vaccination", status: "completed")
app3.save(validate: false)

app4 = Appointment.new(pet: pet4, vet: vet2, date: DateTime.now - 1.month, reason: "Knee surgery", status: "completed")
app4.save(validate: false)
app5 = Appointment.create!(pet: pet5, vet: vet1, date: DateTime.now + 5.days, reason: "Flea treatment", status: "cancelled")

puts "Creating enriched Treatments..."
# Treatment 1 with basic HTML (bold and lists)
Treatment.create!(
  appointment: app2, 
  name: "Pain Relief", 
  medication: "Paracetadog", 
  dosage: "0.5mg", 
  administered_at: DateTime.now,
  clinical_notes: "<div><strong>Important instructions:</strong><ul><li>Always administer with food.</li><li>Monitor for lethargy.</li></ul></div>"
)

# Treatment 2 with another style (headings and paragraphs)
Treatment.create!(
  appointment: app3, 
  name: "Rabies Vaccine", 
  medication: "Rabipet", 
  dosage: "1 vial", 
  administered_at: DateTime.now - 1.week,
  clinical_notes: "<div><h1>Successful Annual Vaccination</h1><p>The patient reacted well to the dose. <strong>Next dose in exactly 1 year.</strong></p></div>"
)

# Treatment 3 with emphasis
Treatment.create!(
  appointment: app4, 
  name: "Post-op Antibiotic", 
  medication: "Amoxicillin", 
  dosage: "250mg", 
  administered_at: DateTime.now - 1.month,
  clinical_notes: "<div><p>Administer twice a day for 7 days. <em>Do not interrupt the treatment.</em></p></div>"
)


firulais = Pet.find_by(name: "Firulais")

if firulais
  ruta_perro = Rails.root.join('db', 'seeds', 'pets', 'perro.webp')
  
  if File.exist?(ruta_perro)
    firulais.photo.attach(
      io: File.open(ruta_perro),
      filename: 'perro.webp',
      content_type: 'image/webp'
    )
    
    # El signo de exclamación fuerza a Rails a mostrarnos si la validación lo rechaza
    firulais.save! 
    puts "Dog image loaded!"
  else
    puts "Alert: File not found #{ruta_perro}"
  end
end

  michi = Pet.find_by(name: "Michi")
  
  if michi
    foto_gato = File.open(Rails.root.join('db', 'seeds', 'pets', 'gato.jpg'))
    
    michi.photo.attach(
      io: foto_gato,
      filename: 'gato.jpg',
      content_type: 'image/jpeg'
    )
    
    puts "Cat image loaded!"
  end


puts "¡Files loaded! 🎉"