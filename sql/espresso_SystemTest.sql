set names utf8;
set foreign_key_checks=0;

drop database if exists espresso;
create database if not exists espresso;

use espresso;

create table user_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) unique not null comment "ユーザーID",
password varchar(16) not null comment "パスワード",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
sex tinyint default 0 comment "性別",
email varchar(32) comment "メールアドレス",
status tinyint default 0 comment "ステータス",
logined tinyint not null default 0 comment "ログインフラグ",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時"
)
default charset=utf8
comment="会員情報テーブル"
;

create table product_info(
id int primary key not null auto_increment comment "ID",
product_id int unique not null comment "商品ID",
product_name varchar(100) unique not null comment "商品名",
product_name_kana varchar(100) unique not null comment "商品名かな",
product_description varchar(255) comment "商品詳細",
category_id int not null comment "カテゴリID",
price int not null comment "値段",
image_file_path varchar(100) not null comment "画像ファイルパス",
image_file_name varchar(50) not null comment "画像ファイル名",
release_date datetime comment "発売年月",
release_company varchar(50) comment "発売会社",
status tinyint default 1 comment "ステータス",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key(category_id) references m_category(category_id)
)
default charset=utf8
comment="商品情報テーブル";

create table cart_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key(product_id) references product_info(product_id)
)
default charset=utf8
comment="カート情報テーブル"
;

create table purchase_history_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
price int not null comment "値段",
destination_id int not null comment "宛先情報ID",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key(user_id) references user_info(user_id),
foreign key(product_id) references product_info(product_id)
)
default charset=utf8
comment="購入履歴情報テーブル"
;

create table destination_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
email varchar(32) comment "メールアドレス",
tel_number varchar(13) comment "電話番号",
user_address varchar(50) not null comment "住所",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key(user_id) references user_info(user_id)
)
default charset=utf8
comment="宛先情報テーブル"
;

create table m_category(
id int primary key not null auto_increment comment "ID",
category_id int not null unique comment "カテゴリID",
category_name varchar(20) not null unique comment "カテゴリ名",
category_description varchar(100) comment "カテゴリ詳細",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時"
)
default charset=utf8
comment="カテゴリマスタテーブル"
;

set foreign_key_checks=1;


INSERT INTO user_info VALUES
(1,"guest","guest","インターノウス","ゲストユーザー1","いんたーのうす","げすとゆーざー1",0,"internous.guest@guest.com",0,0,now(),now()),
(2,"guest2","guest2","インターノウス","ゲストユーザー2","いんたーのうす","げすとゆーざー2",0,"internous.guest2@guest.com",0,0,now(),now());


INSERT INTO m_category(category_id,category_name,regist_date)
VALUES(1,"全てのカテゴリー",now()),
(2,"本",now()),
(3,"家電・パソコン",now()),
(4,"おもちゃ・ゲーム",now()),
(5,"CD",now());


INSERT INTO product_info VALUES
(1,1,"マンガ","まんが","マンガの商品詳細です。",2,450,"./images/book/comic.png","comic.png",now(),"internous",1,now(),now()),
(2,2,"古今和歌集","こきんわかしゅう","古今和歌集の商品詳細です。",2,1800,"./images/book/kokinwakasyu.png","kokinwakasyu.png",now(),"internous",1,now(),now()),
(3,3,"楽譜","がくふ","楽譜の商品詳細です。",2,1000,"./images/book/musicalscore.png","musicalscore.png",now(),"internous",1,now(),now()),
(4,6,"ゲーミングマウス","げーみんぐまうす","ゲーミングマウスの商品詳細です。",3,1500,"./images/appliances/gamingmouse.png","gamingmouse.png",now(),"internous",1,now(),now()),
(5,7,"ノートパソコン","のーとぱそこん","ノートパソコンの商品詳細です。",3,100000,"./images/appliances/laptop.png","laptop.png",now(),"internous",1,now(),now()),
(6,8,"電子レンジ","でんしれんじ","電子レンジの商品詳細です。",3,10000,"./images/appliances/microwave.png","microwave.png",now(),"internous",1,now(),now()),
(7,9,"冷蔵庫","れいぞうこ","冷蔵庫の商品詳細です。",3,50000,"./images/appliances/refrigerator.png","refrigerator.png",now(),"internous",1,now(),now()),
(8,11,"積み木","つみき","積み木の商品詳細です。",4,880,"./images/toy/buildingblocks.png","buildingblocks.png",now(),"internous",1,now(),now()),
(9,12,"オセロ","おせろ","オセロの商品詳細です。",4,1200,"./images/game/othello.png","othello.png",now(),"internous",1,now(),now()),
(10,13,"ラジコン","らじこん","ラジコンの商品詳細です。",4,3980,"./images/toy/radicon.png","radicon.png",now(),"internous",1,now(),now()),
(11,14,"育成ゲーム","いくせいげーむ","育成ゲームの商品詳細です。",4,4980,"./images/game/growinggame.png","growinggame.png",now(),"internous",1,now(),now()),
(12,15,"VRゲーム","ぶいあーるげーむ","VRゲームの商品詳細です。",4,7980,"./images/game/vr.png","vr.png",now(),"internous",1,now(),now()),
(13,16,"クラシック","くらしっく","クラシックの商品詳細です。",5,1500,"./images/cd/cd1.png","cd1.png",now(),"internous",1,now(),now());

INSERT INTO destination_info VALUES
(1,"guest","インターノウス","ゲストユーザー","いんたーのうす","げすとゆーざー","internous.guest@gmail.com","09000000000","東京都千代田区霞が関3-6-15",now(),now());