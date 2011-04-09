Sass::Plugin.options[:syntax] = :sass
Sass::Plugin.options[:template_location] = File.join(Rails.root, 'app', 'sass')
Sass::Plugin.options[:style] = Rails.env=="development" ? :expanded : :compressed
