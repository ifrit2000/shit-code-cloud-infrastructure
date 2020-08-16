create table IF NOT EXISTS gateway_db.t_route
(
    id          varchar(32) PRIMARY KEY NOT NULL COMMENT '路由id',
    uri         varchar(512)            NOT NULL COMMENT '路由uri',
    `order`     int UNSIGNED            NOT NULL default 2147483647 COMMENT '优先级',
    metadata    varchar(256) COMMENT '元数据',
    unique_id   int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一键',
    version     INT UNSIGNED            NOT NULL DEFAULT 0 COMMENT '乐观锁版本',
    status      varchar(12)             NOT NULL COMMENT '状态',
    create_by   VARCHAR(64)             NOT NULL default 'SYSTEM' COMMENT '创建人',
    create_time DATETIME                NOT NULL default now() COMMENT '创建时间',
    update_by   VARCHAR(64)             NOT NULL default 'SYSTEM' COMMENT '修改人',
    update_time DATETIME                NOT NULL default now() COMMENT '修改时间',
    INDEX (id, uri),
    INDEX (uri),
    UNIQUE (unique_id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DELIMITER //
CREATE TRIGGER gateway_db.t_route_before_insert
    BEFORE INSERT
    ON gateway_db.t_route
    FOR EACH ROW
begin
    if (new.create_time is null) then
        set new.create_time = now();
    end if;
end
//
CREATE TRIGGER gateway_db.t_route_before_update
    before UPDATE
    ON gateway_db.t_route
    FOR EACH ROW
begin
    set NEW.update_time = now(),NEW.version = OLD.version + 1;
end
//

DELIMITER ;

