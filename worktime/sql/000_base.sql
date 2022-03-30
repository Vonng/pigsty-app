-- DROP SCHEMA app CASCADE;
CREATE SCHEMA IF NOT EXISTS app;

DROP TABLE IF EXISTS app.worktime;
CREATE TABLE IF NOT EXISTS app.worktime
(
    id          INTEGER NOT NULL,
    company     TEXT,
    department  TEXT,
    job         TEXT,
    base        TEXT,
    work_begin  TEXT,
    work_end    TEXT,
    launch_time TEXT,
    dinner_time TEXT,
    wed         TEXT,
    fri         TEXT,
    workdays    TEXT,
    summary     TEXT,
    remark      TEXT,
    category    TEXT,
    suggestion  TEXT,
    struct      TEXT,
    welfare     TEXT,
    is_foreign  BOOLEAN,
    domain      TEXT NOT NULL
) partition by list (domain);

CREATE TABLE app.internet PARTITION OF app.worktime FOR VALUES IN ('互联网');
CREATE TABLE app.finance  PARTITION OF app.worktime FOR VALUES IN ('金融');
CREATE TABLE app.foreign  PARTITION OF app.worktime FOR VALUES IN ('外企');
CREATE TABLE app.misc     PARTITION OF app.worktime FOR VALUES IN ('其他');

COMMENT ON TABLE app.worktime IS '企业工作时间统计表';
COMMENT ON TABLE app.internet IS '企业工作时间统计表：互联网行业';
COMMENT ON TABLE app.finance IS '企业工作时间统计表：金融行业';
COMMENT ON TABLE app.foreign IS '企业工作时间统计表：外企';
COMMENT ON TABLE app.misc IS '企业工作时间统计表：其他';

CREATE INDEX ON   app.worktime(company, department);
COMMENT ON COLUMN app.worktime.id IS '原始数据行号';
COMMENT ON COLUMN app.worktime.company IS '公司';
COMMENT ON COLUMN app.worktime.department IS '部门';
COMMENT ON COLUMN app.worktime.job IS '岗位';
COMMENT ON COLUMN app.worktime.base IS 'base地';
COMMENT ON COLUMN app.worktime.work_begin IS '上班时间';
COMMENT ON COLUMN app.worktime.work_end IS '下班时间';
COMMENT ON COLUMN app.worktime.launch_time IS '午饭时间';
COMMENT ON COLUMN app.worktime.dinner_time IS '晚饭时间';
COMMENT ON COLUMN app.worktime.wed IS '周三是否特殊';
COMMENT ON COLUMN app.worktime.fri IS '周五是否特殊';
COMMENT ON COLUMN app.worktime.workdays IS '一周工作天数';
COMMENT ON COLUMN app.worktime.summary IS '新人是否日报/周报';
COMMENT ON COLUMN app.worktime.remark IS '备注';
COMMENT ON COLUMN app.worktime.category IS '行业/公司性质';
COMMENT ON COLUMN app.worktime.suggestion IS '建议';
COMMENT ON COLUMN app.worktime.struct IS '组内 35 岁及以上基层员工（ 组长及以下）比例，格式为 x / y，x 为 35岁以上的人数，y 为总人数';
COMMENT ON COLUMN app.worktime.welfare IS '是否有其他福利（如：五险一金，带薪年假，公费旅游，免费三餐）';
COMMENT ON COLUMN app.worktime.is_foreign IS '是否为外资企业？';
COMMENT ON COLUMN app.worktime.domain IS '大分类：互联网、金融、外企、其他';
