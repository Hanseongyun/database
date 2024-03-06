#1
INSERT INTO user 
VALUES ('email@email.com', 'P!ssw0rd', 'rose', '010-1234-5678', '부산광역시 사하구', '낙동대로', NULL, true);
#2
UPDATE user SET profile_image = 'https://cdn.onews.tv/news/photo/202103/62559_62563_456.jpg'
WHERE email = 'email@email.com';
#3
INSERT INTO board (title, contents, writer_email)
VALUES ('첫번째 게시물' , '반갑습니다. 처음뵙겠습니다.', 'email2@email.com');
# writer_email 컬럼은 user 테이블의 기본키인 email의 참조를 받고 있기 때문에 변경할 수 없다.
#4
INSERT INTO board (title, contents, writer_email)
VALUES ('첫번째 게시물' , '반갑습니다. 처음뵙겠습니다.', 'email@email.com');
#5 ??
INSERT INTO board_image (image_url)
SELECT 'https://image.van-go.co.kr/place_main/2022/04/04/12217/035e1737735049018a2ed2964dda596c_750S.jpg' 
FROM board
WHERE board_number = 1;

#6

#7
SELECT
	board_number,
	title,
    contents,
    view_count,
    comment_count,
    favorite_count,
    write_datetime,
    writer_email,
    profile_image AS writer_profile_image,
    nickname AS writer_nickname
FROM user LEFT JOIN board
ON user.email = board.writer_email;

#8
CREATE VIEW board_view AS
SELECT
	board_number,
	title,
    contents,
    view_count,
    comment_count,
    favorite_count,
    write_datetime,
    writer_email,
    profile_image AS writer_profile_image,
    nickname AS writer_nickname
FROM user LEFT JOIN board
ON user.email = board.writer_email;

#9
SELECT * FROM board_view WHERE title = '반갑' or contents = '반갑';

#10
CREATE INDEX board_title_idx ON board (title);