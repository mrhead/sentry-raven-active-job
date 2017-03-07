# Kill Sidekiq with Sentry Raven + ActiveJob

Example app for: https://github.com/getsentry/raven-ruby/issues/642

## Steps to reproduce:

```
git clone git@github.com:mrhead/sentry-raven-active-job.git
cd sentry-raven-active-job
./bin/setup
bundle exec rake sentry:crash_sidekiq
bundle exec sidekiq
```

## Notes

```ruby
# lib/tasks/sentry.rake
namespace :sentry do
  desc "Crash Sidekiq"
  task crash_sidekiq: :environment do
    user = User.create!(name: "John Doe")
    WelcomeUserJob.perform_later(user)
    user.destroy!
  end
end
```
