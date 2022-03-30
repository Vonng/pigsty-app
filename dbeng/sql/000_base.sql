-- DROP SCHEMA app CASCADE;
CREATE SCHEMA IF NOT EXISTS app;

DROP TABLE IF EXISTS app.dbeng_trend;
CREATE TABLE IF NOT EXISTS app.dbeng_trend
(
    time  DATE NOT NULL,
    db    text NOT NULL,
    score NUMERIC,
    rank  INTEGER
);

COMMENT ON TABLE  app.dbeng_trend IS 'DB Engine Trending Data';
COMMENT ON COLUMN app.dbeng_trend.time IS 'month date';
COMMENT ON COLUMN app.dbeng_trend.db IS 'database name';
COMMENT ON COLUMN app.dbeng_trend.score IS 'score of this month & db';
COMMENT ON COLUMN app.dbeng_trend.rank IS 'rank of this month & db';

-- COPY app.db_trending FROM '/tmp/db_trending.csv' CSV HEADER;
