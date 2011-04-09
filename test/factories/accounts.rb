# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :account do |f|
  f.account_type "twitter"
  f.name "matt_macleod"
  f.synced_at Time::utc(2010,01,01,00,00)
end