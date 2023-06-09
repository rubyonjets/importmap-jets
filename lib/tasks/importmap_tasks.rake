namespace :importmap do
  desc "Setup ImportmapJets for the app"
  task :install do
    location = File.expand_path("../../install/install.rb",  __dir__)
    system "jets app:template LOCATION=#{location}"
  end
end
