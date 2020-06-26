# OPEN-API-Search
This application makes a request via HTTParty to the Bikewise API looking for incidents of bike theft in the Denver, CO area.
The JSON is recorded in its database in a thefts table and Re-served via a RESTful endpoint.

## Motivations
To practice 3rd party API integration and see if there are some cool 3rd party APIs that I've been missing out on.

## Build status
Deployed on Heroku
The base URI is [https://sleepy-taiga-39385.herokuapp.com](https://sleepy-taiga-39385.herokuapp.com)

## Tech/framework used
Ruby 2.5.1
Rails 6.0.3
Rspec 3.9.0
HTTParty

## Features
This API re-serves the reported Denver, CO bike thefts via /api/v1/thefts/ and can be filtered with the following parameters:
* title
* description
* address

## Tests

## How to use?
GET     thefts#index    /api/v1/thefts
GET     thefts#show     /api/v1/thefts/:id
POST    thefts#create   /api/v1/thefts
PUT     thefts#update   /api/v1/thefts/:id
DESTROY thefts#destroy  /api/v1/thefts/:id

Searches are performed by hitting the thefts#index (/api/v1/thefts/?) and adding the appropriate querys "title=[SEARCH QUERY]" or  "description=[SEARCH QUERY]"

For Example:

`GET /api/v1/thefts/?title=Trek&description=locked`

To create a new theft record you MUST pass params in this format:

`
{
  theft: {
    title: [Required Field]"Title the theft report",
    description: [Required Field]"Describe the theft",
    address: "can be as vague as a zipcode, but often city, state, zip",
    source_url: "This is a url to your bike index theft record",
    image_url: "This is a url to images of your stolen bike"
  }
}
`

## To-do
* Add pagination for JSON served

## API Reference
[Bikewise](www.bikewise.org)

## License
MIT © [Sean Kung](www.seankung.us)
