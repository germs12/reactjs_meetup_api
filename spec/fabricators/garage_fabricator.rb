Fabricator(:garage) do
  location { Faker::Pokemon.location }
  daily_price { rand(100) }
end
