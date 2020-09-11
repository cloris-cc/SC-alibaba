/*
 Navicat MySQL Data Transfer

 Source Server         : teamwang.cn_18006
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : teamwang.cn:18006
 Source Schema         : nacos_devtest

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 11/09/2020 23:05:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`
(
    `id`           bigint(0)                                        NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL COMMENT 'content',
    `md5`          varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`   datetime(0)                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified` datetime(0)                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `src_user`     text CHARACTER SET utf8 COLLATE utf8_bin         NULL COMMENT 'source user',
    `src_ip`       varchar(20) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'source ip',
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT '' COMMENT '租户字段',
    `c_desc`       varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `c_use`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `effect`       varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `type`         varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `c_schema`     text CHARACTER SET utf8 COLLATE utf8_bin         NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfo_datagrouptenant` (`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info`
VALUES (1, 'transport.type', 'SEATA_GROUP', 'TCP', 'b136ef5f6a01d816991fe3cf7a6ac763', '2020-09-11 14:08:44',
        '2020-09-11 14:08:44', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (2, 'transport.server', 'SEATA_GROUP', 'NIO', 'b6d9dfc0fb54277321cebc0fff55df2f', '2020-09-11 14:08:44',
        '2020-09-11 14:08:44', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (3, 'transport.heartbeat', 'SEATA_GROUP', 'true', 'b326b5062b2f0e69046810717534cb09', '2020-09-11 14:08:45',
        '2020-09-11 14:08:45', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (4, 'transport.enableClientBatchSendRequest', 'SEATA_GROUP', 'false', '68934a3e9455fa72420237eb05902327',
        '2020-09-11 14:08:46', '2020-09-11 14:08:46', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (5, 'transport.threadFactory.bossThreadPrefix', 'SEATA_GROUP', 'NettyBoss', '0f8db59a3b7f2823f38a70c308361836',
        '2020-09-11 14:08:46', '2020-09-11 14:08:46', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (6, 'transport.threadFactory.workerThreadPrefix', 'SEATA_GROUP', 'NettyServerNIOWorker',
        'a78ec7ef5d1631754c4e72ae8a3e9205', '2020-09-11 14:08:47', '2020-09-11 14:08:47', NULL, '172.19.0.1', '', '',
        NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (7, 'transport.threadFactory.serverExecutorThreadPrefix', 'SEATA_GROUP', 'NettyServerBizHandler',
        '11a36309f3d9df84fa8b59cf071fa2da', '2020-09-11 14:08:47', '2020-09-11 14:08:47', NULL, '172.19.0.1', '', '',
        NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (8, 'transport.threadFactory.shareBossWorker', 'SEATA_GROUP', 'false', '68934a3e9455fa72420237eb05902327',
        '2020-09-11 14:08:48', '2020-09-11 14:08:48', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (9, 'transport.threadFactory.clientSelectorThreadPrefix', 'SEATA_GROUP', 'NettyClientSelector',
        'cd7ec5a06541e75f5a7913752322c3af', '2020-09-11 14:08:49', '2020-09-11 14:08:49', NULL, '172.19.0.1', '', '',
        NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (10, 'transport.threadFactory.clientSelectorThreadSize', 'SEATA_GROUP', '1', 'c4ca4238a0b923820dcc509a6f75849b',
        '2020-09-11 14:08:49', '2020-09-11 14:08:49', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (11, 'transport.threadFactory.clientWorkerThreadPrefix', 'SEATA_GROUP', 'NettyClientWorkerThread',
        '61cf4e69a56354cf72f46dc86414a57e', '2020-09-11 14:08:50', '2020-09-11 14:08:50', NULL, '172.19.0.1', '', '',
        NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (12, 'transport.threadFactory.bossThreadSize', 'SEATA_GROUP', '1', 'c4ca4238a0b923820dcc509a6f75849b',
        '2020-09-11 14:08:50', '2020-09-11 14:08:50', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (13, 'transport.threadFactory.workerThreadSize', 'SEATA_GROUP', 'default', 'c21f969b5f03d33d43e04f8f136e7682',
        '2020-09-11 14:08:51', '2020-09-11 14:08:51', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (14, 'transport.shutdown.wait', 'SEATA_GROUP', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '2020-09-11 14:08:52',
        '2020-09-11 14:08:52', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (15, 'service.vgroupMapping.my_test_tx_group', 'SEATA_GROUP', 'default', 'c21f969b5f03d33d43e04f8f136e7682',
        '2020-09-11 14:08:52', '2020-09-11 14:08:52', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (16, 'service.default.grouplist', 'SEATA_GROUP', '127.0.0.1:8091', 'c32ce0d3e264525dcdada751f98143a3',
        '2020-09-11 14:08:53', '2020-09-11 14:08:53', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (17, 'service.enableDegrade', 'SEATA_GROUP', 'false', '68934a3e9455fa72420237eb05902327', '2020-09-11 14:08:54',
        '2020-09-11 14:08:54', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (18, 'service.disableGlobalTransaction', 'SEATA_GROUP', 'false', '68934a3e9455fa72420237eb05902327',
        '2020-09-11 14:08:54', '2020-09-11 14:08:54', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (19, 'client.rm.asyncCommitBufferLimit', 'SEATA_GROUP', '10000', 'b7a782741f667201b54880c925faec4b',
        '2020-09-11 14:08:55', '2020-09-11 14:08:55', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (20, 'client.rm.lock.retryInterval', 'SEATA_GROUP', '10', 'd3d9446802a44259755d38e6d163e820',
        '2020-09-11 14:08:56', '2020-09-11 14:08:56', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (21, 'client.rm.lock.retryTimes', 'SEATA_GROUP', '30', '34173cb38f07f89ddbebc2ac9128303f', '2020-09-11 14:08:56',
        '2020-09-11 14:08:56', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (22, 'client.rm.lock.retryPolicyBranchRollbackOnConflict', 'SEATA_GROUP', 'true',
        'b326b5062b2f0e69046810717534cb09', '2020-09-11 14:08:57', '2020-09-11 14:08:57', NULL, '172.19.0.1', '', '',
        NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (23, 'client.rm.reportRetryCount', 'SEATA_GROUP', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2020-09-11 14:08:58',
        '2020-09-11 14:08:58', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (24, 'client.rm.tableMetaCheckEnable', 'SEATA_GROUP', 'false', '68934a3e9455fa72420237eb05902327',
        '2020-09-11 14:08:58', '2020-09-11 14:08:58', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (25, 'client.rm.sqlParserType', 'SEATA_GROUP', 'druid', '3d650fb8a5df01600281d48c47c9fa60',
        '2020-09-11 14:08:59', '2020-09-11 14:08:59', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (26, 'client.rm.reportSuccessEnable', 'SEATA_GROUP', 'false', '68934a3e9455fa72420237eb05902327',
        '2020-09-11 14:08:59', '2020-09-11 14:08:59', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (27, 'client.rm.sagaBranchRegisterEnable', 'SEATA_GROUP', 'false', '68934a3e9455fa72420237eb05902327',
        '2020-09-11 14:09:00', '2020-09-11 14:09:00', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (28, 'client.tm.commitRetryCount', 'SEATA_GROUP', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2020-09-11 14:09:01',
        '2020-09-11 14:09:01', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (29, 'client.tm.rollbackRetryCount', 'SEATA_GROUP', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2020-09-11 14:09:01', '2020-09-11 14:09:01', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (30, 'client.tm.defaultGlobalTransactionTimeout', 'SEATA_GROUP', '60000', '2b4226dd7ed6eb2d419b881f3ae9c97c',
        '2020-09-11 14:09:02', '2020-09-11 14:09:02', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (31, 'client.tm.degradeCheck', 'SEATA_GROUP', 'false', '68934a3e9455fa72420237eb05902327', '2020-09-11 14:09:02',
        '2020-09-11 14:09:02', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (32, 'client.tm.degradeCheckAllowTimes', 'SEATA_GROUP', '10', 'd3d9446802a44259755d38e6d163e820',
        '2020-09-11 14:09:03', '2020-09-11 14:09:03', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (33, 'client.tm.degradeCheckPeriod', 'SEATA_GROUP', '2000', '08f90c1a417155361a5c4b8d297e0d78',
        '2020-09-11 14:09:04', '2020-09-11 14:09:04', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (34, 'store.mode', 'SEATA_GROUP', 'db', 'd77d5e503ad1439f585ac494268b351b', '2020-09-11 14:09:04',
        '2020-09-11 14:45:09', NULL, '172.19.0.1', '', '', '', '', '', '', '');
INSERT INTO `config_info`
VALUES (35, 'store.file.dir', 'SEATA_GROUP', 'file_store/data', '6a8dec07c44c33a8a9247cba5710bbb2',
        '2020-09-11 14:09:05', '2020-09-11 14:09:05', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (36, 'store.file.maxBranchSessionSize', 'SEATA_GROUP', '16384', 'c76fe1d8e08462434d800487585be217',
        '2020-09-11 14:09:05', '2020-09-11 14:09:05', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (37, 'store.file.maxGlobalSessionSize', 'SEATA_GROUP', '512', '10a7cdd970fe135cf4f7bb55c0e3b59f',
        '2020-09-11 14:09:06', '2020-09-11 14:09:06', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (38, 'store.file.fileWriteBufferCacheSize', 'SEATA_GROUP', '16384', 'c76fe1d8e08462434d800487585be217',
        '2020-09-11 14:09:07', '2020-09-11 14:09:07', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (39, 'store.file.flushDiskMode', 'SEATA_GROUP', 'async', '0df93e34273b367bb63bad28c94c78d5',
        '2020-09-11 14:09:07', '2020-09-11 14:09:07', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (40, 'store.file.sessionReloadReadSize', 'SEATA_GROUP', '100', 'f899139df5e1059396431415e770c6dd',
        '2020-09-11 14:09:08', '2020-09-11 14:09:08', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (41, 'store.db.datasource', 'SEATA_GROUP', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2020-09-11 14:09:08',
        '2020-09-11 14:09:08', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (42, 'store.db.dbType', 'SEATA_GROUP', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2020-09-11 14:09:09',
        '2020-09-11 14:09:09', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (43, 'store.db.driverClassName', 'SEATA_GROUP', 'com.mysql.cj.jdbc.Driver', '33763409bb7f4838bde4fae9540433e4',
        '2020-09-11 14:09:10', '2020-09-11 14:47:51', NULL, '172.19.0.1', '', '', '', '', '', '', '');
INSERT INTO `config_info`
VALUES (44, 'store.db.url', 'SEATA_GROUP', 'jdbc:mysql://teamwang.cn:18006/seata?useUnicode=true',
        '9a5f6488de68dd9ff53273446acbc6ca', '2020-09-11 14:09:10', '2020-09-11 15:02:42', NULL, '172.19.0.1', '', '',
        '', '', '', '', '');
INSERT INTO `config_info`
VALUES (45, 'store.db.user', 'SEATA_GROUP', 'root', '63a9f0ea7bb98050796b649e85481845', '2020-09-11 14:09:11',
        '2020-09-11 14:46:35', NULL, '172.19.0.1', '', '', '', '', '', '', '');
INSERT INTO `config_info`
VALUES (46, 'store.db.password', 'SEATA_GROUP', 'cctv123456', 'cadf28f6d8208c4d0e29f40fa0d99512', '2020-09-11 14:09:12',
        '2020-09-11 15:02:57', NULL, '172.19.0.1', '', '', '', '', '', '', '');
INSERT INTO `config_info`
VALUES (47, 'store.db.minConn', 'SEATA_GROUP', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2020-09-11 14:09:12',
        '2020-09-11 14:09:12', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (48, 'store.db.maxConn', 'SEATA_GROUP', '30', '34173cb38f07f89ddbebc2ac9128303f', '2020-09-11 14:09:13',
        '2020-09-11 14:09:13', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (49, 'store.db.globalTable', 'SEATA_GROUP', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b',
        '2020-09-11 14:09:13', '2020-09-11 14:09:13', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (50, 'store.db.branchTable', 'SEATA_GROUP', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c',
        '2020-09-11 14:09:14', '2020-09-11 14:09:14', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (51, 'store.db.queryLimit', 'SEATA_GROUP', '100', 'f899139df5e1059396431415e770c6dd', '2020-09-11 14:09:15',
        '2020-09-11 14:09:15', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (52, 'store.db.lockTable', 'SEATA_GROUP', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f',
        '2020-09-11 14:09:15', '2020-09-11 14:09:15', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (53, 'store.db.maxWait', 'SEATA_GROUP', '5000', 'a35fe7f7fe8217b4369a0af4244d1fca', '2020-09-11 14:09:16',
        '2020-09-11 14:09:16', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (54, 'store.redis.host', 'SEATA_GROUP', '127.0.0.1', 'f528764d624db129b32c21fbca0cb8d6', '2020-09-11 14:09:16',
        '2020-09-11 14:09:16', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (55, 'store.redis.port', 'SEATA_GROUP', '6379', '92c3b916311a5517d9290576e3ea37ad', '2020-09-11 14:09:17',
        '2020-09-11 14:09:17', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (56, 'store.redis.maxConn', 'SEATA_GROUP', '10', 'd3d9446802a44259755d38e6d163e820', '2020-09-11 14:09:18',
        '2020-09-11 14:09:18', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (57, 'store.redis.minConn', 'SEATA_GROUP', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2020-09-11 14:09:18',
        '2020-09-11 14:09:18', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (58, 'store.redis.database', 'SEATA_GROUP', '0', 'cfcd208495d565ef66e7dff9f98764da', '2020-09-11 14:09:19',
        '2020-09-11 14:09:19', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (59, 'store.redis.password', 'SEATA_GROUP', 'null', '37a6259cc0c1dae299a7866489dff0bd', '2020-09-11 14:09:19',
        '2020-09-11 14:09:19', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (60, 'store.redis.queryLimit', 'SEATA_GROUP', '100', 'f899139df5e1059396431415e770c6dd', '2020-09-11 14:09:20',
        '2020-09-11 14:09:20', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (61, 'server.recovery.committingRetryPeriod', 'SEATA_GROUP', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5',
        '2020-09-11 14:09:21', '2020-09-11 14:09:21', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (62, 'server.recovery.asynCommittingRetryPeriod', 'SEATA_GROUP', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5',
        '2020-09-11 14:09:21', '2020-09-11 14:09:21', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (63, 'server.recovery.rollbackingRetryPeriod', 'SEATA_GROUP', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5',
        '2020-09-11 14:09:22', '2020-09-11 14:09:22', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (64, 'server.recovery.timeoutRetryPeriod', 'SEATA_GROUP', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5',
        '2020-09-11 14:09:22', '2020-09-11 14:09:22', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (65, 'server.maxCommitRetryTimeout', 'SEATA_GROUP', '-1', '6bb61e3b7bce0931da574d19d1d82c88',
        '2020-09-11 14:09:23', '2020-09-11 14:09:23', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (66, 'server.maxRollbackRetryTimeout', 'SEATA_GROUP', '-1', '6bb61e3b7bce0931da574d19d1d82c88',
        '2020-09-11 14:09:24', '2020-09-11 14:09:24', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (67, 'server.rollbackRetryTimeoutUnlockEnable', 'SEATA_GROUP', 'false', '68934a3e9455fa72420237eb05902327',
        '2020-09-11 14:09:24', '2020-09-11 14:09:24', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (68, 'client.undo.dataValidation', 'SEATA_GROUP', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2020-09-11 14:09:25', '2020-09-11 14:09:25', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (69, 'client.undo.logSerialization', 'SEATA_GROUP', 'jackson', 'b41779690b83f182acc67d6388c7bac9',
        '2020-09-11 14:09:25', '2020-09-11 14:09:25', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (70, 'client.undo.onlyCareUpdateColumns', 'SEATA_GROUP', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2020-09-11 14:09:26', '2020-09-11 14:09:26', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (71, 'server.undo.logSaveDays', 'SEATA_GROUP', '7', '8f14e45fceea167a5a36dedd4bea2543', '2020-09-11 14:09:26',
        '2020-09-11 14:09:26', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (72, 'server.undo.logDeletePeriod', 'SEATA_GROUP', '86400000', 'f4c122804fe9076cb2710f55c3c6e346',
        '2020-09-11 14:09:27', '2020-09-11 14:09:27', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (73, 'client.undo.logTable', 'SEATA_GROUP', 'undo_log', '2842d229c24afe9e61437135e8306614',
        '2020-09-11 14:09:28', '2020-09-11 14:09:28', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (74, 'client.log.exceptionRate', 'SEATA_GROUP', '100', 'f899139df5e1059396431415e770c6dd', '2020-09-11 14:09:28',
        '2020-09-11 14:09:28', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (75, 'transport.serialization', 'SEATA_GROUP', 'seata', 'b943081c423b9a5416a706524ee05d40',
        '2020-09-11 14:09:29', '2020-09-11 14:09:29', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (76, 'transport.compressor', 'SEATA_GROUP', 'none', '334c4a4c42fdb79d7ebc3e73b517e6f8', '2020-09-11 14:09:29',
        '2020-09-11 14:09:29', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (77, 'metrics.enabled', 'SEATA_GROUP', 'false', '68934a3e9455fa72420237eb05902327', '2020-09-11 14:09:30',
        '2020-09-11 14:09:30', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (78, 'metrics.registryType', 'SEATA_GROUP', 'compact', '7cf74ca49c304df8150205fc915cd465', '2020-09-11 14:09:31',
        '2020-09-11 14:09:31', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (79, 'metrics.exporterList', 'SEATA_GROUP', 'prometheus', 'e4f00638b8a10e6994e67af2f832d51c',
        '2020-09-11 14:09:31', '2020-09-11 14:09:31', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info`
VALUES (80, 'metrics.exporterPrometheusPort', 'SEATA_GROUP', '9898', '7b9dc501afe4ee11c56a4831e20cee71',
        '2020-09-11 14:09:32', '2020-09-11 14:09:32', NULL, '172.19.0.1', '', '', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`
(
    `id`           bigint(0)                                        NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
    `datum_id`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL COMMENT '内容',
    `gmt_modified` datetime(0)                                      NOT NULL COMMENT '修改时间',
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum` (`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '增加租户字段'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`
(
    `id`           bigint(0)                                         NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT 'data_id',
    `group_id`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT 'group_id',
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'app_name',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin      NOT NULL COMMENT 'content',
    `beta_ips`     varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT 'betaIps',
    `md5`          varchar(32) CHARACTER SET utf8 COLLATE utf8_bin   NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`   datetime(0)                                       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified` datetime(0)                                       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `src_user`     text CHARACTER SET utf8 COLLATE utf8_bin          NULL COMMENT 'source user',
    `src_ip`       varchar(20) CHARACTER SET utf8 COLLATE utf8_bin   NULL     DEFAULT NULL COMMENT 'source ip',
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT '' COMMENT '租户字段',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfobeta_datagrouptenant` (`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info_beta'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`
(
    `id`           bigint(0)                                        NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT '' COMMENT 'tenant_id',
    `tag_id`       varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT 'app_name',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL COMMENT 'content',
    `md5`          varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`   datetime(0)                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified` datetime(0)                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `src_user`     text CHARACTER SET utf8 COLLATE utf8_bin         NULL COMMENT 'source user',
    `src_ip`       varchar(20) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'source ip',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfotag_datagrouptenanttag` (`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info_tag'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`
(
    `id`        bigint(0)                                        NOT NULL COMMENT 'id',
    `tag_name`  varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
    `tag_type`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL COMMENT 'tag_type',
    `data_id`   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`  varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
    `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
    `nid`       bigint(0)                                        NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`nid`) USING BTREE,
    UNIQUE INDEX `uk_configtagrelation_configidtag` (`id`, `tag_name`, `tag_type`) USING BTREE,
    INDEX `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_tag_relation'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`
(
    `id`                bigint(0) UNSIGNED                               NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `group_id`          varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
    `quota`             int(0) UNSIGNED                                  NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
    `usage`             int(0) UNSIGNED                                  NOT NULL DEFAULT 0 COMMENT '使用量',
    `max_size`          int(0) UNSIGNED                                  NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
    `max_aggr_count`    int(0) UNSIGNED                                  NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
    `max_aggr_size`     int(0) UNSIGNED                                  NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
    `max_history_count` int(0) UNSIGNED                                  NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
    `gmt_create`        datetime(0)                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified`      datetime(0)                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_group_id` (`group_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`
(
    `id`           bigint(0) UNSIGNED                               NOT NULL,
    `nid`          bigint(0) UNSIGNED                               NOT NULL AUTO_INCREMENT,
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `group_id`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT 'app_name',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL,
    `md5`          varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `gmt_create`   datetime(0)                                      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `gmt_modified` datetime(0)                                      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `src_user`     text CHARACTER SET utf8 COLLATE utf8_bin         NULL,
    `src_ip`       varchar(20) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `op_type`      char(10) CHARACTER SET utf8 COLLATE utf8_bin     NULL     DEFAULT NULL,
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT '' COMMENT '租户字段',
    PRIMARY KEY (`nid`) USING BTREE,
    INDEX `idx_gmt_create` (`gmt_create`) USING BTREE,
    INDEX `idx_gmt_modified` (`gmt_modified`) USING BTREE,
    INDEX `idx_did` (`data_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '多租户改造'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info`
VALUES (0, 1, 'transport.type', 'SEATA_GROUP', '', 'TCP', 'b136ef5f6a01d816991fe3cf7a6ac763', '2020-09-11 14:08:44',
        '2020-09-11 14:08:44', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 2, 'transport.server', 'SEATA_GROUP', '', 'NIO', 'b6d9dfc0fb54277321cebc0fff55df2f', '2020-09-11 14:08:45',
        '2020-09-11 14:08:44', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 3, 'transport.heartbeat', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2020-09-11 14:08:45', '2020-09-11 14:08:45', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 4, 'transport.enableClientBatchSendRequest', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2020-09-11 14:08:46', '2020-09-11 14:08:46', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 5, 'transport.threadFactory.bossThreadPrefix', 'SEATA_GROUP', '', 'NettyBoss',
        '0f8db59a3b7f2823f38a70c308361836', '2020-09-11 14:08:47', '2020-09-11 14:08:46', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 6, 'transport.threadFactory.workerThreadPrefix', 'SEATA_GROUP', '', 'NettyServerNIOWorker',
        'a78ec7ef5d1631754c4e72ae8a3e9205', '2020-09-11 14:08:47', '2020-09-11 14:08:47', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 7, 'transport.threadFactory.serverExecutorThreadPrefix', 'SEATA_GROUP', '', 'NettyServerBizHandler',
        '11a36309f3d9df84fa8b59cf071fa2da', '2020-09-11 14:08:48', '2020-09-11 14:08:47', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 8, 'transport.threadFactory.shareBossWorker', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2020-09-11 14:08:48', '2020-09-11 14:08:48', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 9, 'transport.threadFactory.clientSelectorThreadPrefix', 'SEATA_GROUP', '', 'NettyClientSelector',
        'cd7ec5a06541e75f5a7913752322c3af', '2020-09-11 14:08:49', '2020-09-11 14:08:49', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 10, 'transport.threadFactory.clientSelectorThreadSize', 'SEATA_GROUP', '', '1',
        'c4ca4238a0b923820dcc509a6f75849b', '2020-09-11 14:08:50', '2020-09-11 14:08:49', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 11, 'transport.threadFactory.clientWorkerThreadPrefix', 'SEATA_GROUP', '', 'NettyClientWorkerThread',
        '61cf4e69a56354cf72f46dc86414a57e', '2020-09-11 14:08:50', '2020-09-11 14:08:50', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 12, 'transport.threadFactory.bossThreadSize', 'SEATA_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b',
        '2020-09-11 14:08:51', '2020-09-11 14:08:50', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 13, 'transport.threadFactory.workerThreadSize', 'SEATA_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2020-09-11 14:08:52', '2020-09-11 14:08:51', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 14, 'transport.shutdown.wait', 'SEATA_GROUP', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3',
        '2020-09-11 14:08:52', '2020-09-11 14:08:52', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 15, 'service.vgroupMapping.my_test_tx_group', 'SEATA_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2020-09-11 14:08:53', '2020-09-11 14:08:52', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 16, 'service.default.grouplist', 'SEATA_GROUP', '', '127.0.0.1:8091', 'c32ce0d3e264525dcdada751f98143a3',
        '2020-09-11 14:08:53', '2020-09-11 14:08:53', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 17, 'service.enableDegrade', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2020-09-11 14:08:54', '2020-09-11 14:08:54', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 18, 'service.disableGlobalTransaction', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2020-09-11 14:08:55', '2020-09-11 14:08:54', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 19, 'client.rm.asyncCommitBufferLimit', 'SEATA_GROUP', '', '10000', 'b7a782741f667201b54880c925faec4b',
        '2020-09-11 14:08:56', '2020-09-11 14:08:55', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 20, 'client.rm.lock.retryInterval', 'SEATA_GROUP', '', '10', 'd3d9446802a44259755d38e6d163e820',
        '2020-09-11 14:08:56', '2020-09-11 14:08:56', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 21, 'client.rm.lock.retryTimes', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f',
        '2020-09-11 14:08:57', '2020-09-11 14:08:56', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 22, 'client.rm.lock.retryPolicyBranchRollbackOnConflict', 'SEATA_GROUP', '', 'true',
        'b326b5062b2f0e69046810717534cb09', '2020-09-11 14:08:57', '2020-09-11 14:08:57', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 23, 'client.rm.reportRetryCount', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2020-09-11 14:08:58', '2020-09-11 14:08:58', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 24, 'client.rm.tableMetaCheckEnable', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2020-09-11 14:08:59', '2020-09-11 14:08:58', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 25, 'client.rm.sqlParserType', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60',
        '2020-09-11 14:08:59', '2020-09-11 14:08:59', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 26, 'client.rm.reportSuccessEnable', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2020-09-11 14:09:00', '2020-09-11 14:08:59', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 27, 'client.rm.sagaBranchRegisterEnable', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2020-09-11 14:09:00', '2020-09-11 14:09:00', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 28, 'client.tm.commitRetryCount', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2020-09-11 14:09:01', '2020-09-11 14:09:01', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 29, 'client.tm.rollbackRetryCount', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2020-09-11 14:09:02', '2020-09-11 14:09:01', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 30, 'client.tm.defaultGlobalTransactionTimeout', 'SEATA_GROUP', '', '60000',
        '2b4226dd7ed6eb2d419b881f3ae9c97c', '2020-09-11 14:09:02', '2020-09-11 14:09:02', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 31, 'client.tm.degradeCheck', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2020-09-11 14:09:03', '2020-09-11 14:09:02', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 32, 'client.tm.degradeCheckAllowTimes', 'SEATA_GROUP', '', '10', 'd3d9446802a44259755d38e6d163e820',
        '2020-09-11 14:09:03', '2020-09-11 14:09:03', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 33, 'client.tm.degradeCheckPeriod', 'SEATA_GROUP', '', '2000', '08f90c1a417155361a5c4b8d297e0d78',
        '2020-09-11 14:09:04', '2020-09-11 14:09:04', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 34, 'store.mode', 'SEATA_GROUP', '', 'file', '8c7dd922ad47494fc02c388e12c00eac', '2020-09-11 14:09:05',
        '2020-09-11 14:09:04', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 35, 'store.file.dir', 'SEATA_GROUP', '', 'file_store/data', '6a8dec07c44c33a8a9247cba5710bbb2',
        '2020-09-11 14:09:05', '2020-09-11 14:09:05', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 36, 'store.file.maxBranchSessionSize', 'SEATA_GROUP', '', '16384', 'c76fe1d8e08462434d800487585be217',
        '2020-09-11 14:09:06', '2020-09-11 14:09:05', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 37, 'store.file.maxGlobalSessionSize', 'SEATA_GROUP', '', '512', '10a7cdd970fe135cf4f7bb55c0e3b59f',
        '2020-09-11 14:09:06', '2020-09-11 14:09:06', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 38, 'store.file.fileWriteBufferCacheSize', 'SEATA_GROUP', '', '16384', 'c76fe1d8e08462434d800487585be217',
        '2020-09-11 14:09:07', '2020-09-11 14:09:07', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 39, 'store.file.flushDiskMode', 'SEATA_GROUP', '', 'async', '0df93e34273b367bb63bad28c94c78d5',
        '2020-09-11 14:09:08', '2020-09-11 14:09:07', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 40, 'store.file.sessionReloadReadSize', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd',
        '2020-09-11 14:09:08', '2020-09-11 14:09:08', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 41, 'store.db.datasource', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60',
        '2020-09-11 14:09:09', '2020-09-11 14:09:08', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 42, 'store.db.dbType', 'SEATA_GROUP', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2020-09-11 14:09:09',
        '2020-09-11 14:09:09', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 43, 'store.db.driverClassName', 'SEATA_GROUP', '', 'com.mysql.jdbc.Driver',
        '683cf0c3a5a56cec94dfac94ca16d760', '2020-09-11 14:09:10', '2020-09-11 14:09:10', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 44, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://127.0.0.1:3306/seata?useUnicode=true',
        'cbb3bd573704f125fb4f2489208abaec', '2020-09-11 14:09:11', '2020-09-11 14:09:10', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 45, 'store.db.user', 'SEATA_GROUP', '', 'username', '14c4b06b824ec593239362517f538b29',
        '2020-09-11 14:09:11', '2020-09-11 14:09:11', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 46, 'store.db.password', 'SEATA_GROUP', '', 'password', '5f4dcc3b5aa765d61d8327deb882cf99',
        '2020-09-11 14:09:12', '2020-09-11 14:09:12', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 47, 'store.db.minConn', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2020-09-11 14:09:13',
        '2020-09-11 14:09:12', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 48, 'store.db.maxConn', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2020-09-11 14:09:13',
        '2020-09-11 14:09:13', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 49, 'store.db.globalTable', 'SEATA_GROUP', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b',
        '2020-09-11 14:09:14', '2020-09-11 14:09:13', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 50, 'store.db.branchTable', 'SEATA_GROUP', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c',
        '2020-09-11 14:09:14', '2020-09-11 14:09:14', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 51, 'store.db.queryLimit', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd',
        '2020-09-11 14:09:15', '2020-09-11 14:09:15', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 52, 'store.db.lockTable', 'SEATA_GROUP', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f',
        '2020-09-11 14:09:16', '2020-09-11 14:09:15', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 53, 'store.db.maxWait', 'SEATA_GROUP', '', '5000', 'a35fe7f7fe8217b4369a0af4244d1fca', '2020-09-11 14:09:16',
        '2020-09-11 14:09:16', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 54, 'store.redis.host', 'SEATA_GROUP', '', '127.0.0.1', 'f528764d624db129b32c21fbca0cb8d6',
        '2020-09-11 14:09:17', '2020-09-11 14:09:16', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 55, 'store.redis.port', 'SEATA_GROUP', '', '6379', '92c3b916311a5517d9290576e3ea37ad', '2020-09-11 14:09:18',
        '2020-09-11 14:09:17', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 56, 'store.redis.maxConn', 'SEATA_GROUP', '', '10', 'd3d9446802a44259755d38e6d163e820',
        '2020-09-11 14:09:18', '2020-09-11 14:09:18', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 57, 'store.redis.minConn', 'SEATA_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2020-09-11 14:09:19',
        '2020-09-11 14:09:18', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 58, 'store.redis.database', 'SEATA_GROUP', '', '0', 'cfcd208495d565ef66e7dff9f98764da',
        '2020-09-11 14:09:19', '2020-09-11 14:09:19', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 59, 'store.redis.password', 'SEATA_GROUP', '', 'null', '37a6259cc0c1dae299a7866489dff0bd',
        '2020-09-11 14:09:20', '2020-09-11 14:09:19', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 60, 'store.redis.queryLimit', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd',
        '2020-09-11 14:09:20', '2020-09-11 14:09:20', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 61, 'server.recovery.committingRetryPeriod', 'SEATA_GROUP', '', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5',
        '2020-09-11 14:09:21', '2020-09-11 14:09:21', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 62, 'server.recovery.asynCommittingRetryPeriod', 'SEATA_GROUP', '', '1000',
        'a9b7ba70783b617e9998dc4dd82eb3c5', '2020-09-11 14:09:22', '2020-09-11 14:09:21', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 63, 'server.recovery.rollbackingRetryPeriod', 'SEATA_GROUP', '', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5',
        '2020-09-11 14:09:22', '2020-09-11 14:09:22', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 64, 'server.recovery.timeoutRetryPeriod', 'SEATA_GROUP', '', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5',
        '2020-09-11 14:09:23', '2020-09-11 14:09:22', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 65, 'server.maxCommitRetryTimeout', 'SEATA_GROUP', '', '-1', '6bb61e3b7bce0931da574d19d1d82c88',
        '2020-09-11 14:09:23', '2020-09-11 14:09:23', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 66, 'server.maxRollbackRetryTimeout', 'SEATA_GROUP', '', '-1', '6bb61e3b7bce0931da574d19d1d82c88',
        '2020-09-11 14:09:24', '2020-09-11 14:09:24', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 67, 'server.rollbackRetryTimeoutUnlockEnable', 'SEATA_GROUP', '', 'false',
        '68934a3e9455fa72420237eb05902327', '2020-09-11 14:09:25', '2020-09-11 14:09:24', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 68, 'client.undo.dataValidation', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2020-09-11 14:09:25', '2020-09-11 14:09:25', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 69, 'client.undo.logSerialization', 'SEATA_GROUP', '', 'jackson', 'b41779690b83f182acc67d6388c7bac9',
        '2020-09-11 14:09:26', '2020-09-11 14:09:25', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 70, 'client.undo.onlyCareUpdateColumns', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2020-09-11 14:09:26', '2020-09-11 14:09:26', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 71, 'server.undo.logSaveDays', 'SEATA_GROUP', '', '7', '8f14e45fceea167a5a36dedd4bea2543',
        '2020-09-11 14:09:27', '2020-09-11 14:09:26', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 72, 'server.undo.logDeletePeriod', 'SEATA_GROUP', '', '86400000', 'f4c122804fe9076cb2710f55c3c6e346',
        '2020-09-11 14:09:28', '2020-09-11 14:09:27', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 73, 'client.undo.logTable', 'SEATA_GROUP', '', 'undo_log', '2842d229c24afe9e61437135e8306614',
        '2020-09-11 14:09:28', '2020-09-11 14:09:28', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 74, 'client.log.exceptionRate', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd',
        '2020-09-11 14:09:29', '2020-09-11 14:09:28', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 75, 'transport.serialization', 'SEATA_GROUP', '', 'seata', 'b943081c423b9a5416a706524ee05d40',
        '2020-09-11 14:09:29', '2020-09-11 14:09:29', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 76, 'transport.compressor', 'SEATA_GROUP', '', 'none', '334c4a4c42fdb79d7ebc3e73b517e6f8',
        '2020-09-11 14:09:30', '2020-09-11 14:09:29', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 77, 'metrics.enabled', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327', '2020-09-11 14:09:30',
        '2020-09-11 14:09:30', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 78, 'metrics.registryType', 'SEATA_GROUP', '', 'compact', '7cf74ca49c304df8150205fc915cd465',
        '2020-09-11 14:09:31', '2020-09-11 14:09:31', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 79, 'metrics.exporterList', 'SEATA_GROUP', '', 'prometheus', 'e4f00638b8a10e6994e67af2f832d51c',
        '2020-09-11 14:09:32', '2020-09-11 14:09:31', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 80, 'metrics.exporterPrometheusPort', 'SEATA_GROUP', '', '9898', '7b9dc501afe4ee11c56a4831e20cee71',
        '2020-09-11 14:09:32', '2020-09-11 14:09:32', NULL, '172.19.0.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (34, 81, 'store.mode', 'SEATA_GROUP', '', 'file', '8c7dd922ad47494fc02c388e12c00eac', '2020-09-11 14:45:10',
        '2020-09-11 14:45:09', NULL, '172.19.0.1', 'U', '');
INSERT INTO `his_config_info`
VALUES (45, 82, 'store.db.user', 'SEATA_GROUP', '', 'username', '14c4b06b824ec593239362517f538b29',
        '2020-09-11 14:46:36', '2020-09-11 14:46:35', NULL, '172.19.0.1', 'U', '');
INSERT INTO `his_config_info`
VALUES (46, 83, 'store.db.password', 'SEATA_GROUP', '', 'password', '5f4dcc3b5aa765d61d8327deb882cf99',
        '2020-09-11 14:47:04', '2020-09-11 14:47:03', NULL, '172.19.0.1', 'U', '');
INSERT INTO `his_config_info`
VALUES (43, 84, 'store.db.driverClassName', 'SEATA_GROUP', '', 'com.mysql.jdbc.Driver',
        '683cf0c3a5a56cec94dfac94ca16d760', '2020-09-11 14:47:52', '2020-09-11 14:47:51', NULL, '172.19.0.1', 'U', '');
INSERT INTO `his_config_info`
VALUES (44, 85, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://127.0.0.1:3306/seata?useUnicode=true',
        'cbb3bd573704f125fb4f2489208abaec', '2020-09-11 14:53:38', '2020-09-11 14:53:37', NULL, '172.19.0.1', 'U', '');
INSERT INTO `his_config_info`
VALUES (44, 86, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://172.19.0.1:3306/seata?useUnicode=true',
        'b9f43b267774f5cc775cd090f2adc2c5', '2020-09-11 14:56:26', '2020-09-11 14:56:25', NULL, '172.19.0.1', 'U', '');
INSERT INTO `his_config_info`
VALUES (44, 87, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://127.0.0.1:3306/seata?useUnicode=true',
        'cbb3bd573704f125fb4f2489208abaec', '2020-09-11 14:59:38', '2020-09-11 14:59:37', NULL, '172.19.0.1', 'U', '');
INSERT INTO `his_config_info`
VALUES (44, 88, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://localhost:3306/seata?useUnicode=true',
        'c15391fe9d4a8a213a6f2ad11820a755', '2020-09-11 15:00:34', '2020-09-11 15:00:33', NULL, '172.19.0.1', 'U', '');
INSERT INTO `his_config_info`
VALUES (44, 89, 'store.db.url', 'SEATA_GROUP', '', 'jdbc:mysql://172.19.0.1:3306/seata?useUnicode=true',
        'b9f43b267774f5cc775cd090f2adc2c5', '2020-09-11 15:02:43', '2020-09-11 15:02:42', NULL, '172.19.0.1', 'U', '');
INSERT INTO `his_config_info`
VALUES (46, 90, 'store.db.password', 'SEATA_GROUP', '', '123456', 'e10adc3949ba59abbe56e057f20f883e',
        '2020-09-11 15:02:58', '2020-09-11 15:02:57', NULL, '172.19.0.1', 'U', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`
(
    `role`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `resource` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `action`   varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    UNIQUE INDEX `uk_role_permission` (`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`
(
    `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `role`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    UNIQUE INDEX `idx_user_role` (`username`, `role`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles`
VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`
(
    `id`                bigint(0) UNSIGNED                               NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `tenant_id`         varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
    `quota`             int(0) UNSIGNED                                  NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
    `usage`             int(0) UNSIGNED                                  NOT NULL DEFAULT 0 COMMENT '使用量',
    `max_size`          int(0) UNSIGNED                                  NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
    `max_aggr_count`    int(0) UNSIGNED                                  NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
    `max_aggr_size`     int(0) UNSIGNED                                  NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
    `max_history_count` int(0) UNSIGNED                                  NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
    `gmt_create`        datetime(0)                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified`      datetime(0)                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_tenant_id` (`tenant_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '租户容量信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`
(
    `id`            bigint(0)                                        NOT NULL AUTO_INCREMENT COMMENT 'id',
    `kp`            varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
    `tenant_id`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
    `tenant_name`   varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
    `tenant_desc`   varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
    `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL COMMENT 'create_source',
    `gmt_create`    bigint(0)                                        NOT NULL COMMENT '创建时间',
    `gmt_modified`  bigint(0)                                        NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_tenant_info_kptenantid` (`kp`, `tenant_id`) USING BTREE,
    INDEX `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'tenant_info'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`
(
    `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `enabled`  tinyint(1)                                              NOT NULL,
    PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users`
VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
