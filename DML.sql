-- **************************
-- ********* Games **********
-- **************************

-- get all from Players to populate player table
SELECT * FROM Players;

-- get player from search
SELECT * FROM Players WHERE firstName = :firstName_from_search AND lastName = :lastName_from_search;

-- add a new player
INSERT INTO Players (email, firstName, lastName, gamerTag, employer) VALUES (:email, :firstName, :lastName, :gamerTag, :employer);

-- edit a player entry
UPDATE Players SET
                   email = :emailInput,
                   firstName = :firstNameInput,
                   firstName = :firstNameInput,
                   gamerTag = :gamerTagInput,
                   employer = :employerInput,
WHERE playerID = :idInput;

-- delete from Players by given id
DELETE FROM Players WHERE id = :playerID_selected_from_player_page;

-- **************************
-- ******* Publishers *******
-- **************************

-- get all from Games to populate game table
SELECT * FROM Games;

-- get all game from search
SELECT * FROM Games WHERE title = :title_from_search;

-- add a new game
INSERT INTO Games (title, genre, publisher) VALUES (:title, :genre, :publisher);

-- edit a game entry
UPDATE Games SET
                   title = :titleInput,
                   genre = :genreInput,
                   publisher = :publisherInput,
                   WHERE gameID = :idInput;

-- delete from Games by given id
DELETE FROM Games WHERE id = :gameID_selected_from_games_page;

-- **************************
-- ****** playersGames ******
-- **************************

-- get all from playersGames to populate intersection table
SELECT * FROM playersGames;

-- add relationship between player and game
INSERT INTO PlayersGames (playerID, gameID)
VALUES ((SELECT playerID from Players WHERE gamerTag=':gamerTag'), (SELECT gameID from Games WHERE title=':game'));

-- **************************
-- ******* Publishers *******
-- **************************


-- Select for using search functionality
SELECT * FROM Publishers WHERE
        publisherName = :publisherNameInput AND
        headquarters = :headquartersInput;

-- Displaying full publisher table
SELECT * FROM Publishers;

-- Edit publisher
UPDATE Publishers SET
                      publisherName = :publisherNameInput,
                      headquarters = :headquartersInput
WHERE publisherID = :idInput;

-- Add new publisher
INSERT INTO Publishers (publisherName, headquarters)
VALUES (':nameInput', ':headquartersInput');

-- Remove publisher
DELETE FROM Publishers
WHERE publisherID = :idInput;


-- **************************
-- ******** Platforms *******
-- **************************

-- Select for using search functionality
SELECT * FROM Platforms WHERE
        systemName = :systemNameInput AND
        manufacturer = :manufacturerInput AND
        launchYear = :launchYearInput AND
        platformID IN (SELECT platform FROM Games WHERE title IN :gameTitleInput);

-- Displaying full platform table
SELECT * FROM Platforms;

-- Edit platform
UPDATE Platforms SET
                     systemName = :systemNameInput,
                     manufacturer = :manufacturerInput,
                     launchYear = :launchYearInput
WHERE platformID = :idInput;

-- Add new platform
INSERT INTO Platforms (systemName, manufacturer, launchYear)
VALUES (':nameInput', ':manufacturerInput', ':yearInput');

-- Remove platform
DELETE FROM Platforms
WHERE platformID = :idInput;

-- Add new relationship between platform and games
INSERT INTO GamesPlatforms (gameID, platformID)
VALUES (':gameIdInput', ':platformIdInput');

-- Remove relationships between platform and games
DELETE FROM GamesPlatforms WHERE platformID = :platformIdInput