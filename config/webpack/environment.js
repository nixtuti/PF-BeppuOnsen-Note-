const { environment } = require('@rails/webpacker')

module.exports = environment

//bootstrap導入 jQueryを管理下に追加?
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)

