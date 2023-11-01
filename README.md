# MovieDB
Demo Movie database app

## Documentation

Full documentation available here: [Documentation](/docs)

## Overview

The MovieDB Demo App is a sample mobile application designed to showcase popular movies and provide detailed information about selected movies. This app allows users to explore a curated list of popular movies and learn more about their details.

## API Key

### File Provided

If you are provided with a `TMDB.json` file you will need to drag and drop it on the `API` set of the `Assets.xcassets` asset catalog. See image below.

![Drag and Drop API Key instructions](/resources/api-key-instructions.png)

### Sign up for key

Otherwise to use this app, you will need an API key from [The Movie Database](https://www.themoviedb.org/). Follow these steps to obtain your API key:

1. Visit the movie database's developer portal at [TMDB](https://developer.themoviedb.org/docs).
2. Sign up for a developer account or log in if you already have one.
3. Once logged in, create a new application to obtain an API key.
4. Copy the API key provided and keep it secure.
5. Create a file named TMDB.json with the following contents: 
```json
{
  "apiKey": "API Key goes here"
}
```
6. Follow the [TMDB.json Provided instructions](#file-provided)
