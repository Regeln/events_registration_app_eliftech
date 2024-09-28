-- psql -U databaseOwner -d databaseName -f path/to/script

DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;

CREATE TABLE event (
    id serial PRIMARY KEY,
    title varchar(50) NOT NULL,
    description varchar(100) NOT NULL DEFAULT '',
    event_date date NOT NULL,
    organiser varchar(30) NOT NULL
);

CREATE TABLE participant (
    id serial PRIMARY KEY,
    name varchar(30) NOT NULL,
    email varchar(50) NOT NULL,
    birth_date date NOT NULL,
    heard_from varchar(30) check (heard_from in ('social-media', 'friends', 'found-myself')),
    event_id integer REFERENCES event(id)
);

INSERT INTO event (title, description, event_date, organiser) VALUES
    ('Game Development Meetup', 'Learn about game development trends', '2024-09-15', 'Jane Doe'),
    ('Art of Animation Workshop', 'A workshop on 3D animation techniques', '2024-09-20', 'Animation Guild'),
    ('Retro Gaming Expo', 'Exhibition of classic and retro video games', '2024-09-25', 'Retro Lovers Club'),
    ('AI in Gaming', 'Talk on the impact of AI in modern gaming', '2024-09-30', 'Tech Innovators'),
    ('Board Game Night', 'Play and enjoy various board games', '2024-10-05', 'Fun Times'),
    ('VR Gaming Showcase', 'Showcasing the latest in VR gaming', '2024-10-10', 'Virtual Reality Hub'),
    ('Indie Games Festival', 'Celebration of indie game developers', '2024-10-15', 'Indie Dev Group'),
    ('Cosplay Contest', 'Cosplay contest with prizes for the best costumes', '2024-10-20', 'Cosplay Masters'),
    ('Game Art Exhibit', 'Exhibit showcasing art from popular games', '2024-10-25', 'Artistic Gamers'),
    ('Esports Championship', 'Competitive gaming tournament', '2024-10-30', 'Esports Federation'),
    ('Tabletop RPG Session', 'Role-playing game event with experienced GMs', '2024-11-05', 'RPG Enthusiasts'),
    ('Mobile Gaming Hackathon', 'Develop mobile games in 48 hours', '2024-11-10', 'Hackathon Group'),
    ('Sound Design in Games', 'Workshop on sound design for games', '2024-11-15', 'Sound Artists'),
    ('Puzzle Game Jam', 'Create a puzzle game within 24 hours', '2024-11-20', 'Puzzle Developers'),
    ('History of Gaming Panel', 'Discussion on the history of video games', '2024-11-25', 'Game Historians'),
    ('Game Music Concert', 'Live concert featuring game soundtracks', '2024-12-01', 'Music Gamers'),
    ('Speedrun Marathon', 'Marathon of game speedruns', '2024-12-05', 'Speedrunners United'),
    ('Storytelling in Games', 'Talk on storytelling techniques in games', '2024-12-10', 'Narrative Designers'),
    ('Game Industry Networking', 'Networking event for game industry professionals', '2024-12-15', 'Industry Pros'),
    ('Gaming Charity Stream', 'Live-streamed charity event featuring games', '2024-12-20', 'Charity Gamers');

INSERT INTO participant (name, email, birth_date, heard_from, event_id) VALUES
    ('Alice Johnson', 'alice.johnson@example.com', '1995-05-15', 'social-media', 1),
    ('Bob Smith', 'bob.smith@example.com', '1988-07-23', 'friends', 2),
    ('Charlie Brown', 'charlie.brown@example.com', '1990-01-10', 'found-myself', 3),
    ('Diana Prince', 'diana.prince@example.com', '1992-12-04', 'social-media', 4),
    ('Ethan Hunt', 'ethan.hunt@example.com', '1985-09-12', 'friends', 5),
    ('Fiona Gallagher', 'fiona.gallagher@example.com', '1994-03-30', 'found-myself', 1),
    ('George Lucas', 'george.lucas@example.com', '1977-08-14', 'social-media', 2),
    ('Hannah Baker', 'hannah.baker@example.com', '1997-11-20', 'friends', 3),
    ('Ian Malcolm', 'ian.malcolm@example.com', '1980-06-15', 'found-myself', 4),
    ('Julia Roberts', 'julia.roberts@example.com', '1982-02-27', 'social-media', 5),
    ('Kevin Hart', 'kevin.hart@example.com', '1980-07-06', 'friends', 1),
    ('Laura Croft', 'laura.croft@example.com', '1991-04-09', 'found-myself', 2),
    ('Mike Wazowski', 'mike.wazowski@example.com', '1986-03-22', 'social-media', 3),
    ('Nina Williams', 'nina.williams@example.com', '1993-10-30', 'friends', 4),
    ('Oscar Isaac', 'oscar.isaac@example.com', '1984-01-05', 'found-myself', 5),
    ('Paul Atreides', 'paul.atreides@example.com', '1996-09-22', 'social-media', 1),
    ('Quinn Fabray', 'quinn.fabray@example.com', '1995-03-11', 'friends', 2),
    ('Rachel Green', 'rachel.green@example.com', '1989-12-01', 'found-myself', 3),
    ('Steve Rogers', 'steve.rogers@example.com', '1981-07-04', 'social-media', 4),
    ('Tina Fey', 'tina.fey@example.com', '1970-05-18', 'friends', 5),
    ('Uma Thurman', 'uma.thurman@example.com', '1970-04-29', 'found-myself', 1),
    ('Vince Vega', 'vince.vega@example.com', '1971-10-15', 'social-media', 2),
    ('Walter White', 'walter.white@example.com', '1959-09-07', 'friends', 3),
    ('Xena Warrior', 'xena.warrior@example.com', '1975-02-12', 'found-myself', 4),
    ('Yoda Master', 'yoda.master@example.com', '900-01-01', 'social-media', 5),
    ('Zara Larsson', 'zara.larsson@example.com', '1997-12-16', 'friends', 1),
    ('Aaron Paul', 'aaron.paul@example.com', '1979-08-27', 'found-myself', 2),
    ('Bella Hadid', 'bella.hadid@example.com', '1996-10-09', 'social-media', 3),
    ('Chris Evans', 'chris.evans@example.com', '1981-06-13', 'friends', 4),
    ('Drew Barrymore', 'drew.barrymore@example.com', '1975-02-22', 'found-myself', 5),
    ('Elon Musk', 'elon.musk@example.com', '1971-06-28', 'social-media', 1),
    ('Florence Welch', 'florence.welch@example.com', '1986-08-28', 'friends', 2),
    ('Gordon Ramsay', 'gordon.ramsay@example.com', '1966-11-08', 'found-myself', 3),
    ('Hilary Duff', 'hilary.duff@example.com', '1987-09-28', 'social-media', 4),
    ('Ian McKellen', 'ian.mckellen@example.com', '1939-05-25', 'friends', 5),
    ('Jack Black', 'jack.black@example.com', '1969-08-28', 'found-myself', 1),
    ('Kylie Jenner', 'kylie.jenner@example.com', '1997-08-10', 'social-media', 2),
    ('Liam Neeson', 'liam.neeson@example.com', '1952-06-07', 'friends', 3),
    ('Megan Fox', 'megan.fox@example.com', '1986-05-16', 'found-myself', 4),
    ('Nicolas Cage', 'nicolas.cage@example.com', '1964-01-07', 'social-media', 5),
    ('Olivia Wilde', 'olivia.wilde@example.com', '1984-03-10', 'friends', 1),
    ('Peter Parker', 'peter.parker@example.com', '1993-10-29', 'found-myself', 2),
    ('Quentin Tarantino', 'quentin.tarantino@example.com', '1963-03-27', 'social-media', 3),
    ('Rihanna', 'rihanna@example.com', '1988-02-20', 'friends', 4),
    ('Samuel L. Jackson', 'samuel.jackson@example.com', '1948-12-21', 'found-myself', 5),
    ('Tobey Maguire', 'tobey.maguire@example.com', '1975-06-27', 'social-media', 1),
    ('Uma Thurman', 'uma.thurman@example.com', '1970-04-29', 'friends', 2),
    ('Vin Diesel', 'vin.diesel@example.com', '1967-07-18', 'found-myself', 3),
    ('Will Smith', 'will.smith@example.com', '1968-09-25', 'social-media', 4),
    ('Xander Cage', 'xander.cage@example.com', '1977-10-16', 'friends', 5);
