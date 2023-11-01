# MovieDB
The MovieDB Demo App is a sample mobile application designed to showcase popular movies and provide detailed information about the selected movie. 

| Movie List                    | Movie Detail                    |
| ----------------------------- | ------------------------------- |
| ![Movie list screenshot](/resources/List-Screenshot.png) | ![Movie detail screenshot](/resources/Detail-Screenshot.png) |

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
6. Follow the [File Provided instructions](#file-provided)

## Dependencies

### [RestySwift](https://github.com/chrispflepsen/RestySwift)

RestySwift is a barebones protocol based package built on top of URLSession for JSON based REST API(s)

### [SwiftLint](https://github.com/realm/SwiftLint)

A tool to enforce Swift style and conventions

### [Kingfisher](https://github.com/onevcat/Kingfisher)

Kingfisher is a powerful, pure-Swift library for downloading and caching images from the web
