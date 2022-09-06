const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      backgroundImage: {
        'hero-pattern': "linear-gradient(to bottom, rgb(104,47,74,0.75), rgb(104,47,74,0)), url('/img/water-tower-hero-wide.jpg')"
      },
      colors: {
        'maroon': {
          dark: 'rgb(104,47,74,0.75)',
          transparent: 'rgb(104,47,74,0)'
        },
        'gold': '#fec600'
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
