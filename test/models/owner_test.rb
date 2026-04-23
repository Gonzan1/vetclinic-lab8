require "test_helper"

class OwnerTest < ActiveSupport::TestCase
  test "should save valid owner" do
    owner = Owner.new(first_name: "Gonzalo", last_name: "Salinas", email: "gonzalo@uandes.cl", phone: "+56912345678")
    assert owner.save
  end

  test "should not save owner without email" do
    owner = Owner.new(first_name: "Gonzalo")
    assert_not owner.save, "Saved the owner without an email"
  end

  test "email should be unique" do
    # 1. Primero creamos y guardamos el dueño original
    Owner.create(first_name: "Original", last_name: "User", email: "gonzalo@uandes.cl", phone: "00000000")
    
    # 2. Intentamos crear un duplicado con el MISMO correo
    duplicate_owner = Owner.new(first_name: "Copia", last_name: "Barata", email: "gonzalo@uandes.cl", phone: "12345678")
    
    # 3. Verificamos que Rails lo considere inválido
    assert_not duplicate_owner.valid?
  end
end