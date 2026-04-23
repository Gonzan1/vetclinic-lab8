# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Limpiando la base de datos..."
Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Vet.destroy_all
Owner.destroy_all

puts "Creando Dueños (Owners)..."
owner1 = Owner.create!(first_name: "Gonzalo", last_name: "Salinas", email: "gesalinas@miuandes.cl", phone: "+56912345678", address: "Mi Casa 123, Las Condes")
owner2 = Owner.create!(first_name: "Vicente", last_name: "Santolaya", email: "vasantolaya@miuandes.cl", phone: "+56987654321", address: "Warren Smith 99, Las Condes")
owner3 = Owner.create!(first_name: "Pedro", last_name: "Pascal", email: "pedro.pascal@miuandes.cl", phone: "+56911223344", address: "Brown Norte 19, Ñuñoa")

puts "Creando Mascotas (Pets)..."
pet1 = owner1.pets.create!(name: "Firulais", species: "dog", breed: "Quiltro", date_of_birth: "2020-05-10", weight: 15.5)
pet2 = owner1.pets.create!(name: "Michi", species: "cat", breed: "Siamese", date_of_birth: "2021-08-22", weight: 4.2)
pet3 = owner2.pets.create!(name: "Bugs", species: "rabbit", breed: "Holland Lop", date_of_birth: "2023-01-15", weight: 1.8)
pet4 = owner3.pets.create!(name: "Rex", species: "dog", breed: "German Shepherd", date_of_birth: "2019-11-05", weight: 30.0)
pet5 = owner3.pets.create!(name: "Garfield", species: "cat", breed: "Persian", date_of_birth: "2018-02-28", weight: 6.5)

puts "Creando Veterinarios (Vets)..."
vet1 = Vet.create!(first_name: "Dr. Genaro", last_name: "Soto", email: "Genarosoto.vet@clinic.cl", phone: "22334455", specialization: "General Practice")
vet2 = Vet.create!(first_name: "Dra. Fernanda", last_name: "Méndez", email: "fernandamendez.vet@clinic.cl", phone: "22998877", specialization: "Surgery")

puts "Creando Citas (Appointments)..."
# IMPORTANTE -> Status (0: scheduled, 1: in progress, 2: completed, 3: cancelled)
app1 = Appointment.create!(pet: pet1, vet: vet1, date: DateTime.now + 2.days, reason: "Annual checkup", status: "scheduled")
app2 = Appointment.create!(pet: pet2, vet: vet2, date: DateTime.now, reason: "Stomach ache", status: "in_progress")
app3 = Appointment.create!(pet: pet3, vet: vet1, date: DateTime.now - 1.week, reason: "Vaccination", status: "completed")
app4 = Appointment.create!(pet: pet4, vet: vet2, date: DateTime.now - 1.month, reason: "Knee surgery", status: "completed")
app5 = Appointment.create!(pet: pet5, vet: vet1, date: DateTime.now + 5.days, reason: "Flea treatment", status: "cancelled")

puts "Creando Tratamientos (Treatments)..."
Treatment.create!(appointment: app2, name: "Pain Relief", medication: "Paracetadog", dosage: "0.5mg", notes: "Administer with food", administered_at: DateTime.now)
Treatment.create!(appointment: app3, name: "Rabies Vaccine", medication: "Rabipet", dosage: "1 vial", notes: "Next dose in 1 year", administered_at: DateTime.now - 1.week)
Treatment.create!(appointment: app4, name: "Anesthesia", medication: "Anespetsia", dosage: "5mg", notes: "No complications during induction", administered_at: DateTime.now - 1.month)
Treatment.create!(appointment: app4, name: "Post-op Antibiotic", medication: "Amoxicillin", dosage: "250mg", notes: "To be given twice a day for 7 days", administered_at: DateTime.now - 1.month)
Treatment.create!(appointment: app2, name: "Hydration", medication: "Saline Solution", dosage: "100ml", notes: "IV drip", administered_at: DateTime.now)

puts "¡Datos creados exitosamente! 🎉"