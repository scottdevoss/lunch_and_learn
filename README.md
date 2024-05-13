# Lunch and Learn
This app will allow users to search for learning resources and recipes by country, mark recipes as “favorite”, and learn more about a particular country.

## Learning Goals

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Implement Basic Authentication
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## Getting Started

1. Clone this repository
 - git clone git@github.com:scottdevoss/lunch_and_learn.git
 - 'bundle install'

 2. Get API Keys from these websites:

 - https://developer.edamam.com/edamam-recipe-api
 - https://developers.google.com/youtube/v3/getting-started

 ## Happy Path Endpoint User

 1. Get Recipes For A Particular Country
  - GET /api/v1/recipes?country=thailand


 2. Get Learning Resources for a Particular Country
  - GET /api/v1/learning_resources?country=laos


 3. User Registration
  - POST /api/v1/users


 4. Log In User
  - POST /api/v1/sessions


 5. Add Favorites
  - POST /api/v1/favorites
  

 6. Get a User's Favorites
  - POST /api/v1/favorites





