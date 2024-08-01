-- スキーマの作成
CREATE SCHEMA internet_tv DEFAULT CHARACTER SET utf8;
USE internet_tv;

-- programsテーブル作成
CREATE TABLE internet_tv.programs (
  program_id INT NOT NULL AUTO_INCREMENT,
  program_name VARCHAR(255) NOT NULL,
  program_description VARCHAR(255) NULL,
  PRIMARY KEY (program_id)
);

-- channelsテーブル作成
CREATE TABLE IF NOT EXISTS internet_tv.channels (
  channel_id INT NOT NULL AUTO_INCREMENT,
  channel_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (channel_id)
);

-- genresテーブル作成
CREATE TABLE IF NOT EXISTS internet_tv.genres (
  genre_id INT NOT NULL AUTO_INCREMENT,
  genre_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (genre_id)
);

-- program_genresテーブル作成
CREATE TABLE IF NOT EXISTS internet_tv.program_genres (
  genre_id INT NOT NULL,
  program_id INT NOT NULL,
  PRIMARY KEY (genre_id, program_id),
  CONSTRAINT fk_program_genres_program_id FOREIGN KEY (program_id) REFERENCES internet_tv.programs (program_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_program_genres_genre_id FOREIGN KEY (genre_id) REFERENCES internet_tv.genres (genre_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- seasonテーブル作成
CREATE TABLE IF NOT EXISTS internet_tv.season (
  season_id INT NOT NULL AUTO_INCREMENT,
  program_id INT NOT NULL,
  season_number INT NULL,
  PRIMARY KEY (season_id),
  CONSTRAINT fk_season_program_id FOREIGN KEY (program_id) REFERENCES internet_tv.programs (program_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- episodesテーブル作成
CREATE TABLE IF NOT EXISTS internet_tv.episodes (
  episode_id INT NOT NULL AUTO_INCREMENT,
  season_id INT NOT NULL,
  episode_number INT NULL,
  episode_title VARCHAR(255) NOT NULL,
  episode_description VARCHAR(255) NULL,
  episode_length_seconds INT NOT NULL,
  episode_release_date DATE NOT NULL,
  PRIMARY KEY (episode_id),
  CONSTRAINT fk_episodes_season_id FOREIGN KEY (season_id) REFERENCES internet_tv.season (season_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- schedulesテーブル作成
CREATE TABLE IF NOT EXISTS internet_tv.schedules (
  schedule_id INT NOT NULL AUTO_INCREMENT,
  channel_id INT NOT NULL,
  episode_id INT NOT NULL,
  schedule_start_time DATETIME NOT NULL,
  schedule_end_time DATETIME NOT NULL,
  schedule_view_count INT NOT NULL,
  PRIMARY KEY (schedule_id),
  CONSTRAINT fk_schedules_channel_id FOREIGN KEY (channel_id) REFERENCES internet_tv.channels (channel_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_schedules_episode_id FOREIGN KEY (episode_id) REFERENCES internet_tv.episodes (episode_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

