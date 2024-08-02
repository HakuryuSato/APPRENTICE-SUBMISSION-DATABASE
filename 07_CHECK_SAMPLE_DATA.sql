-- *本日は 2024-08-02 と定義します。
-- よく見られているエピソードを知りたいです。
-- エピソード視聴数トップ3の
-- エピソードタイトルと視聴数を取得してください
SELECT episodes.episode_title,
    SUM(schedule_view_count) AS total_views
FROM schedules
    JOIN episodes ON schedules.episode_id = episodes.episode_id
GROUP BY episodes.episode_title
ORDER BY total_views DESC
LIMIT 3;


-- よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。
-- エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください
SELECT programs.program_name,
    seasons.season_number,
    episodes.episode_number,
    episodes.episode_title,
    SUM(schedules.schedule_view_count) AS total_views
FROM schedules
    JOIN episodes ON schedules.episode_id = episodes.episode_id
    JOIN seasons ON episodes.season_id = seasons.season_id
    JOIN programs ON seasons.program_id = programs.program_id
GROUP BY programs.program_name,
    seasons.season_number,
    episodes.episode_number,
    episodes.episode_title
ORDER BY total_views DESC
LIMIT 3;


-- 本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。
-- 本日放送される全ての番組に対して、
-- チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。
-- なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします
SELECT channels.channel_name,
    schedules.schedule_start_time,
    schedules.schedule_end_time,
    seasons.season_number,
    episodes.episode_number,
    episodes.episode_title,
    episodes.episode_description
FROM schedules
    JOIN channels ON schedules.channel_id = channels.channel_id
    JOIN episodes ON schedules.episode_id = episodes.episode_id
    JOIN seasons ON episodes.season_id = seasons.season_id
WHERE DATE(schedules.schedule_start_time) = '2024-08-02'
-- WHERE schedules.schedule_start_time BETWEEN CURDATE() AND CURDATE() + INTERVAL 1 DAY -- "本日"が固定でないなら
ORDER BY schedules.schedule_start_time;


-- ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、
-- 本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。
-- ドラマのチャンネルに対して、
-- 放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を
-- 本日から一週間分取得してください
SELECT schedules.schedule_start_time,
    schedules.schedule_end_time,
    seasons.season_number,
    episodes.episode_number,
    episodes.episode_title,
    episodes.episode_description
FROM schedules
    JOIN channels ON schedules.channel_id = channels.channel_id
    JOIN episodes ON schedules.episode_id = episodes.episode_id
    JOIN seasons ON episodes.season_id = seasons.season_id
WHERE DATE(schedules.schedule_start_time) BETWEEN '2024-08-02' AND '2024-08-09'
-- WHERE schedules.schedule_start_time BETWEEN CURDATE() AND CURDATE() + INTERVAL 1 WEEK
    AND channels.channel_name = 'drama'
ORDER BY schedules.schedule_start_time;


-- (advanced) 直近一週間で最も見られた番組が知りたいです。
-- 直近一週間に放送された番組の中で、
-- エピソード視聴数合計トップ2の番組に対して、
-- 番組タイトル、視聴数を取得してください
SELECT programs.program_name,
    SUM(schedules.schedule_view_count) AS view_count
FROM schedules
    JOIN episodes ON schedules.episode_id = episodes.episode_id
    JOIN seasons ON episodes.season_id = seasons.season_id
    JOIN programs ON seasons.program_id = programs.program_id
WHERE DATE(schedules.schedule_start_time) BETWEEN '2024-07-25' AND '2024-08-02'
-- WHERE DATE(schedules.schedule_start_time) >= CURDATE() - INTERVAL 1 WEEK
GROUP BY programs.program_name
ORDER BY view_count DESC
LIMIT 2;


-- (advanced) ジャンルごとの番組の視聴数ランキングを知りたいです。
-- 番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。
-- ジャンルごとに視聴数トップの番組に対して、
-- ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。
SELECT genres.genre_name,
    programs.program_name,
    ROUND(AVG(schedules.schedule_view_count), 0) AS average_view
FROM schedules
    JOIN episodes ON schedules.episode_id = episodes.episode_id
    JOIN seasons ON episodes.season_id = seasons.season_id
    JOIN programs ON seasons.program_id = programs.program_id
    JOIN program_genres ON programs.program_id = program_genres.program_id
    JOIN genres ON program_genres.genre_id = genres.genre_id
GROUP BY genres.genre_name,
    programs.program_name
ORDER BY average_view DESC,
    genres.genre_name ASC;
