module ImportmapJets
  class Reloader
    def initialize(app)
      @app = app
    end

    # experimental interface method: may change
    def reload!
      @app.config.importmap.paths.each { |path| @app.importmap.draw(path) }
    end
  end
end
