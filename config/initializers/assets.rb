# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( bg_animation.js click_scroll.js grid_animation.js humbrager_menu.js scroll_animation.js sticky_header.js TweenMax.min.js scrollmagic/uncompressed/ScrollMagic.js scrollmagic/uncompressed/plugins/animation.gsap.js scrollmagic/uncompressed/plugins/animation.velocity.js scrollmagic/uncompressed/plugins/debug.addIndicators.js )
