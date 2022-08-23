# Jungle Devs - Flutter Challenge 003 (Api integration)
### Developed by Jonny Eduardo Banach

## Description

### Challenge Goal:
Consolidate knowledge about Rest API operations.

## Design

- [Figma](https://www.figma.com/file/sTFyHUdcKqT6OVloVUji0N/Android-%E2%80%93-Challenge-2?node-id=0%3A1)

### Running the application:

1. Clone the repository using GitHub.
2. Connect a smartphone to the computador or start an ADV (Android Virtual Device).
3. In the terminal, go to the project's root folder and type the commands:  `flutter build apk` and `flutter install`.
4. Open the application.

### Setup instructions for Local DB

To set up the JSON Server, follow the steps below:
1. Install [Node.js](https://nodejs.org/en/) on your machine if you haven't. You can run `node -v` or `npm -v` in the command line to check if it's already installed.
1. Open the terminal
1. Run: `npm install -g json-server`
1. Download the [db.json](https://github.com/JungleDevs/flutter-challenge-003-API/blob/master/db.json) file
1. Change directory to the one where the JSON file is located
1. Run: `json-server --watch db.json`
1. The command should have created a home endpoint: http://localhost:3000