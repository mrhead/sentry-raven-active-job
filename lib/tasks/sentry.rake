namespace :sentry do
  desc "Crash Sidekiq"
  task crash_sidekiq: :environment do
    user = User.create!(name: "John Doe")
    WelcomeUserJob.perform_later(user)
    user.destroy!
  end
end
