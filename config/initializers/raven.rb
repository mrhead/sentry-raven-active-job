Raven.configure do |config|
  config.dsn = 'http://public:secret@example.com/project-id'

  config.async = lambda { |event|
    SentryJob.perform_later(event.to_hash)
  }
end
