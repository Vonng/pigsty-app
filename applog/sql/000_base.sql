-------------------------------------------------------------------------
-- Top level namespace app
-------------------------------------------------------------------------
-- DROP SCHEMA IF EXISTS applog CASCADE;
CREATE SCHEMA IF NOT EXISTS app;

-------------------------------------------------------------------------
-- temp base table applog.t_privacy_log
-------------------------------------------------------------------------
DROP TABLE IF EXISTS app.t_privacy_log;
CREATE TABLE app.t_privacy_log(data JSONB);
-- COPY t_privacy_log FROM 'data/example.ndjson';

-------------------------------------------------------------------------
-- analyze view: applog.privacy_log
-------------------------------------------------------------------------
DROP MATERIALIZED VIEW IF EXISTS app.privacy_log;
CREATE MATERIALIZED VIEW app.privacy_log AS
SELECT (data ->> 'timeStamp')::TIMESTAMPTZ      AS ts,
       ((data ->> 'identifier'))::UUID          AS id,
       data ->> 'type'                          AS type,
       data ->> 'kind'                          AS kind,
       data #>> '{accessor,identifier}'         AS app,
       data ->> 'category'                      AS category,
       data ->> 'accessor'                      AS accessor,
       data ->> 'bundleID'                      AS bundle_id,
       data ->> 'domain'                        AS domain,
       data ->> 'domainOwner'                   AS domain_owner,
       data ->> 'context'                       AS context,
       data ->> 'domainType'                    AS domain_type,
       (data ->> 'firstTimeStamp')::TIMESTAMPTZ AS first_ts,
       data ->> 'initiatedType'                 AS initiated_type,
       data ->> 'hits'                          AS hits
FROM app.t_privacy_log
ORDER BY 1;

CREATE INDEX ON app.privacy_log (ts);
CREATE INDEX ON app.privacy_log (app);
CREATE INDEX ON app.privacy_log (category);
REFRESH MATERIALIZED VIEW app.privacy_log;
