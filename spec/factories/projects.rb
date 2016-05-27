FactoryGirl.define do
  factory :project do
    id 1
    name 'Home'
    description 'big phat house'
    after(:create) do |obj|
      obj.get_material_count
    end
  end
end
