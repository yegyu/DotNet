
/* Drop Triggers */

DROP TRIGGER TRI_dn_board_s_num;
DROP TRIGGER TRI_dn_member_mem_num;
DROP TRIGGER TRI_dn_s_eight_eight_id;
DROP TRIGGER TRI_dn_s_feed_feed_id;
DROP TRIGGER TRI_dn_s_five_five_id;
DROP TRIGGER TRI_dn_s_part_feed_part_num_f;
DROP TRIGGER TRI_dn_s_part_part_num;
DROP TRIGGER TRI_dn_s_part_temp_part_num_t;
DROP TRIGGER TRI_dn_s_sel_sel_id;
DROP TRIGGER TRI_dn_s_two_two_id;



/* Drop Tables */

DROP TABLE dn_s_eight CASCADE CONSTRAINTS;
DROP TABLE dn_s_five CASCADE CONSTRAINTS;
DROP TABLE dn_s_part CASCADE CONSTRAINTS;
DROP TABLE dn_s_part_temp CASCADE CONSTRAINTS;
DROP TABLE dn_s_sel CASCADE CONSTRAINTS;
DROP TABLE dn_s_two CASCADE CONSTRAINTS;
DROP TABLE dn_board CASCADE CONSTRAINTS;
DROP TABLE dn_boardtype CASCADE CONSTRAINTS;
DROP TABLE dn_category CASCADE CONSTRAINTS;
DROP TABLE dn_comment CASCADE CONSTRAINTS;
DROP TABLE dn_friend CASCADE CONSTRAINTS;
DROP TABLE dn_goodstrade CASCADE CONSTRAINTS;
DROP TABLE dn_goods CASCADE CONSTRAINTS;
DROP TABLE dn_s_part_feed CASCADE CONSTRAINTS;
DROP TABLE dn_member CASCADE CONSTRAINTS;
DROP TABLE dn_message CASCADE CONSTRAINTS;
DROP TABLE dn_surveytype CASCADE CONSTRAINTS;
DROP TABLE dn_s_feed CASCADE CONSTRAINTS;
DROP TABLE dn_tradestate CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_dn_board_s_num;
DROP SEQUENCE SEQ_dn_member_mem_num;
DROP SEQUENCE SEQ_dn_s_eight_eight_id;
DROP SEQUENCE SEQ_dn_s_feed_feed_id;
DROP SEQUENCE SEQ_dn_s_five_five_id;
DROP SEQUENCE SEQ_dn_s_part_feed_part_num_f;
DROP SEQUENCE SEQ_dn_s_part_part_num;
DROP SEQUENCE SEQ_dn_s_part_temp_part_num_t;
DROP SEQUENCE SEQ_dn_s_sel_sel_id;
DROP SEQUENCE SEQ_dn_s_two_two_id;




/* Create Sequences */

CREATE SEQUENCE SEQ_dn_board_s_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_dn_member_mem_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_dn_s_eight_eight_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_dn_s_feed_feed_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_dn_s_five_five_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_dn_s_part_feed_part_num_f INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_dn_s_part_part_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_dn_s_part_temp_part_num_t INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_dn_s_sel_sel_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_dn_s_two_two_id INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE dn_board
(
	s_num number NOT NULL,
	b_tp_num number NOT NULL,
	ct_num number NOT NULL,
	s_tp_num number NOT NULL,
	subject varchar2(500) NOT NULL,
	writer varchar2(100) NOT NULL,
	thumb_path varchar2(1000),
	point number NOT NULL,
	hits number NOT NULL,
	partnum number NOT NULL,
	s_date date NOT NULL,
	PRIMARY KEY (s_num)
);


CREATE TABLE dn_boardtype
(
	b_tp_num number NOT NULL,
	b_tp_name varchar2(100) NOT NULL,
	PRIMARY KEY (b_tp_num)
);


CREATE TABLE dn_category
(
	ct_num number NOT NULL,
	ct_name varchar2(100) NOT NULL,
	PRIMARY KEY (ct_num)
);


CREATE TABLE dn_comment
(
	mem_id varchar2(100) NOT NULL,
	s_num number NOT NULL,
	content varchar2(2000) NOT NULL,
	dt date NOT NULL,
	state number NOT NULL
);


CREATE TABLE dn_friend
(
	f_num number NOT NULL,
	f_st number NOT NULL,
	req_mem_id varchar2(100) NOT NULL,
	req_date date NOT NULL,
	res_mem_id varchar2(100) NOT NULL,
	res_date date,
	PRIMARY KEY (f_num)
);


CREATE TABLE dn_goods
(
	g_num number NOT NULL,
	g_name varchar2(100) NOT NULL,
	g_point number NOT NULL,
	PRIMARY KEY (g_num)
);


CREATE TABLE dn_goodstrade
(
	t_num number NOT NULL,
	mem_id varchar2(100) NOT NULL,
	g_num number NOT NULL,
	g_cnt number(5,0) NOT NULL,
	t_date date NOT NULL,
	tst_num number NOT NULL,
	PRIMARY KEY (t_num)
);


CREATE TABLE dn_member
(
	mem_num number NOT NULL,
	id varchar2(100) NOT NULL UNIQUE,
	passwd varchar2(100) NOT NULL,
	gender number NOT NULL,
	age number NOT NULL,
	zipcode number NOT NULL,
	address varchar2(1000) NOT NULL,
	addressdetail varchar2(1000),
	location varchar2(100) NOT NULL,
	email varchar2(100) NOT NULL,
	signup_date date NOT NULL,
	point number NOT NULL,
	user_state number NOT NULL,
	PRIMARY KEY (mem_num)
);


CREATE TABLE dn_message
(
	m_num number NOT NULL,
	m_title varchar2(100) NOT NULL,
	m_content varchar2(2000) NOT NULL,
	s_mem_id varchar2(100) NOT NULL,
	s_mem_del_st number NOT NULL,
	r_mem_id varchar2(100) NOT NULL,
	r_mem_del_st number NOT NULL,
	m_date date NOT NULL,
	PRIMARY KEY (m_num)
);


CREATE TABLE dn_surveytype
(
	s_tp_num number NOT NULL,
	s_tp_name varchar2(100) NOT NULL,
	PRIMARY KEY (s_tp_num)
);


CREATE TABLE dn_s_eight
(
	eight_id number NOT NULL,
	s_num number NOT NULL,
	q_num number NOT NULL,
	q_content varchar2(500) NOT NULL,
	sel1_content varchar2(500) NOT NULL,
	sel2_content varchar2(500) NOT NULL,
	sel3_content varchar2(500) NOT NULL,
	sel4_content varchar2(500) NOT NULL,
	PRIMARY KEY (eight_id)
);


CREATE TABLE dn_s_feed
(
	feed_id number NOT NULL,
	feed_type number NOT NULL,
	sel_num number NOT NULL,
	sel_content varchar2(500) NOT NULL,
	img_path varchar2(1000) NOT NULL,
	PRIMARY KEY (feed_id)
);


CREATE TABLE dn_s_five
(
	five_id number NOT NULL,
	s_num number NOT NULL,
	q_num number NOT NULL,
	q_content varchar2(500) NOT NULL,
	sel1_content varchar2(500) NOT NULL,
	sel2_content varchar2(500) NOT NULL,
	sel3_content varchar2(500) NOT NULL,
	sel4_content varchar2(500) NOT NULL,
	sel5_content varchar2(500) NOT NULL,
	PRIMARY KEY (five_id)
);


CREATE TABLE dn_s_part
(
	part_num number NOT NULL,
	mem_id varchar2(100) NOT NULL,
	s_num number NOT NULL,
	q_num number NOT NULL,
	cho_num number NOT NULL,
	part_date date NOT NULL,
	PRIMARY KEY (part_num)
);


CREATE TABLE dn_s_part_feed
(
	part_num_f number NOT NULL,
	id varchar2(100) NOT NULL,
	feed_type number NOT NULL,
	cho_num number NOT NULL,
	PRIMARY KEY (part_num_f)
);


CREATE TABLE dn_s_part_temp
(
	part_num_t number NOT NULL,
	id varchar2(100) NOT NULL,
	s_num number NOT NULL,
	q_num number NOT NULL,
	cho_num number NOT NULL,
	PRIMARY KEY (part_num_t)
);


CREATE TABLE dn_s_sel
(
	sel_id number NOT NULL,
	mem_id varchar2(100) NOT NULL,
	s_num number NOT NULL,
	q_num number NOT NULL,
	sel_num number NOT NULL,
	gender number NOT NULL,
	age number NOT NULL,
	location varchar2(100) NOT NULL,
	PRIMARY KEY (sel_id)
);


CREATE TABLE dn_s_two
(
	two_id number NOT NULL,
	s_num number NOT NULL,
	q1 varchar2(2000),
	imgname1 varchar2(1000),
	imgname2 varchar2(1000),
	q2 varchar2(2000),
	imgname3 varchar2(1000),
	imgname4 varchar2(1000),
	q3 varchar2(2000),
	imgname5 varchar2(1000),
	imgname6 varchar2(1000),
	q4 varchar2(2000),
	imgname7 varchar2(1000),
	imgname8 varchar2(1000),
	q5 varchar2(2000),
	imgname9 varchar2(1000),
	imgname10 varchar2(1000),
	PRIMARY KEY (two_id)
);


CREATE TABLE dn_tradestate
(
	tst_num number NOT NULL,
	tst_name varchar2(100) NOT NULL,
	PRIMARY KEY (tst_num)
);



/* Create Foreign Keys */

ALTER TABLE dn_s_eight
	ADD FOREIGN KEY (s_num)
	REFERENCES dn_board (s_num)
;


ALTER TABLE dn_s_five
	ADD FOREIGN KEY (s_num)
	REFERENCES dn_board (s_num)
;


ALTER TABLE dn_s_part
	ADD FOREIGN KEY (s_num)
	REFERENCES dn_board (s_num)
;


ALTER TABLE dn_s_part_temp
	ADD FOREIGN KEY (s_num)
	REFERENCES dn_board (s_num)
;


ALTER TABLE dn_s_sel
	ADD FOREIGN KEY (s_num)
	REFERENCES dn_board (s_num)
;


ALTER TABLE dn_s_two
	ADD FOREIGN KEY (s_num)
	REFERENCES dn_board (s_num)
;


ALTER TABLE dn_board
	ADD FOREIGN KEY (b_tp_num)
	REFERENCES dn_boardtype (b_tp_num)
;


ALTER TABLE dn_board
	ADD FOREIGN KEY (ct_num)
	REFERENCES dn_category (ct_num)
;


ALTER TABLE dn_goodstrade
	ADD FOREIGN KEY (g_num)
	REFERENCES dn_goods (g_num)
;


ALTER TABLE dn_board
	ADD FOREIGN KEY (writer)
	REFERENCES dn_member (id)
;


ALTER TABLE dn_goodstrade
	ADD FOREIGN KEY (mem_id)
	REFERENCES dn_member (id)
;


ALTER TABLE dn_s_part
	ADD FOREIGN KEY (mem_id)
	REFERENCES dn_member (id)
;


ALTER TABLE dn_s_part_feed
	ADD FOREIGN KEY (id)
	REFERENCES dn_member (id)
;


ALTER TABLE dn_s_sel
	ADD FOREIGN KEY (mem_id)
	REFERENCES dn_member (id)
;


ALTER TABLE dn_board
	ADD FOREIGN KEY (s_tp_num)
	REFERENCES dn_surveytype (s_tp_num)
;


ALTER TABLE dn_goodstrade
	ADD FOREIGN KEY (tst_num)
	REFERENCES dn_tradestate (tst_num)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_dn_board_s_num BEFORE INSERT ON dn_board
FOR EACH ROW
BEGIN
	SELECT SEQ_dn_board_s_num.nextval
	INTO :new.s_num
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_dn_member_mem_num BEFORE INSERT ON dn_member
FOR EACH ROW
BEGIN
	SELECT SEQ_dn_member_mem_num.nextval
	INTO :new.mem_num
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_dn_s_eight_eight_id BEFORE INSERT ON dn_s_eight
FOR EACH ROW
BEGIN
	SELECT SEQ_dn_s_eight_eight_id.nextval
	INTO :new.eight_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_dn_s_feed_feed_id BEFORE INSERT ON dn_s_feed
FOR EACH ROW
BEGIN
	SELECT SEQ_dn_s_feed_feed_id.nextval
	INTO :new.feed_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_dn_s_five_five_id BEFORE INSERT ON dn_s_five
FOR EACH ROW
BEGIN
	SELECT SEQ_dn_s_five_five_id.nextval
	INTO :new.five_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_dn_s_part_feed_part_num_f BEFORE INSERT ON dn_s_part_feed
FOR EACH ROW
BEGIN
	SELECT SEQ_dn_s_part_feed_part_num_f.nextval
	INTO :new.part_num_f
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_dn_s_part_part_num BEFORE INSERT ON dn_s_part
FOR EACH ROW
BEGIN
	SELECT SEQ_dn_s_part_part_num.nextval
	INTO :new.part_num
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_dn_s_part_temp_part_num_t BEFORE INSERT ON dn_s_part_temp
FOR EACH ROW
BEGIN
	SELECT SEQ_dn_s_part_temp_part_num_t.nextval
	INTO :new.part_num_t
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_dn_s_sel_sel_id BEFORE INSERT ON dn_s_sel
FOR EACH ROW
BEGIN
	SELECT SEQ_dn_s_sel_sel_id.nextval
	INTO :new.sel_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_dn_s_two_two_id BEFORE INSERT ON dn_s_two
FOR EACH ROW
BEGIN
	SELECT SEQ_dn_s_two_two_id.nextval
	INTO :new.two_id
	FROM dual;
END;

/




