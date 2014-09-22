if Rails.env.production?
  require 'uri'
  require 'dragonfly'
  begin
    require 'rack/cache'
  rescue LoadError => e
    puts "Couldn't find rack-cache - make sure you have it in your Gemfile:"
    puts "  gem 'rack-cache', :require => 'rack/cache'"
    puts " or configure dragonfly manually instead of using 'dragonfly/rails/images'"
    raise e
  end

  ### The dragonfly app ###
  app = Dragonfly[:images]
  app.configure_with(:rails)
  app.configure_with(:imagemagick)

  app.datastore = Dragonfly::DataStorage::S3DataStore.new

  app.datastore.configure do |c|
    c.bucket_name = 'national-youth-agency'
    c.access_key_id = 'AKIAIA2E33W7DETOW5IQ'
    c.secret_access_key = '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'
    c.url_scheme = 'https'
  end

  ### Extend active record ###
  if defined?(ActiveRecord::Base)
    app.define_macro(ActiveRecord::Base, :image_accessor)
    app.define_macro(ActiveRecord::Base, :file_accessor)

    class ActiveRecord::Base
      def default_image
        return nil if !File.exists?(default_image_path)
        Dragonfly::App[:images].fetch_file(default_image_path)
      end

      private
      def default_image_path
        absolute_path = Dir.glob("#{Rails.root}/public/dragonfly/defaults/#{self.class.to_s.underscore}.*").first.to_s
      end
    end
  end

  ### Remove middleware inserted in ym_core

  #Rails.application.middleware.delete(Rack::Cache)
  Rails.application.middleware.delete(Dragonfly::Middleware)


  ### Insert the middleware ###
  rack_cache_already_inserted = Rails.application.config.action_controller.perform_caching && Rails.application.config.action_dispatch.rack_cache

  Rails.application.middleware.insert 0, Rack::Cache, {
    :verbose     => true,
    :metastore   => URI.encode("file:#{Rails.root}/tmp/dragonfly/cache/meta"), # URI encoded in case of spaces
    :entitystore => URI.encode("file:#{Rails.root}/tmp/dragonfly/cache/body")
  } unless rack_cache_already_inserted

  Rails.application.middleware.insert_after Rack::Cache, Dragonfly::Middleware, :images
end
