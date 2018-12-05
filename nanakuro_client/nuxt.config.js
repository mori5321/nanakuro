const pkg = require('./package')
const path = require('path')
import colors from 'vuetify/es5/util/colors'

module.exports = {
  mode: 'spa',
  /*
  ** Headers of the page
  */
  head: {
    title: pkg.name,
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: pkg.description }
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }],
    link: [
      {
        rel: 'stylesheet',
        href: 'https://fonts.googleapis.com/earlyaccess/notosansjapanese.css'
      }
    ],
    script: [
      {
        src: "https://d.line-scdn.net/r/web/social-plugin/js/thirdparty/loader.min.js",
        async: "async",
        defer: "defer"
      }
    ]
  },

  router: {
    scrollBehavior(to, from, savedPosition) {
      return { x: 0, y: 0 }
    }
  },

  /*
  ** Customize the progress-bar color
  */
  loading: { color: '#fff' },

  /*
  ** Global CSS
  */


  /*
  ** Nuxt.js modules
  */
  modules: [
    // Doc: https://github.com/nuxt-community/axios-module#usage
    '@nuxtjs/axios',

    '@nuxtjs/vuetify',


    ['nuxt-sass-resources-loader',
      [
        '@/assets/styles/_variables.scss',
      ]
    ],
  ],

  vuetify: {
    theme: {
      primary: '#7EC2C2',
      secondary: '#9DDCDC',
      accent: '#E67A7A',
      error: '#E67A7A',
    }
  },

  /*
  ** Axios module configuration
  */
  axios: {
    // See https://github.com/nuxt-community/axios-module#options
  },

  /*
  ** Build configuration
  */
  build: {
    /*
    ** You can extend webpack config here
    */
    extend(config, ctx) {
      // Run ESLint on save
      if (ctx.isDev && ctx.isClient) {
        config.module.rules.push({
          enforce: 'pre',
          test: /\.(js|vue)$/,
          loader: 'eslint-loader',
          exclude: /(node_modules)/,
          options: {
            fix: true
          }
        })
      }
    }
  }
}
