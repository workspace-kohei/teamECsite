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


INSERT INTO user_info VALUES(99,"test","test1","テスト","テスト","てすと","てすと",0,"test@test.com",0,0,now(),now()),
(1,"guest","guest","ゲスト","ユーザー1","げすと","ゆーざー1",0,"guest@guest.com",0,0,now(),now()),
(2,"guest2","guest2","ゲスト","ユーザー2","げすと","ゆーざー2",0,"guest2@guest.com",0,0,now(),now()),
(3,"guest3","guest3","ゲスト","ユーザー3","げすと","ゆーざー3",0,"guest3@guest.com",0,0,now(),now()),
(4,"guest4","guest4","ゲスト","ユーザー4","げすと","ゆーざー4",0,"guest4@guest.com",0,0,now(),now()),
(5,"guest5","guest5","ゲスト","ユーザー5","げすと","ゆーざー5",0,"guest5@guest.com",0,0,now(),now()),
(6,"guest6","guest6","ゲスト","ユーザー6","げすと","ゆーざー6",0,"guest6@guest.com",0,0,now(),now()),
(7,"guest7","guest7","ゲスト","ユーザー7","げすと","ゆーざー7",0,"guest7@guest.com",0,0,now(),now()),
(8,"guest8","guest8","ゲスト","ユーザー8","げすと","ゆーざー8",0,"guest8@guest.com",0,0,now(),now()),
(9,"guest9","guest9","ゲスト","ユーザー9","げすと","ゆーざー9",0,"guest9@guest.com",0,0,now(),now()),
(10,"guest10","guest10","ゲスト","ユーザー10","げすと","ゆーざー10",0,"guest10@guest.com",0,0,now(),now()),
(11,"guest11","guest11","ゲスト","ユーザー11","げすと","ゆーざー11",0,"guest11@guest.com",0,0,now(),now()),
(12,"guest12","guest12","ゲスト","ユーザー12","げすと","ゆーざー12",0,"guest12@guest.com",0,0,now(),now());


INSERT INTO m_category(category_id,category_name,regist_date)
VALUES(1,"全てのカテゴリー",now()),
(2,"本",now()),
(3,"家電・パソコン",now()),
(4,"おもちゃ・ゲーム",now()),
(5,"CD",now());


INSERT INTO product_info(product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date)
VALUES(1,"マンガ","まんが","マンガの商品詳細です。",2,450,"./images/book/comic.png","comic.png",now(),"internous",1,now(),now()),
(2,"古今和歌集","こきんわかしゅう","古今和歌集の商品詳細です。",2,1800,"./images/book/kokinwakasyu.png","kokinwakasyu.png",now(),"internous",1,now(),now()),
(3,"楽譜","がくふ","楽譜の商品詳細です。",2,1000,"./images/book/musicalscore.png","musicalscore.png",now(),"internous",1,now(),now()),
(4,"六法全書","ろっぽうぜんしょ","六法全書の商品詳細です。",2,25000,"./images/book/roppou.png","roppou.png",now(),"internous",1,now(),now()),
(5,"ルールブック","るーるぶっく","ルールブックの商品詳細です。",2,800,"./images/book/rule.png","rule.png",now(),"internous",1,now(),now()),
(6,"ゲーミングマウス","げーみんぐまうす","ゲーミングマウスの商品詳細です。",3,1500,"./images/appliances/gamingmouse.png","gamingmouse.png",now(),"internous",1,now(),now()),
(7,"ノートパソコン","のーとぱそこん","ノートパソコンの商品詳細です。",3,100000,"./images/appliances/laptop.png","laptop.png",now(),"internous",1,now(),now()),
(8,"電子レンジ","でんしれんじ","電子レンジの商品詳細です。",3,10000,"./images/appliances/microwave.png","microwave.png",now(),"internous",1,now(),now()),
(9,"冷蔵庫","れいぞうこ","冷蔵庫の商品詳細です。",3,50000,"./images/appliances/refrigerator.png","refrigerator.png",now(),"internous",1,now(),now()),
(10,"タブレット","たぶれっと","タブレットの商品詳細です。",3,20000,"./images/appliances/tablet.png","tablet.png",now(),"internous",1,now(),now()),
(11,"積み木","つみき","積み木の商品詳細です。",4,880,"./images/toy/buildingblocks.png","buildingblocks.png",now(),"internous",1,now(),now()),
(12,"オセロ","おせろ","オセロの商品詳細です。",4,1200,"./images/game/othello.png","othello.png",now(),"internous",1,now(),now()),
(13,"ラジコン","らじこん","ラジコンの商品詳細です。",4,3980,"./images/toy/radicon.png","radicon.png",now(),"internous",1,now(),now()),
(14,"育成ゲーム","いくせいげーむ","育成ゲームの商品詳細です。",4,4980,"./images/game/growinggame.png","growinggame.png",now(),"internous",1,now(),now()),
(15,"VRゲーム","ぶいあーるげーむ","VRゲームの商品詳細です。",4,7980,"./images/game/vr.png","vr.png",now(),"internous",1,now(),now()),
(16,"クラシック","くらしっく","クラシックの商品詳細です。",5,1500,"./images/cd/cd1.png","cd1.png",now(),"internous",1,now(),now()),
(17,"JPOP","じぇーぽっぷ","JPOPの商品詳細です。",5,1200,"./images/cd/cd2.png","cd2.png",now(),"internous",1,now(),now()),
(18,"ジャズ","じゃず","ジャズの商品詳細です。",5,900,"./images/cd/cd3.png","cd3.png",now(),"internous",1,now(),now()),
(19,"ヒップホップ","ひっぷほっぷ","ヒップホップの商品詳細です。",5,1100,"./images/cd/cd4.png","cd4.png",now(),"internous",1,now(),now()),
(20,"レゲエ","れげえ","レゲエの商品詳細です。",5,1000,"./images/cd/cd5.png","cd5.png",now(),"internous",1,now(),now());

