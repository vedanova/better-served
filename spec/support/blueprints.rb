require 'machinist/active_record'

User.blueprint do
  username {'mikep'}
  first_name {'Mike'}
  last_name {'Mechanic'}
  email {"mike#{sn}@better-served.com"}
  password {'please'}
  password_confirmation {'please'}
  confirmed_at {Time.now}
  role {'owner'}
  organisation { Organisation.last || Organisation.make! }
end

User.blueprint(:app_admin) do
  admin { true }
  first_name {'James'}
  last_name {'Admin'}
  email {"admin#{sn}@better-served.com"}
  role {'owner'}
  organisation { Organisation.last || Organisation.make! }
end

Organisation.blueprint do
  name { 'Acme' }
end