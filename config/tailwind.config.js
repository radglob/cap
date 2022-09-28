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
      backgroundImage: {
        'hero-pattern': "linear-gradient(to bottom, rgb(104,47,74,0.75), rgb(104,47,74,0)), url('/img/water-tower-hero-wide.jpg')"
      },
      backgroundPosition: {
        'mobile-offset': '60% 33%'
      },
      colors: {
        olive: '#354A18',
        cream: '#F9EBF3',
        'forest-green': {
          light: '#00A385',
          dark: '#00493A'
        }
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
