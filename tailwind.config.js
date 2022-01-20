const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    // './components/**/*.{html,js}',
    // './pages/**/*.{html,js}',
    './index.html',
    './app.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [],
}
