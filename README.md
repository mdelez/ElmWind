To run the project, make sure you have Elm installed first and then run:

`elm make src/Main.elm --output app.js`

`elm reactor`

Then visit [http://localhost:8000/index.html](http://localhost:8000/index.html) to view the project.

I usually keep one Terminal tab open with `elm reactor` running and then another tab to re-run the `make` command. That way I don't need to constantly kill the application every time I want to recompile the generated Javascript.

If changes to the TailwindCss are required (for example, if you added TailwindCss classes that you haven't used before) then you first need to recompile the javascript with the `make` command above and then rebuild the css with the command:

`npx tailwindcss -i ./input.css -o ./dist/output.css --watch`

Then when you run the project, you should see the styles being applied correctly.