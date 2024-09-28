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

INSERT INTO participant (name, email, event_id) VALUES
    ('Alice Johnson', 'alice.johnson@example.com', 1),
    ('Bob Smith', 'bob.smith@example.com', 2),
    ('Charlie Brown', 'charlie.brown@example.com', 3),
    ('Diana Prince', 'diana.prince@example.com', 1),
    ('Ethan Hunt', 'ethan.hunt@example.com', 5),
    ('Fiona Green', 'fiona.green@example.com', 2),
    ('George Clark', 'george.clark@example.com', 4),
    ('Hannah Baker', 'hannah.baker@example.com', 3),
    ('Ian Wright', 'ian.wright@example.com', 5),
    ('Julia Roberts', 'julia.roberts@example.com', 1),
    ('Kevin Spacey', 'kevin.spacey@example.com', 2),
    ('Laura Croft', 'laura.croft@example.com', 3),
    ('Mark Twain', 'mark.twain@example.com', 4),
    ('Nina Simone', 'nina.simone@example.com', 5),
    ('Oscar Wilde', 'oscar.wilde@example.com', 1),
    ('Paula Abdul', 'paula.abdul@example.com', 2),
    ('Quincy Jones', 'quincy.jones@example.com', 3),
    ('Rachel Green', 'rachel.green@example.com', 4),
    ('Sam Winchester', 'sam.winchester@example.com', 5),
    ('Tina Fey', 'tina.fey@example.com', 1),
    ('Uma Thurman', 'uma.thurman@example.com', 1),
    ('Vince Vega', 'vince.vega@example.com', 2),
    ('Walter White', 'walter.white@example.com', 3),
    ('Xena Warrior', 'xena.warrior@example.com', 4),
    ('Yoda Master', 'yoda.master@example.com', 5),
    ('Zara Larsson', 'zara.larsson@example.com', 1),
    ('Aaron Paul', 'aaron.paul@example.com', 2),
    ('Bella Hadid', 'bella.hadid@example.com', 3),
    ('Chris Evans', 'chris.evans@example.com', 4),
    ('Drew Barrymore', 'drew.barrymore@example.com', 5),
    ('Elon Musk', 'elon.musk@example.com', 1),
    ('Florence Welch', 'florence.welch@example.com', 2),
    ('Gordon Ramsay', 'gordon.ramsay@example.com', 3),
    ('Hilary Duff', 'hilary.duff@example.com', 4),
    ('Ian McKellen', 'ian.mckellen@example.com', 5),
    ('Jack Black', 'jack.black@example.com', 1),
    ('Kylie Jenner', 'kylie.jenner@example.com', 2),
    ('Liam Neeson', 'liam.neeson@example.com', 3),
    ('Megan Fox', 'megan.fox@example.com', 4),
    ('Nicolas Cage', 'nicolas.cage@example.com', 5);
