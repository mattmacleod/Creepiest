# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :location do |f|
  f.association :account
  f.lat 1.0
  f.lng 1.0
  f.remote_id "1"
  f.location_time Time::utc(2010,01,01,00,00)
end