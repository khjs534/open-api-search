# OPEN-API-Search
This application makes a request via HTTParty to the Bikewise API looking for incidents of bike theft in the Denver, CO area.
The JSON is recorded in its database in a thefts table and Re-served via a RESTful endpoint.

## Motivations
To practice 3rd party API integration and see if there are some cool 3rd party APIs that I've been missing out on.

## Build status
Currently not deployed, will be deployed on Heroku

## Tech/framework used
Ruby 2.5.1
Rails 6.0.3
Rspec 3.9.0
HTTParty

## Features
This API re-serves the reported Denver, CO bike thefts via v1/thefts/ and can be filtered with the following parameters:
* id
* title
* address
Note that Address can sometimes be as vague as "Denver, CO" lacking an area code.

## Tests

## How to use?

## API Reference
[Bikewise](www.bikewise.org)

## License
MIT © [Sean Kung](www.seankung.us)
