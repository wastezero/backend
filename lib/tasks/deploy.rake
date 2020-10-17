# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
namespace :deploy do
  desc 'Backend deploy'
  task :staging do
    deploy(staging_app_name)
    tag_staging_deployment
  end

  task :last_staging_release do
    last_release(staging_app_name)
  end

  task :last_production_release do
    last_release(production_app_name)
  end

  task :staging_releases do
    system releases(staging_app_name)
  end

  task :production_releases do
    system releases(production_app_name)
  end

  namespace :rollback do
    desc 'Rollback staging deploy'
    task :staging do
      rollback(staging_app_name)
    end

    desc 'Rollback production deploy'
    task :production do
      rollback(production_app_name)
    end
  end

  private

  def branch
    ENV['BRANCH'] || current_branch
  end

  def staging_app_name
    ENV['HEROKU_STAGING_APP']
  end

  def production_app_name
    ENV['HEROKU_PRODUCTION_APP']
  end

  def current_branch
    `git rev-parse --abbrev-ref HEAD`.strip
  end

  def deploy(app)
    puts "Deploying branch #{branch} to #{app}"
    system "git push -f #{app} #{branch}:master"
    last_release(app)
  end

  def tag_staging_deployment
    heroku_tag = last_release_tag(staging_app_name) + '-staging'
    `git tag -d staging-latest #{heroku_tag} 2> /dev/null`
    `git tag #{heroku_tag} #{branch}`
    `git tag staging-latest #{branch}`
    `git push -f origin #{heroku_tag}`
    `git push -f origin staging-latest`
  end

  def tag_production_deployment
    heroku_tag = last_release_tag(production_app_name)
    `git tag #{heroku_tag} #{branch}`
    `git push -f origin #{heroku_tag}`
  end

  def rollback(app)
    system "heroku rollback -a #{app}"
    system "heroku run rake db:rollback -a #{app}"
    last_release(app)
  end

  def last_release(app)
    grep_cmd = ' | grep -om 1 "[0-9a-f]\{7\}" | xargs git log -1 --oneline'
    system releases(app) + grep_cmd
  end

  def last_release_tag(app)
    `#{releases(app)} | sed -n 2p | awk '{print $1}'`.strip!
  end

  def releases(app)
    "heroku releases -a #{app}"
  end

  def git_user
    `git config user.email`.split('@').first
  end

  def last_local_commit
    `git log --oneline -n 1 --no-color`.strip.gsub!('\'', '')
  end
end
# rubocop:enable Metrics/BlockLength
