-- テーブル: channels
INSERT INTO channels (channel_id, channel_name) VALUES
(1, 'Channel One'),
(2, 'Channel Two'),
(3, 'Channel Three'),
(4, 'Channel Four'),
(5, 'Channel Five'),
(6, 'Channel Six'),
(7, 'Channel Seven'),
(8, 'Channel Eight'),
(9, 'Channel Nine'),
(10, 'Channel Ten'),
(11, 'Channel Eleven'),
(12, 'Channel Twelve');

-- テーブル: genres
INSERT INTO genres (genre_id, genre_name) VALUES
(1, 'Drama'),
(2, 'Comedy'),
(3, 'Action'),
(4, 'Sci-Fi'),
(5, 'Fantasy'),
(6, 'Horror'),
(7, 'Thriller'),
(8, 'Romance'),
(9, 'Documentary'),
(10, 'Animation');

-- テーブル: programs
INSERT INTO programs (program_id, program_name, program_description) VALUES
(1, 'Program One', 'Description of Program One'),
(2, 'Program Two', 'Description of Program Two'),
(3, 'Program Three', 'Description of Program Three'),
(4, 'Program Four', 'Description of Program Four'),
(5, 'Program Five', 'Description of Program Five'),
(6, 'Program Six', 'Description of Program Six'),
(7, 'Program Seven', 'Description of Program Seven'),
(8, 'Program Eight', 'Description of Program Eight'),
(9, 'Program Nine', 'Description of Program Nine'),
(10, 'Program Ten', 'Description of Program Ten');

-- テーブル: seasons
INSERT INTO seasons (season_id, program_id, season_number) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 1, 2),
(12, 2, 2),
(13, 3, 2),
(14, 4, 2),
(15, 5, 2),
(16, 6, 2),
(17, 7, 2),
(18, 8, 2),
(19, 9, 2),
(20, 10, 2);

-- テーブル: episodes
INSERT INTO episodes (episode_id, season_id, episode_number, episode_title, episode_description, episode_length_seconds, episode_release_date) VALUES
(1, 1, 1, 'The Beginning', 'Introduction to the series', 3600, CURDATE()),
(2, 1, 2, 'New Beginnings', 'The adventure continues', 3600, CURDATE()),
(3, 2, 1, 'The Journey Starts', 'First steps into adventure', 3600, CURDATE()),
(4, 2, 2, 'Crossroads', 'Important decisions are made', 3600, CURDATE()),
(5, 3, 1, 'Mystery Unfolds', 'Unraveling the secrets', 3600, CURDATE()),
(6, 3, 2, 'Hidden Clues', 'Discovering hidden clues', 3600, CURDATE()),
(7, 4, 1, 'Twists and Turns', 'Unexpected developments', 3600, CURDATE()),
(8, 4, 2, 'Betrayal', 'Facing betrayal', 3600, CURDATE()),
(9, 5, 1, 'New Allies', 'Meeting new characters', 3600, CURDATE()),
(10, 5, 2, 'Forming Bonds', 'Strengthening relationships', 3600, CURDATE()),
(11, 6, 1, 'Challenges Ahead', 'Facing tough obstacles', 3600, CURDATE()),
(12, 6, 2, 'Overcoming Fears', 'Conquering personal fears', 3600, CURDATE()),
(13, 7, 1, 'The Dark Hour', 'Confronting fears', 3600, CURDATE()),
(14, 7, 2, 'Shadows Rising', 'Enemies gather strength', 3600, CURDATE()),
(15, 8, 1, 'Revelations', 'Key truths revealed', 3600, CURDATE()),
(16, 8, 2, 'Truth Unveiled', 'More secrets come to light', 3600, CURDATE()),
(17, 9, 1, 'Climax', 'Building up to the finale', 3600, CURDATE()),
(18, 9, 2, 'The Great Battle', 'Epic confrontations', 3600, CURDATE()),
(19, 10, 1, 'Finale', 'Conclusion of the journey', 3600, CURDATE()),
(20, 10, 2, 'A New Dawn', 'New beginnings after the end', 3600, CURDATE());



-- テーブル: schedules
INSERT INTO schedules (schedule_id, channel_id, episode_id, schedule_start_time, schedule_end_time, schedule_view_count) VALUES
(1, 1, 1, '2024-08-01 08:00:00', '2024-08-01 09:00:00', 1000),
(2, 2, 2, '2024-08-01 09:00:00', '2024-08-01 10:00:00', 1200),
(3, 3, 3, '2024-08-01 10:00:00', '2024-08-01 11:00:00', 1500),
(4, 4, 4, '2024-08-01 11:00:00', '2024-08-01 12:00:00', 1700),
(5, 5, 5, '2024-08-01 12:00:00', '2024-08-01 13:00:00', 1100),
(6, 6, 6, '2024-08-01 13:00:00', '2024-08-01 14:00:00', 1300),
(7, 7, 7, '2024-08-01 14:00:00', '2024-08-01 15:00:00', 1400),
(8, 8, 8, '2024-08-01 15:00:00', '2024-08-01 16:00:00', 1600),
(9, 9, 9, '2024-08-01 16:00:00', '2024-08-01 17:00:00', 1800),
(10, 10, 10, '2024-08-01 17:00:00', '2024-08-01 18:00:00', 1900),
(11, 11, 11, '2024-08-02 08:00:00', '2024-08-02 09:00:00', 2000),
(12, 12, 12, '2024-08-02 09:00:00', '2024-08-02 10:00:00', 3000),
(13, 1, 13, '2024-08-02 10:00:00', '2024-08-02 11:00:00', 2200),
(14, 2, 14, '2024-08-02 11:00:00', '2024-08-02 12:00:00', 2300),
(15, 3, 15, '2024-08-02 12:00:00', '2024-08-02 13:00:00', 2400),
(16, 4, 16, '2024-08-02 13:00:00', '2024-08-02 14:00:00', 2500),
(17, 5, 17, '2024-08-02 14:00:00', '2024-08-02 15:00:00', 2600),
(18, 6, 18, '2024-08-02 15:00:00', '2024-08-02 16:00:00', 2700),
(19, 7, 19, '2024-08-02 16:00:00', '2024-08-02 17:00:00', 2800),
(20, 8, 20, '2024-08-02 17:00:00', '2024-08-02 18:00:00', 2900);

