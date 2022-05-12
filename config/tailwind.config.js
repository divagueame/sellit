const defaultTheme = require('tailwindcss/defaultTheme')
// const { fontFamily } = require('tailwindcss/defaultTheme')

// font-family: 'Bebas Neue', cursive;
// font-family: 'Radio Canada', sans-serif;
module.exports = {
  darkMode: 'class',
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Bebas Neue','Radio Canada', ...defaultTheme.fontFamily.sans],
        // ...fontFamily,
        // 'sans': ['Canada', ui-sans-serif, 'system-ui', ...],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
