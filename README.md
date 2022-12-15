# Test Rails Seven with TypeScript and TailwindCSS

https://levelup.gitconnected.com/modern-development-with-rails-d9c6cf929ff6


* Ruby version

* System dependencies

## Configuration

  `app/assets/builds` in which the esbuild generated files will be stored

  `app/javascript/application.js` which will be the entrypoint for all my JavaScript code`

### `package.json`:

  - `build:js` - the original script `build` now is `build:js` so that its name reveals its purpose, to build only the JavaScript code.

  - `build` - still need the build script because it is called automatically by the `jsbundling-rails` gem to build JavaScript after asset precompilation.
  
  - `failure:js` - that will remove the esbuild generated files if there is a TypeScript compilation error.
  
  - `dev` - calls tsc-watch. During development this will continuously compile the *.ts files and will either invoke esbuild or not, depending on the result of the compilation.

### `Procfile.dev`:
    
  - `web: unset PORT && bin/rails server` - the command to start the Rails server
  
  - `js: yarn dev` - the new command to start tsc-watch

### `tsconfig.json`:

  - `compileOnSave` - we use ts-watch and don’t need this flag on.

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
