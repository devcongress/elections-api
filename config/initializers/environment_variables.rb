if Rails.env.development?
  ENV['ELECTIONS_DB'] ||= 'elections_db'
end
