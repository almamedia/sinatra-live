Sinatra (live)
==============

Watches for changes in your Sinatra-app and reloads Puma daemon with the new app.

## Install

```
gem install sinatralive
```

## Usage

First, create a Livefile on your Sinatra-app -root.

```
$: sinatra-live init
Livefile created
```

Edit the Livefile to match your own settings.

```
---
folders:
  - lib
  - conf

puma:
  control: http://127.0.0.1:3001
  token: c68e108c4ae2755ab1e93bc3fc956845033ab8b0
```

Start sinatra-live.

```
$: sinatra-live
Watching for changes in:
	lib/
	config/
```
