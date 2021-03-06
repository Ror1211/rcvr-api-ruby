FactoryBot.define do
  factory :affiliate do
    name { Faker::Company.name }
    code { SecureRandom.hex(10) }
    logo_link { 'http://website.de' }
    logo { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'assets', 'railslove.png'), 'image/png') }
    stripe_price_id_monthly { SecureRandom.hex(20) }
  end
end
