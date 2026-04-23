require "test_helper"

class PetTest < ActiveSupport::TestCase
  test "should not save pet with future birth date" do
    owner = Owner.first
    pet = Pet.new(name: "Rex", species: "dog", date_of_birth: Date.today + 1.year, weight: 10, owner: owner)
    assert_not pet.save, "Saved pet with future birth date"
  end

  test "should not save pet with invalid species" do
    owner = Owner.first
    pet = Pet.new(name: "Rex", species: "dragon", weight: 10, owner: owner)
    assert_not pet.save, "Saved pet with invalid species"
  end
end