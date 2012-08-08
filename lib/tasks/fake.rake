namespace :fake do
  desc 'Fake some data'
  task all: :environment do
    puts "Starting to fake some data"
    Company.destroy_all
    Address.destroy_all
    Inspection.destroy_all

    10.times do |i|
      Company.create({
        name:    Faker::Company.name,
        number:  i,
        slogan:  Faker::Company.catch_phrase
      })
      putc '.'
    end

    puts ""
    puts "#{Company.count} Companies"

    10.times do |i|
      addr = Address.create({
        city:      Faker::Address.city,
        state:     Faker::Address.us_state,
        zip_code:  Faker::Address.zip_code
      })
      addr.company = Company.where(number:i).first
      addr.save
      putc '.'
    end

    puts ""
    puts "#{Address.count} Addresses"


    10.times do |i|
      ins = Inspection.create({
        name:    Faker::Company.name,
        number:  i,
        company_id: Company.all.sample.id
      })
      putc '.'
    end

    puts ""
    puts "#{Inspection.count} Inspections"
  end
end
