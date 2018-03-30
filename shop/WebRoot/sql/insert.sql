

USE `shop`;
INSERT INTO customer(nickname,PASSWORD,phone,registertime)VALUES('xiaobin','4ed2ed1298fd54d909a5ad00596fd3f24151daf1909a958c19f8eef9','18220791130','2018-01-18 22:09:28');




INSERT INTO admin(adminname,adminpassword,admindate) VALUES('zhangbin','123123','20107-12-12');

DELETE FROM dictionarytype;

/*订单状态*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('orderState','待付款',1,1,'2018-01-18 22:09:28');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('orderState','取消订单',2,1,'2018-01-18 22:09:28');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('orderState','待发货',3,1,'2018-01-18 22:09:28');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('orderState','待收货',4,1,'2018-01-18 22:09:28');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('orderState','待评价',5,1,'2018-01-18 22:09:28');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('orderState','交易成功',6,1,'2018-01-18 22:09:28');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('orderState','退货退款',7,1,'2018-01-18 22:09:28');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('orderState','退款',8,1,'2018-01-18 22:09:28');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('orderState','投诉中',9,1,'2018-01-18 22:09:28');


/*商品状态*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('productState','待审核',1,1,'2018-01-18 22:09:28');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('productState','审核通过',2,1,'2018-01-18 22:09:28');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('productState','审核未通过',3,1,'2018-01-18 22:09:28');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('productState','上架',4,1,'2018-01-18 22:09:28');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('productState','库存不足',5,1,'2018-01-18 22:09:28');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('productState','下架',6,1,'2018-01-18 22:09:28');

/*商品分类一级*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth','服饰',1,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('box','箱包',1,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female','母婴',1,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('general','百货',1,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('tame','家纺',1,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty','美妆',1,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cate','美食',1,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('numeral','数码电器',1,1,'2018/1/3');


/*服饰分类*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_women','女装',2,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_man','男装',2,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_shoes','鞋子',2,1,'2018/1/3');
/*女装分类*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_women_pants','裤子',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_women_coat','外套',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_women_shirt','衬衫',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_women_skirt','裙装',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_women_knitting','针织毛衣',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_women_underwear','内衣',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_women_sock','袜子',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_women_nighty','睡衣',3,1,'2018/1/5');
/*男装分类*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_man_protect','卫衣',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_man_hepants','男裤',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_man_hecoat','外套',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_man_heknitting','针织衫',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_man_popl','popl衫',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_man_heunderwear','内衣',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_man_sock','袜子',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_man_nighty','睡衣',3,1,'2018/1/5');
/*鞋子分类*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_shoes_manlie','男士休闲鞋',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_shoes_mansneaker','男士运动鞋',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_shoes_leather','男士皮鞋',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_shoes_manbaboosh','男拖鞋',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_shoes_canvas','帆布鞋',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_shoes_high','高跟鞋',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_shoes_flattie','平底鞋',3,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cloth_shoes_martin','马丁靴',3,1,'2018/1/3');

/*箱包分类*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('box_trunk','行李箱',2,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('box_satchel','书包',2,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('box_diesis','双肩包',2,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('box_min.','迷你包',2,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('box_inclined','斜挎包',2,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('box_fist','手包',2,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('box_burse','钱包',2,1,'2018/1/3');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('box_computer','电脑包',2,1,'2018/1/3');

/*母婴分类*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_child','童装',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_childpen','儿童文具',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_bumf','纸尿裤',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_pregnant','孕妈专区',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_toy','玩具',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_childbed','童床',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_milkpowder','奶粉',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_assist','营养辅食',2,1,'2018/1/5');

/*儿童文具分类*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_childpen_pencil','铅笔',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_childpen_eraser','橡皮',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_childpen_rule','尺子',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_childpen_watercolour','水彩笔',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_childpen_sketch','素描本',3,1,'2018/1/5');

/*营养辅食*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_assist_riceflour','米粉',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_assist_autunite','钙片',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('female_assist_fish','鱼肝油',3,1,'2018/1/5');

/*百货分类*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('general_lotion','洗护清洁',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('general_receive','收纳整理',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('general_menage','家庭清洁',2,1,'2018/1/5');

/*洗护清洁*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('general_lotion_launder','洗衣液',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('general_lotion_shampoo','洗发水',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('general_lotion_cleanser','清洁剂',3,1,'2018/1/5');

/*收纳整理*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('general_receive_take out','抽纸盒',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('general_receive_clothesrack','衣架',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('general_receive_shoesrack','鞋架',3,1,'2018/1/5');

/*家庭清洁*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('general_menage_mop','拖把',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('general_menage_junk','垃圾袋',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('general_menage_depurate','清洁布',3,1,'2018/1/5');

/*家纺分类*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_doss','床品套件',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_sheet','床单被套',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_lamp','灯具灯饰',2,1,'2018/1/5');

/*床品套件*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_doss_doss','多件套',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_doss_pillow','枕芯',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_doss_all','四件套',3,1,'2018/1/5');

/*床单被套*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_sheet_corbel','枕巾',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_sheet_sheet','床单',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_sheet_sack','睡袋',3,1,'2018/1/5');

/*灯具灯饰*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_lamp_suck','吸顶灯',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_lamp_lamp','台灯',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_lamp_little','小夜灯',3,1,'2018/1/5');

/*美妆分类*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_numeral','面部护理',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_color','彩妆香氛',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_tool','彩妆工具',2,1,'2018/1/5');

/*面部护理*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_numeral_eye','眼部护理',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_numeral_face','面膜',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_numeral_lip','唇部护理',3,1,'2018/1/5');

/*彩妆香氛*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_color_variety','彩妆',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_color_scent','香水',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_color_eyebrow','眉笔/粉',3,1,'2018/1/5');

/*彩妆工具*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_tool_eyebrow','眉眼组合',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_tool_beauty','美甲工具',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('beauty_tool_toilet','化妆棉',3,1,'2018/1/5');

/*美食分类*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cate_cake','糕点饼干',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cate_chocolate','糖果巧克力',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cate_fallow','休闲零食',2,1,'2018/1/5');

/*糕点饼干*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cate_cake_tradition','传统糕点',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cate_cake_cooky','饼干',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cate_cake_moon','月饼',3,1,'2018/1/5');

/*糖果巧克力*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cate_chocolate_goody','糖果',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cate_chocolate_chocolate','巧克力',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cate_chocolate_love','喜糖',3,1,'2018/1/5');

/*休闲零食*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cate_fallow_succotash','豆制品',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cate_fallow_bulked','膨化食品',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('cate_fallow_flesh','肉制品',3,1,'2018/1/5');

/*数码电器分类*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('numeral_handset','手机',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('numeral_computer','电脑',2,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('numeral_wiring','电器',2,1,'2018/1/5');

/*手机*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('numeral_handset_aptitude','智能机',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('numeral_handset_fittings','手机配件',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('numeral_handset_elder','老人机',3,1,'2018/1/5');

/*电脑*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('numeral_computer_notebook','笔记本',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('numeral_computer_platform','台式机',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('numeral_computer_one','一体机',3,1,'2018/1/5');

/*电器*/
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('numeral_wiring_life','生活电器',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('numeral_wiring_washer','洗衣机',3,1,'2018/1/5');
INSERT INTO dictionarytype(typecode,typename,typecodeid,adminid,typedate)VALUES('numeral_wiring_fridge','电冰箱',3,1,'2018/1/5');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('林氏木业儿童床','3238','林氏木业儿童床双层女孩多功能公主单人床儿童房家具组合套装DI5A','images/femalechildbed.jpg',275,79,0.5,4,1,'广东佛山',2,65,'female','female_childbed');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('北包包斜挎菱格小包包','59','北包包斜挎菱格小包包女韩版2018新款简约百搭迷你链条女包单肩包','images/inclinedbox2.jpg',5237,1931,0.5,2,1,'河北保定',4,2544,'box','box_inclined');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('金狐狸小方包','238','金狐狸小方包2018新款女包时尚欧美星辰单肩包迷你链条斜挎小包潮','images/inclinedbox.jpg',10565,1350,0.5,4,1,'广东广州',4,325,'box','box_inclined');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('左西童装男童卫衣春装','75','左西童装男童卫衣春装2018新款儿童长袖连帽上衣中大童春秋韩版潮','images/femalechild2.jpg',29,211,0.6,4,1,'无锡',4,215,'female','female_child');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('安奈儿童装女童无袖连衣裙','299','安奈儿童装女童无袖连衣裙2018夏季新款迪士尼公主A字裙EG823283','images/femalechild.jpg',130,215,0.6,4,1,'广东东菀',2,124,'female','female_child');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('好邻居多伴果夹心巧克力','33.8','好邻居多伴果夹心巧克力星空棒棒糖网红女友零食喜糖果批发500g','images/catechocolate.jpg',1565,6042,0.6,4,1,'福建泉州',2,2446,'cate','cate_chocolate');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('训练双肩包','269','Nike/耐克官方 NIKEBRASILIA训练双肩包（中型）BA5329','images/diesisbox.jpg',1596,1704,0.6,4,1,'上海',2,1552,'box','box_diesis');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('牛津大学书包','168','牛津大学书包男小学生3-4-6五年级男孩男童女孩女童护脊儿童背包','images/bookbox2.jpg',364,361,1.5,4,1,'上海',1,324,'box','box_satchel');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('幼儿园书包','76','幼儿园书包男童迪士尼汽车麦昆小孩2-3-5学前班儿童宝宝双肩背包','images/bookbox.jpg',178,2548,1.5,4,1,'上海',4,245,'box','box_satchel');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('真皮女士手包','238','真皮女士手包女手拿包女大容量2018新款百搭气质手抓包女包斜挎软','images/fistbox2.jpg',2349,197,1,4,1,'广东广州',8,215,'box','box_fist');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('皮尔卡丹正品手包','399','皮尔卡丹正品手包男真皮拉链鳄鱼纹软牛皮男士钱包长款休闲手拿包','images/fistbox.jpg',668,608,1,4,1,'广东广州',2,845,'box','box_fist');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('2017新款卓梵阿玛尼男士钱包','268','2017新款卓梵 阿玛尼男士钱包长款真皮潮青年手拿包男拉链手包男','images/bursebox2.jpg',542,50,1,4,1,'湖南长沙',7,356,'box','box_burse');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('皮尔卡丹正品钱包','299','皮尔卡丹正品钱包男长款商务休闲青年男士皮夹软牛皮真皮钱夹潮','images/bursebox.jpg',87,1130,1,4,1,'广东广州',4,215,'box','box_burse');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('纳兰杜2018新款真牛皮小包包','149','纳兰杜2018新款真牛皮小包包韩版迷你手机包单肩斜挎小包时尚女包','images/minibox2.jpg',1,435,1,5,1,'广东广州',2,654,'box','min_box');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('金狐狸包包女豆腐包','199','金狐狸包包女豆腐包2018新款迷你链条包韩版小方包单肩斜挎包小包','images/minibox.jpg',184,3537,1,4,1,'广东肇庆',2,545,'box','box_min');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('拉杆箱行李箱铝框旅行箱','188','拉杆箱行李箱铝框旅行箱万向轮女男26学生密码箱包20寸24皮箱子28','images/trunkbox2.jpg',1469,82026,1,4,1,'浙江温州',4,5642,'box','box_trunk');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('变色龙爱华仕拉杆箱','499','变色龙爱华仕拉杆箱男20寸旅行箱','images/trunkbox.jpg',202,1011,2,4,1,'广东惠州',2,331,'box','box_trunk');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('电脑包','41','苹果戴尔华硕13/14/15/15.6/17.3寸男女防震单肩手提笔记本电脑包','images/computerbox.jpg',367,14569,1,4,1,'上海',2,236,'box','box_computer');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('120克纯手工中秋月饼','5.5','120克纯手工中秋月饼出量饼干零食特产月饼什锦广西百色哈密瓜','images/catecakemoon.jpg',5000,3265,2,4,1,'那坡县新村食品加工厂',8,4100,'cate','cate_cake_moon');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('辣媳妇100gx5袋咔咔炝辣鸡爪子','34.99','辣媳妇100gx5袋咔咔炝辣鸡爪子重庆麻辣凤爪零食批发辣味熟食小吃','images/catemeat.jpg',4500,3265,1,4,1,'重庆',1,3456,'cate','cate_fallow_flesh');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('Polo胸包男牛津布休闲男包单肩包','139','Polo胸包男牛津布休闲男包单肩包斜背包韩版潮男士包包单肩斜挎包','images/box2.jpg',290,426,1,4,1,'广东广州',8,1645,'box','box_trunk');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('拉杆箱行李箱铝框旅行箱','188','拉杆箱行李箱铝框旅行箱万向轮女男26学生密码箱包20寸24皮箱子28','images/box.jpg',1469,82008,1,4,1,'浙江温州',4,1245,'box','box_trunk');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid,productthreeid)
VALUES      
('BUBM耳机包收纳包数据线','23','BUBM耳机包收纳包数据线充电器数码U盘蓝牙迷你便携盒袋子保护套','images/numeral2.jpg',7129,2723,1,4,1,'浙江杭洲',1,1244,'numeral','numeral_handset','numeral_handset_fittings');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid,productthreeid)
VALUES      
('iphonex无线充电器','118','iphonex无线充电器苹果x手机8plus三星s8通用QI专用原装iPhone X','images/numeral.jpg',1009,2793,1,4,1,'广东深圳',8,1265,'numeral','numeral_handset','numeral_handset_fittings');

INSERT INTO product
(productname,productprice,producttitle,productimage,productcount,productsail,productweight,productstatus,businessid,productaddress,sendtypeid,productpageview,productoneid,producttwoid)
VALUES      
('贝因美婴儿奶瓶','49','贝因美婴儿奶瓶新生儿玻璃宽口径宝宝储奶带手柄母婴用品','images/female2.jpg',1688,7583,1,4,1,'浙江杭州',2,2136,'female','female_child');




 INSERT INTO business(businessid,businessname,businessrealname,businesspassword,businessphone,businessemail,ID,businessregtime,businessscore,address,businessbankid)
 VALUES(1,'xiaobin','zhangbin','000000','18220791110','18220791110@163.com','123123123123123123','2017-12-25',NULL,'西安市雁塔区','6230270100013845200');

 INSERT INTO business(businessid,businessname,businessrealname,businesspassword,businessphone,businessemail,ID,businessregtime,businessscore,address,businessbankid)
 VALUES(2,'xiaobin','zhangbin','000000','18220791110','18220791110@163.com','123123123123123123','2017-12-25',NULL,'西安市雁塔区','6230270100013845200');
 
 
 INSERT INTO sendtype(sendtypeid,sendtypename,adminid,sendtypeDate)VALUES(1,'圆通',1,'2017-12-12');
 INSERT INTO sendtype(sendtypeid,sendtypename,adminid,sendtypeDate)VALUES(2,'中通',2,'2017-12-15');

/*查找有关商品表的资料*/
/*商品名称	价格	标题	介绍	规格	重量	商品图*/
/*商品要与类型表的三级分类对应 */

INSERT INTO address(addressname,addresssignname,addresssignphone,addressdefault,customerid,addressdate)VALUES('陕西省汉中市南郑区碑坝镇','张斌','18220791130','是',1,'2018-01-18 22:09:28');
INSERT INTO address(addressname,addresssignname,addresssignphone,addressdefault,customerid,addressdate)VALUES('陕西省汉中市南郑区大河坎中学','张斌','18220791130','否',1,'2018-01-18 22:09:28');
INSERT INTO address(addressname,addresssignname,addresssignphone,addressdefault,customerid,addressdate)VALUES('陕西省西安市碑林区长安3号','张斌','18220791130','否',1,'2018-01-18 22:09:28');

INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(1,1,'123123121231231231',1,'2018-01-18 22:09:28',1,1000,'支付宝',1,6,'是','是');

/*
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(1,2,'123123121231231231',1,'2018-01-18 22:09:28',2,2000,'支付宝',2,2,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(1,1,'123123121231231232',1,'2018-01-18 22:09:28',1,1000,'支付宝',1,3,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(2,2,'123123121231231232',1,'2018-01-18 22:09:28',1,1000,'支付宝',2,4,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(1,1,'123123121231231232',1,'2018-01-18 22:09:28',2,2000,'支付宝',1,5,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(2,2,'123123121231231232',1,'2018-01-18 22:09:28',1,1000,'支付宝',2,6,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(1,1,'123123121231231233',1,'2018-01-18 22:09:28',2,2000,'支付宝',1,7,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(3,2,'123123121231231234',1,'2018-01-18 22:09:28',1,1000,'支付宝',2,8,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(1,1,'123123121231231235',1,'2018-01-18 22:09:28',1,1000,'支付宝',1,9,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(2,2,'123123121231231236',1,'2018-01-18 22:09:28',2,2000,'支付宝',2,10,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(2,1,'123123121231231236',1,'2018-01-18 22:09:28',1,1000,'支付宝',2,1,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(3,2,'123123121231231237',1,'2018-01-18 22:09:28',2,2000,'支付宝',1,2,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(2,1,'123123121231231238',1,'2018-01-18 22:09:28',1,1000,'支付宝',2,6,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(3,2,'123123121231231239',1,'2018-01-18 22:09:28',1,1000,'支付宝',2,6,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(3,1,'123123121231231239',1,'2018-01-18 22:09:28',2,2000,'支付宝',1,6,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(1,2,'123123121231231239',1,'2018-01-18 22:09:28',1,1000,'支付宝',2,6,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(2,1,'123123121231231240',1,'2018-01-18 22:09:28',4,4000,'支付宝',1,6,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(1,2,'123123121231231241',1,'2018-01-18 22:09:28',1,1000,'支付宝',2,6,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(4,1,'123123121231231241',1,'2018-01-18 22:09:28',1,1000,'支付宝',1,6,'是','是');
INSERT INTO OrderList(CustomerId,ProductId,OrderCode,AddressId,OrderDate,OrderCount,OrderPrice,OrderPayment,OrderSendType,OrderState,Orderblook,Orderclook)VALUES(1,2,'123123121231231242',1,'2018-01-18 22:09:28',1,1000,'支付宝',2,4,'是','是');
*/

