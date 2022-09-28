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
        serif: ['Garamond', 'Georgia', 'ui-serif'],
      },
      backgroundPosition: {
        'mobile-offset': '60% 33%'
      },
      colors: {
        olive: '#354A18',
        cream: '#F9EBF3',
        'forest-green': {
          50: '#00A385',
          100: '#0f8f75',
          200: '#157c66',
          300: '#186a57',
          400: '#195849',
          500: '#18463b',
          600: '#16362d',
          700: '#122620',
          800: '#0c1714',
          900: '#000000'
        },
        red: '#a3001e',
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
