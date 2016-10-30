# Name : Time_Traveler
# description : provide trip services.

Time_Traveler is a gem that specializes in providing trip services.

## Installation

If you are working on a project, add this to your Gemfile: `gem 'Time_Traveler'`

For ad hoc installation from command line:

```$ gem install Time_Traveler```

## Setup Time_Traveler Credentials

Please setup your aribnb & google developer credentials by creating an app profile on aribnb & google Developer: http://airbnbapi.org/ & https://console.developers.google.com/ – you should get "client ID".

## Usage

Require Time_Traveler gem in your code: `require 'Time_Traveler'`

Supply your Time_Traveler credentials to our library in one of two ways:
- Setup environment variables: `ENV['AIRBNB_API']` and `ENV['GOOGLE_API']`

