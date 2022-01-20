To run the project, make sure you have Elm installed first and then run:

`elm make src/Main.elm --output app.js`

`elm reactor`

The visit [http://localhost:8000/index.html](http://localhost:8000/index.html) to view the project.

If changes to the TailwindCss are required (for example, if you added TailwindCss classes that you haven't used before) then you first need to recompile the javascript with the `make` command above and then rebuild the css with the command:

`npx tailwindcss -i ./input.css -o ./dist/output.css --watch`

Then when you run the project, you should see the styles being applied correctly.