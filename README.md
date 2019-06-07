# Directus 7 - Development Environment for extensions with Docker

## Setup the basics

1. Clone this repo: `git clone https://github.com/eldarc/directus-extensions-development`
1. Clone Directus API: `git clone https://github.com/directus/api`
1. Clone Directus APP: `git clone https://github.com/directus/app`
1. Make sure you have `Docker` and `docker-compose` installed.

## Configure API and APP
1. Modify `config/api.php` file if needed.
1. Modify `directus-extensions-api` environment in `docker-compose.yml`.
1. Copy `app/public/config_example.js` to `app/public/config.js`, and adjust it as needed. Example config for the `api` property:
```
api: {
  "http://localhost:9000/_/": "API"
}
```

## Build and run the APP
1. cd to `app`
1. Run `npm install`
1. Run `npm run build`
1. Install http-server `npm install -g http-server`
1. cd to `app/dist`
1. Run `http-server`

## Build and run the API
1. Run `make services-start`
1. Run `make api-shell`
1. Run (inside container shell): `composer install`

## Install extensions toolkit
- `npm install -g @directus/extension-toolkit`

## Developing a custom interface
1. cd to `extensions/interface`
1. Run `directus-extensions create interface <interface-name>`
1. cd to `<interface-name>`
1. Run `npm run dev` to watch changes while developing.
1. Run `npm run build` to build dist files. Copy `dist` folder to `api/public/extensions/custom/interface/<interface-name>` to used it in Directus.
1. Add `build-to-api` script:
```
"scripts": {
    ...,
    "build-to-api": "directus-extensions build && rm -Rf ../../../api/public/extensions/custom/interfaces/<interface-name> && cp -Rf ./dist ../../../api/public/extensions/custom/interfaces/<interface-name>"
},
```
Run `npm run build-to-api` to build and copy to the API source.

## Watching interface source files and using it inside the API without manually copying dist files
1. Follow the steps to create a new interface.
1. Modify the `dev` script: `"dev": "directus-extensions watch ./src ../../../api/public/extensions/custom/interfaces/<interface-name>"`

## Notes
- Logs are streamed to the `logs` directory which is not added to version control.
- `Makefile` contains additional scripts and usage examples.
