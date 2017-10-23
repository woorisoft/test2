-- evet_log2222
CREATE TABLE evet_log (
	dt      DATETIME    NULL COMMENT 'dt', -- dt
	func_nm VARCHAR(50) NULL COMMENT 'func_nm' -- func_nm
)
COMMENT 'evet_log';

-- game_ex2data
CREATE TABLE game_ex2data (
	ani_name VARCHAR(20) NULL COMMENT 'ani_name', -- ani_name
	land     CHAR(1)     NULL COMMENT 'land', -- land
	water    CHAR(1)     NULL COMMENT 'water', -- water
	sky      CHAR(1)     NULL COMMENT 'sky', -- sky
	bug      CHAR(1)     NULL COMMENT 'bug', -- bug
	leg      INT(11)     NULL COMMENT 'leg', -- leg
	tail     CHAR(1)     NULL COMMENT 'tail', -- tail
	egg      CHAR(1)     NULL COMMENT 'egg', -- egg
	wing     CHAR(1)     NULL COMMENT 'wing', -- wing
	horn     CHAR(1)     NULL COMMENT 'horn', -- horn
	teeth    CHAR(1)     NULL COMMENT 'teeth', -- teeth
	howling  CHAR(1)     NULL COMMENT 'howling', -- howling
	meet     CHAR(1)     NULL COMMENT 'meet', -- meet
	tree     CHAR(1)     NULL COMMENT 'tree' -- tree
)
COMMENT 'game_ex2data';

-- game_major
CREATE TABLE game_major (
	majrCode     INT(11)      NOT NULL, -- majrCode
	gameCodename VARCHAR(50)  NULL, -- gameCodename
	description  VARCHAR(250) NULL -- 비고
)
COMMENT 'game_major';

-- game_major
ALTER TABLE game_major
	ADD CONSTRAINT
		PRIMARY KEY (
			majrCode -- majrCode
		)
		USING BTREE;

-- UIX_game_major
CREATE UNIQUE INDEX UIX_game_major
	ON game_major ( -- game_major
		gameCodename -- gameCodename
	)
	USING BTREE;

-- game_minor
CREATE TABLE game_minor (
	gameCodeNo INT(11)     NOT NULL , -- gameCodeNo
	majrCode   INT(11)     NOT NULL , -- majrCode
	gameCode   VARCHAR(50) NULL , -- gameCode
	name       VARCHAR(50) NULL     -- name
)
COMMENT 'game_minor';

-- game_minor
ALTER TABLE game_minor
	ADD CONSTRAINT
		PRIMARY KEY (
			gameCodeNo, -- gameCodeNo
			majrCode    -- majrCode
		)
		USING BTREE;

-- UIX_game_minor
CREATE UNIQUE INDEX UIX_game_minor
	ON game_minor ( -- game_minor
		gameCode -- gameCode
	)
	USING BTREE;

-- multitasking
CREATE TABLE multitasking (
	playdt     DATE                NOT NULL , -- 플레이일자
	playNo     INT(11) UNSIGNED    NOT NULL , -- 플레이번호
	ID         BIGINT(20) UNSIGNED NOT NULL , -- 회원번호
	r_draw     DECIMAL(10,2)       NOT NULL COMMENT 'r_draw', -- r_draw
	r_getout   DECIMAL(10,2)       NOT NULL COMMENT 'r_getout', -- r_getout
	r_drop     DECIMAL(10,2)       NOT NULL COMMENT 'r_drop', -- r_drop
	r_drop_num INT(11)             NOT NULL COMMENT 'r_drop_num', -- r_drop_num
	l_draw     DECIMAL(10,2)       NOT NULL COMMENT 'l_draw', -- l_draw
	l_getout   DECIMAL(10,2)       NOT NULL COMMENT 'l_getout', -- l_getout
	l_drop     DECIMAL(10,2)       NOT NULL COMMENT 'l_drop', -- l_drop
	l_drop_num SMALLINT(6)         NOT NULL COMMENT 'l_drop_num', -- l_drop_num
	reg_dt     INT(11)             NOT NULL COMMENT 'reg_dt' -- reg_dt
)
COMMENT 'multitasking';

-- multitasking
ALTER TABLE multitasking
	ADD CONSTRAINT
		PRIMARY KEY (
			playdt, -- 플레이일자
			playNo, -- 플레이번호
			ID      -- 회원번호
		)
		USING BTREE;

-- neuro_cdm
CREATE TABLE neuro_cdm (
	major  INT(11)       NOT NULL COMMENT 'major', -- major
	minor  INT(11)       NOT NULL COMMENT 'minor', -- minor
	name   VARCHAR(50)   NOT NULL COMMENT 'name', -- name
	short  INT(11)       NULL     DEFAULT 0 COMMENT 'short', -- short
	s_val1 VARCHAR(200)  NULL     COMMENT 's_val1', -- s_val1
	s_val2 VARCHAR(200)  NULL     COMMENT 's_val2', -- s_val2
	d_val1 DECIMAL(10,2) NULL     COMMENT 'd_val1', -- d_val1
	d_val2 DECIMAL(10,2) NULL     COMMENT 'd_val2', -- d_val2
	memo   VARCHAR(500)  NULL     COMMENT 'memo' -- memo
)
COMMENT 'neuro_cdm';

-- neuro_cdm
ALTER TABLE neuro_cdm
	ADD CONSTRAINT
		PRIMARY KEY (
			major, -- major
			minor  -- minor
		)
		USING BTREE;

-- idx1
CREATE INDEX idx1
	ON neuro_cdm( -- neuro_cdm
		major, -- major
		minor, -- minor
		short  -- short
	)
	USING BTREE;

-- neuro_tr_dash
CREATE TABLE neuro_tr_dash (
	dash_no    BIGINT(20)    NOT NULL COMMENT 'dash_no', -- dash_no
	tr_mjr     INT(11)       NOT NULL COMMENT 'tr_mjr', -- tr_mjr
	tr_mir     INT(11)       NOT NULL DEFAULT 0 COMMENT 'tr_mir', -- tr_mir
	tr_dt      DATE          NOT NULL COMMENT 'tr_dt', -- tr_dt
	lv         INT(11)       NULL     DEFAULT 1 COMMENT 'lv', -- lv
	sex        CHAR(1)       NULL     DEFAULT 'M' COMMENT 'sex', -- sex
	generation INT(11)       NULL     DEFAULT 0 COMMENT 'generation', -- generation
	name       VARCHAR(40)   NULL     COMMENT 'name', -- name
	pint       DECIMAL(10,2) NULL     DEFAULT 0.00 COMMENT 'pint', -- pint
	pavg       DECIMAL(10,2) NULL     DEFAULT 0.00 COMMENT 'pavg', -- pavg
	cnt        INT(11)       NULL     DEFAULT 0 COMMENT 'cnt' -- cnt
)
COMMENT 'neuro_tr_dash';

-- neuro_tr_dash
ALTER TABLE neuro_tr_dash
	ADD CONSTRAINT
		PRIMARY KEY (
			dash_no -- dash_no
		)
		USING BTREE;

-- idx1
CREATE INDEX idx1
	ON neuro_tr_dash( -- neuro_tr_dash
		tr_mjr, -- tr_mjr
		tr_dt,  -- tr_dt
		sex,    -- sex
		lv      -- lv
	)
	USING BTREE;

-- idx2
CREATE INDEX idx2
	ON neuro_tr_dash( -- neuro_tr_dash
		tr_mjr -- tr_mjr
	)
	USING BTREE;

-- idx3
CREATE INDEX idx3
	ON neuro_tr_dash( -- neuro_tr_dash
		tr_mjr, -- tr_mjr
		tr_dt   -- tr_dt
	)
	USING BTREE;

-- idx4
CREATE INDEX idx4
	ON neuro_tr_dash( -- neuro_tr_dash
		tr_mjr, -- tr_mjr
		tr_dt,  -- tr_dt
		lv      -- lv
	)
	USING BTREE;

ALTER TABLE neuro_tr_dash
	MODIFY COLUMN dash_no BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'dash_no';

ALTER TABLE neuro_tr_dash
	AUTO_INCREMENT = 1;

-- neuro_usermeta
CREATE TABLE usermeta (
	umeta_id   BIGINT(20) UNSIGNED NOT NULL COMMENT 'umeta_id', -- umeta_id
	ID         BIGINT(20) UNSIGNED NOT NULL , -- 회원번호
	user_id    BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'user_id', -- user_id
	meta_key   VARCHAR(255)        NULL     COMMENT 'meta_key', -- meta_key
	meta_value LONGTEXT            NULL     COMMENT 'meta_value' -- meta_value
)
COMMENT 'neuro_usermeta';

-- neuro_usermeta
ALTER TABLE usermeta
	ADD CONSTRAINT
		PRIMARY KEY (
			umeta_id, -- umeta_id
			ID        -- 회원번호
		)
		USING BTREE;

-- meta_key
CREATE INDEX meta_key
	ON usermeta( -- neuro_usermeta
		meta_key -- meta_key
	)
	USING BTREE;

-- user_id
CREATE INDEX user_id
	ON usermeta( -- neuro_usermeta
		user_id -- user_id
	)
	USING BTREE;

ALTER TABLE usermeta
	MODIFY COLUMN umeta_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'umeta_id';

ALTER TABLE usermeta
	AUTO_INCREMENT = 1;

-- 회원
CREATE TABLE users (
	ID                  BIGINT(20) UNSIGNED NOT NULL COMMENT '회원번호', -- 회원번호
	user_login          VARCHAR(60)         NOT NULL DEFAULT '' COMMENT '아이디', -- 아이디
	user_pass           VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '비밀번호', -- 비밀번호
	user_nicename       VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '이름', -- 이름
	user_email          VARCHAR(100)        NOT NULL DEFAULT '' COMMENT '이메일', -- 이메일
	user_url            VARCHAR(100)        NOT NULL DEFAULT '' COMMENT '홈페이지', -- 홈페이지
	user_registered     DATETIME            NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '등록일', -- 등록일
	user_activation_key VARCHAR(255)        NOT NULL DEFAULT '' COMMENT 'user_activation_key', -- user_activation_key
	user_status         INT(11)             NOT NULL DEFAULT 0 COMMENT '상태', -- 상태
	display_name        VARCHAR(250)        NOT NULL DEFAULT '' COMMENT '출력명', -- 출력명
	sex                 CHAR(1)             NULL     COMMENT '성별', -- 성별
	hp                  VARCHAR(20)         NULL     COMMENT '전화번호', -- 전화번호
	birth               VARCHAR(8)          NULL     COMMENT '생일', -- 생일
	hp_tp               CHAR(1)             NULL     COMMENT '폰종류', -- 폰종류
	push_key            VARCHAR(40)         NULL     COMMENT 'push_key', -- push_key
	pre_id              VARCHAR(60)         NULL     COMMENT '이전아이디', -- 이전아이디
	out_dt              DATE                NULL     COMMENT '탈퇴일', -- 탈퇴일
	is_all_age          CHAR(1)             NOT NULL DEFAULT 'N' COMMENT '생일전체선택여부', -- 생일전체선택여부
	is_all_sex          CHAR(1)             NOT NULL DEFAULT 'N' COMMENT '성별전체선택여부' -- 성별전체선택여부
)
COMMENT 'neuro_users';

-- 회원
ALTER TABLE users
	ADD CONSTRAINT
		PRIMARY KEY (
			ID -- 회원번호
		)
		USING BTREE;

-- user_email
CREATE INDEX user_email
	ON users( -- 회원
		user_email -- 이메일
	)
	USING BTREE;

-- user_login_key
CREATE INDEX user_login_key
	ON users( -- 회원
		user_login -- 아이디
	)
	USING BTREE;

-- user_nicename
CREATE INDEX user_nicename
	ON users( -- 회원
		user_nicename -- 이름
	)
	USING BTREE;

ALTER TABLE users
	MODIFY COLUMN ID BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '회원번호';

ALTER TABLE users
	AUTO_INCREMENT = 1;

-- neuro_users_h
CREATE TABLE users_h (
	ID         BIGINT(20) UNSIGNED NOT NULL COMMENT '회원번호', -- 회원번호
	meta_key   VARCHAR(20)         NOT NULL COMMENT 'meta_key', -- meta_key
	meta_value INT(11)             NULL     COMMENT 'meta_value' -- meta_value
)
COMMENT 'neuro_users_h';

-- neuro_users_h
ALTER TABLE users_h
	ADD CONSTRAINT
		PRIMARY KEY (
			ID,       -- 회원번호
			meta_key  -- meta_key
		)
		USING BTREE;

-- 회원게임결과통계
CREATE TABLE user_stat (
	ID         BIGINT(20) UNSIGNED NOT NULL , -- 회원번호
	no         INT(11)             NOT NULL, -- 통계번호
	gubun      INT(11)             NOT NULL , -- 구분
	majrCode   INT(11)             NULL     , -- 대분류
	gameCodeNo INT(11)             NULL  , -- 게임코드
	dt         VARCHAR(8)          NULL     COMMENT 'dt', -- 일자
	lv         SMALLINT(6)         NULL     COMMENT 'lv', -- 레벨
	cnt        INT(11)             NULL     COMMENT 'cnt', -- 게임수
	v_nm       VARCHAR(20)         NULL     COMMENT 'v_nm', -- v_nm
	cdy        VARCHAR(8)          NULL     COMMENT 'cdy', -- cdy
	fin_dt     DATE                NULL     COMMENT 'fin_dt' -- fin_dt
)
COMMENT 'neuro_user_stat';

-- 회원게임결과통계
ALTER TABLE user_stat
	ADD CONSTRAINT
		PRIMARY KEY (
			ID, -- 회원번호
			no  -- 통계번호
		)
		USING BTREE;

-- idx1
CREATE INDEX idx1
	ON user_stat( -- 회원게임결과통계
		gubun -- 구분
	)
	USING BTREE;

-- idx3
CREATE INDEX idx3
	ON user_stat( -- 회원게임결과통계
		gubun, -- 구분
		dt     -- 일자
	)
	USING BTREE;

ALTER TABLE user_stat
	MODIFY COLUMN no INT(11) NOT NULL AUTO_INCREMENT COMMENT 'no';

ALTER TABLE user_stat
	AUTO_INCREMENT = 1;

-- playdata
CREATE TABLE playdata (
	playdt     DATE                NOT NULL , -- 플레이일자
	ID         BIGINT(20) UNSIGNED NOT NULL , -- 회원번호
	playNo     INT(11) UNSIGNED    NOT NULL , -- 플레이번호
	majrCode   INT(11)             NULL     COMMENT 'majrCode', -- majrCode
	gameCodeNo INT(11)             NULL     COMMENT 'gameCodeNo', -- gameCodeNo
	lvl        INT(11)             NOT NULL DEFAULT 1 COMMENT 'lvl', -- lvl
	playtime   DOUBLE              NULL     DEFAULT 0 COMMENT 'playtime', -- playtime
	allData    TEXT                NULL     COMMENT 'allData', -- allData
	regdt      DATETIME            NOT NULL COMMENT 'regdt' -- regdt
)
COMMENT 'playdata';

-- playdata
ALTER TABLE playdata
	ADD CONSTRAINT
		PRIMARY KEY (
			playdt, -- 플레이일자
			ID,     -- 회원번호
			playNo  -- 플레이번호
		)
		USING BTREE;

-- playdt
CREATE INDEX playdt
	ON playdata( -- playdata
		playdt, -- 플레이일자
		playNo  -- 플레이번호
	)
	USING BTREE;

-- playNo
CREATE INDEX playNo
	ON playdata( -- playdata
		playNo -- 플레이번호
	)
	USING BTREE;

ALTER TABLE playdata
	MODIFY COLUMN playNo INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ;

ALTER TABLE playdata
	AUTO_INCREMENT = 1;

-- training
CREATE TABLE training (
	playdt      DATE                NOT NULL, -- 플레이일자
	playNo      INT(11) UNSIGNED    NOT NULL , -- 플레이번호
	ID          BIGINT(20) UNSIGNED NOT NULL , -- 회원번호
	train_con   VARCHAR(200)        NOT NULL COMMENT 'train_con', -- train_con
	finish_flag CHAR(1)             NOT NULL DEFAULT 'Y'  -- finish_flag
)
COMMENT 'training';

-- training
ALTER TABLE training
	ADD CONSTRAINT
		PRIMARY KEY (
			playdt, -- 플레이일자
			playNo, -- 플레이번호
			ID      -- 회원번호
		)
		USING BTREE;

-- 병원
CREATE TABLE tab_hosp (
	hosp_no  INT                NOT NULL COMMENT 'hosp_no', -- hosp_no
	hosp_nm  varchar(50)        NULL     COMMENT 'hosp_nm', -- hosp_nm
	hosp_tel <데이터 타입 없음> NULL     COMMENT '전화번호' -- 전화번호
)
COMMENT '병원';

-- 병원
ALTER TABLE tab_hosp
	ADD CONSTRAINT PK_tab_hosp -- 병원 기본키
		PRIMARY KEY (
			hosp_no -- hosp_no
		);

-- 치료사
CREATE TABLE tab_thrp (
	ID      BIGINT(20) UNSIGNED NOT NULL COMMENT '회원번호', -- 회원번호
	hosp_no INT                 NULL     COMMENT 'hosp_no' -- hosp_no
)
COMMENT '치료사';

-- 치료사
ALTER TABLE tab_thrp
	ADD CONSTRAINT PK_tab_thrp -- 치료사 기본키
		PRIMARY KEY (
			ID -- 회원번호
		);

-- 환자
CREATE TABLE TABLE (
	ID  BIGINT(20) UNSIGNED NOT NULL COMMENT '회원번호', -- 회원번호
	COL <데이터 타입 없음>  NULL     COMMENT '환자번호' -- 환자번호
)
COMMENT '환자';

-- 환자
ALTER TABLE TABLE
	ADD CONSTRAINT PK_TABLE -- 환자 기본키
		PRIMARY KEY (
			ID -- 회원번호
		);

-- game_minor
ALTER TABLE game_minor
	ADD CONSTRAINT FK_game_major_TO_game_minor -- game_major -> game_minor
		FOREIGN KEY (
			majrCode -- majrCode
		)
		REFERENCES game_major ( -- game_major
			majrCode -- majrCode
		);

-- multitasking
ALTER TABLE multitasking
	ADD CONSTRAINT FK_playdata_TO_multitasking -- playdata -> multitasking
		FOREIGN KEY (
			playdt, -- 플레이일자
			ID,     -- 회원번호
			playNo  -- 플레이번호
		)
		REFERENCES playdata ( -- playdata
			playdt, -- 플레이일자
			ID,     -- 회원번호
			playNo  -- 플레이번호
		);

-- neuro_usermeta
ALTER TABLE usermeta
	ADD CONSTRAINT FK_users_TO_usermeta -- 회원 -> neuro_usermeta
		FOREIGN KEY (
			ID -- 회원번호
		)
		REFERENCES users ( -- 회원
			ID -- 회원번호
		);

-- neuro_users_h
ALTER TABLE users_h
	ADD CONSTRAINT FK_users_TO_users_h -- 회원 -> neuro_users_h
		FOREIGN KEY (
			ID -- 회원번호
		)
		REFERENCES users ( -- 회원
			ID -- 회원번호
		);

-- 회원게임결과통계
ALTER TABLE user_stat
	ADD CONSTRAINT FK_users_TO_user_stat -- 회원 -> 회원게임결과통계
		FOREIGN KEY (
			ID -- 회원번호
		)
		REFERENCES users ( -- 회원
			ID -- 회원번호
		);

-- playdata
ALTER TABLE playdata
	ADD CONSTRAINT FK_game_minor_TO_playdata -- game_minor -> playdata
		FOREIGN KEY (
			gameCodeNo, -- gameCodeNo
			majrCode    -- majrCode
		)
		REFERENCES game_minor ( -- game_minor
			gameCodeNo, -- gameCodeNo
			majrCode    -- majrCode
		);

-- playdata
ALTER TABLE playdata
	ADD CONSTRAINT FK_users_TO_playdata -- 회원 -> playdata
		FOREIGN KEY (
			ID -- 회원번호
		)
		REFERENCES users ( -- 회원
			ID -- 회원번호
		);

-- training
ALTER TABLE training
	ADD CONSTRAINT FK_playdata_TO_training -- playdata -> training
		FOREIGN KEY (
			playdt, -- 플레이일자
			ID,     -- 회원번호
			playNo  -- 플레이번호
		)
		REFERENCES playdata ( -- playdata
			playdt, -- 플레이일자
			ID,     -- 회원번호
			playNo  -- 플레이번호
		);

-- 치료사
ALTER TABLE tab_thrp
	ADD CONSTRAINT FK_users_TO_tab_thrp -- 회원 -> 치료사
		FOREIGN KEY (
			ID -- 회원번호
		)
		REFERENCES users ( -- 회원
			ID -- 회원번호
		);

-- 치료사
ALTER TABLE tab_thrp
	ADD CONSTRAINT FK_tab_hosp_TO_tab_thrp -- 병원 -> 치료사
		FOREIGN KEY (
			hosp_no -- hosp_no
		)
		REFERENCES tab_hosp ( -- 병원
			hosp_no -- hosp_no
		);

-- 환자
ALTER TABLE TABLE
	ADD CONSTRAINT FK_tab_thrp_TO_TABLE -- 치료사 -> 환자
		FOREIGN KEY (
			ID -- 회원번호
		)
		REFERENCES tab_thrp ( -- 치료사
			ID -- 회원번호
		);
