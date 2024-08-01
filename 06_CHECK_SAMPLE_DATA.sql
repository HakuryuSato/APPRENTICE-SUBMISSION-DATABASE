-- よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください
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