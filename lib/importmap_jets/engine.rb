Jets::Application.send(:attr_accessor, :importmap)

module ImportmapJets
  # class Turbine < ::Jets::Turbine
  class Engine < ::Jets::Engine
    config.importmap = ActiveSupport::OrderedOptions.new
    config.importmap.paths = []
    config.importmap.sweep_cache = Jets.env.development? || Jets.env.test?
    config.importmap.cache_sweepers = []
    config.importmap.rescuable_asset_errors = []

    config.autoload_once_paths = %W( #{root}/app/helpers )

    initializer "importmap" do |app|
      app.importmap = Importmap::Map.new
      config.importmap.paths << app.root.join("config/importmap.rb")
      config.importmap.paths.each { |path| app.importmap.draw(path) }
    end

    initializer "importmap.reloader" do |app|
      app.reloaders << ImportmapJets::Reloader.new(app)
    end

    initializer "importmap.assets" do |app|
      if app.config.respond_to?(:assets) && app.config.assets.paths.present?
        app.config.assets.paths << Jets.root.join("app/javascript")
        app.config.assets.paths << Jets.root.join("vendor/javascript")

        # app/assets/javascripts/es-module-shims.js
        app.config.assets.precompile += %w( es-module-shims.js es-module-shims.min.js es-module-shims.js.map )
        javascripts = paths['app/assets'].absolute_current + "/javascripts"
        app.config.assets.paths << javascripts
      end
    end
  end
end
