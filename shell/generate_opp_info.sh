#!/bin/bash

# 说明，该脚本需要在dataio机器上执行，执行大约需要15分钟左右
# 输出为：
# opp_info -》 商机相关信息，包括，跟进人，调整信息
# opp_set_info -》 is 的客保容量，以及当前客保量
# cust_info -》客户信息，包括客户名以及客户名修改记录


echo -e "opp_id\tcust_id\t商机状态\t状态\t更新时间\t跟进人\t操作类型\t操作时间\t操作人ucid\t操作人posid\t原跟进人" > opp_info

echo -e "posid\t客保容量\t客保数量" > opp_set_info

echo -e "cust_id\t客户名\t操作人\t变更前客户名\t操作时间" > cust_info

# 商机跟进人posid，pm提供
pos_id=42084,42666,42673,42735,42749,50785,51827,53355,54617,54623,54633,57516,57978,60491,60533,60929,61070,61241,62531,62667,74046,74312,74316,74380,74388,74390,74959,76380,76650,77106,77846,78015,78469,79077,80009,80635,81397,82013,84385,84542,85114,85484,85485,85918,86193,86425,87186,87484,87570,87918,88251,88751,88754,88845,91819,91954,92345,92346,97965,98540,99031,99304,99682,99715,100455,100606,100607,101879,101932,102115,6003132,6003685,6003722,6003724,6003839,6003886,6004225,6004530,6004682,6004777,6004778,6004932,6004993,6005039,6005315,6005791,6006000,6006070,6006381,6006605,6006617,6006635,6006636,6007124,6007125,6007162,6007163,6007187,6007625,6007664,6007843,6008331,6008350,6008712,6008713,6009027,6009206,6009353,6009453,6009490,6009591,6009592,6009598,6009806,6009887,6009906,6010215,6010216,6010217,6010218,6010219,6010220,6010221,6010295,6010696,6010704,6010883,6010886,6010894,6010895,6010896,6010897,6010898,6010899,6010906,6010908,6010909,6011023,6011024,6011025,6011026,6011027,6011029,6011043,6011165,6011190,6011191,6011192,6011193,6011194,6011195,6011196,6011197,6011198,6011199,6011200,6011202,6011203,6011204,6011205,6011206,6011207,6011209,6011210,6011211,6011212,6011213,6011214,6011215,6011216,6011217,6011218,6011219,6011220,6011221,6011222,6011223,6011225,6011231,6011232,6011237,6011239,6011241,6011242,6011248,6011249,6011250,6011251,6011252,6011253,6011313,6011315,6011316,6011318,6011322,6011324,6011325,6011326,6011327,6011328,6011329,6011330,6011358,6011389,6011393,6011396,6011408,6011409,6011711,6011780,6011781,6012035,6012066,6012068,6012069,6012070,6012071,6012072,6012073,6012074,6012075,6012076,6012077,6012078,6012079,6012080,6012081,6012082,6012083,6012084,6012085,6012086,6012087,6012088,6012089,6012090,6012092,6012093,6012094,6012095,6012096,6012097,6012098,6012099,6012100,6012102,6012103,6012104,6012105,6012107,6012108,6012109,6012110,6012111,6012112,6012113,6012114,6012115,6012116,6012117,6012118,6012119,6012120,6012121,6012122,6012123,6012124,6012125,6012126,6012127,6012128,6012129,6012130,6012131,6012132,6012133,6012134,6012135,6012136,6012137,6012138,6012139,6012140,6012141,6012142,6012143,6012145,6012146,6012147,6012148,6012149,6012150,6012151,6012152,6012154,6012155,6012156,6012157,6012158,6012159,6012160,6012161,6012162,6012163,6012164,6012186,6012322,6012674,6012675,6012676,6012677,6012678,6012707,6012708,6012713,6012715,6012716,6012718,6012719,6012720,6012721,6012722,6012723,6012724,6012725,6012726,6012727,6012728,6012729,6012730,6012731,6012732,6012733,6012734,6012735,6012736,6012737,6012738,6012739,6012740,6012741,6012742,6012743,6012744,6012745,6012746,6012747,6012748,6012749,6012750,6012751,6012752,6012753,6012754,6012755,6012756,6012757,6012758,6012759,6012760,6012762,6012763,6012764,6012765,6012766,6012767,6012768,6013059,6013060,6013061,6013063,6013064,6013066,6013067,6013068,6013069,6013070,6013112,6013280,6013341,6013342,6013343,6013349,6013359,6013364,6013366,6013368,6013370,6013472,6013474,6013520,6013590,6013591,6013592,6013703,6013704,6013818,6013819,6013833,6013903,6013904,6013905,6013906,6013907,6013927,6013963,6014019,6014094,6014095,6014096,6014114,6014127,6014130,6014134,6014136,6014156,6014157,6014167,6014168,6014169,6014170,6014171,6014172,6014173,6014174,6014175,6014176,6014177,6014178,6014179,6014204,6014209,6014210,6014211,6014212,6014213,6014214,6014215,6014216,6014217,6014218,6014220,6014221,6014222,6014223,6014224,6014225,6014241,6014292,6014293,6014294,6014295,6014295,6014297,6014326,6014331,6014442,6014462,6014482,6014506,6014545,6014546,6014606,6014608,6014609,6014612,6014613,6014824,6014833,6014837,6014895

#导出开始时间
start_time="2017-09-15 00:00:00"
#导出结束时间
end_time="2017-10-01 00:00:00"

# 客户资料操作记录表后缀，以月份分表，用于导出公司名修改记录
yyyymm=201709


hint_host=10.36.3.171
hint_port=6200
hint_user=lucene_dataio
hint_pass=7gOkSELOgTSC

cust_host=10.26.5.131
cust_port=6201
cust_user=pg_cust_w
cust_pass=RB6Q59WP3nm2

mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -e "SELECT opp.id AS opp_id,opp.cust_id,CASE opp.state WHEN 1 THEN '跟进中-未提单' WHEN 2 THEN '跟进中-已提单' WHEN 3 THEN '跟进中-已出单' WHEN 4 THEN '跟进成功-成单上线' WHEN 5 THEN '跟进失败-超时掉保' WHEN 6 THEN '跟进失败-放弃跟进' END AS state,opp.upd_time,opp.in_posid,CASE tl.opt_type WHEN 0 THEN '创建商机' WHEN 1 THEN '放弃商机' WHEN 2 THEN '调整IS' WHEN 4 THEN 'IS掉保' END AS opt_type,tl.create_time,tl.opt_ucid,tl.opt_posid FROM pg_sale_shanghai.tb_opportunity_record opp LEFT JOIN pg_sale_shanghai.tl_opp_info_log tl ON (opp.id = tl.opp_id  AND tl.create_time >= '$start_time' AND tl.create_time < '$end_time') WHERE opp.in_posid IN ($pos_id) AND opp.upd_time >= '$start_time' AND opp.upd_time < '$end_time';" >>opp_info_tmp
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -e "SELECT opp.id AS opp_id,opp.cust_id,CASE opp.state WHEN 1 THEN '跟进中-未提单' WHEN 2 THEN '跟进中-已提单' WHEN 3 THEN '跟进中-已出单' WHEN 4 THEN '跟进成功-成单上线' WHEN 5 THEN '跟进失败-超时掉保' WHEN 6 THEN '跟进失败-放弃跟进' END AS state,opp.upd_time,opp.in_posid,CASE tl.opt_type WHEN 0 THEN '创建商机' WHEN 1 THEN '放弃商机' WHEN 2 THEN '调整IS' WHEN 4 THEN 'IS掉保' END AS opt_type,tl.create_time,tl.opt_ucid,tl.opt_posid FROM pg_sale_guangzhou.tb_opportunity_record opp LEFT JOIN pg_sale_guangzhou.tl_opp_info_log tl ON (opp.id = tl.opp_id  AND tl.create_time >= '$start_time' AND tl.create_time < '$end_time') WHERE opp.in_posid IN ($pos_id) AND opp.upd_time >= '$start_time' AND opp.upd_time < '$end_time';" >>opp_info_tmp
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -e "SELECT opp.id AS opp_id,opp.cust_id,CASE opp.state WHEN 1 THEN '跟进中-未提单' WHEN 2 THEN '跟进中-已提单' WHEN 3 THEN '跟进中-已出单' WHEN 4 THEN '跟进成功-成单上线' WHEN 5 THEN '跟进失败-超时掉保' WHEN 6 THEN '跟进失败-放弃跟进' END AS state,opp.upd_time,opp.in_posid,CASE tl.opt_type WHEN 0 THEN '创建商机' WHEN 1 THEN '放弃商机' WHEN 2 THEN '调整IS' WHEN 4 THEN 'IS掉保' END AS opt_type,tl.create_time,tl.opt_ucid,tl.opt_posid FROM pg_sale_shenzhen.tb_opportunity_record opp LEFT JOIN pg_sale_shenzhen.tl_opp_info_log tl ON (opp.id = tl.opp_id  AND tl.create_time >= '$start_time' AND tl.create_time < '$end_time') WHERE opp.in_posid IN ($pos_id) AND opp.upd_time >= '$start_time' AND opp.upd_time < '$end_time';" >>opp_info_tmp
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -e "SELECT opp.id AS opp_id,opp.cust_id,CASE opp.state WHEN 1 THEN '跟进中-未提单' WHEN 2 THEN '跟进中-已提单' WHEN 3 THEN '跟进中-已出单' WHEN 4 THEN '跟进成功-成单上线' WHEN 5 THEN '跟进失败-超时掉保' WHEN 6 THEN '跟进失败-放弃跟进' END AS state,opp.upd_time,opp.in_posid,CASE tl.opt_type WHEN 0 THEN '创建商机' WHEN 1 THEN '放弃商机' WHEN 2 THEN '调整IS' WHEN 4 THEN 'IS掉保' END AS opt_type,tl.create_time,tl.opt_ucid,tl.opt_posid FROM pg_sale_dongguan.tb_opportunity_record opp LEFT JOIN pg_sale_dongguan.tl_opp_info_log tl ON (opp.id = tl.opp_id  AND tl.create_time >= '$start_time' AND tl.create_time < '$end_time') WHERE opp.in_posid IN ($pos_id) AND opp.upd_time >= '$start_time' AND opp.upd_time < '$end_time';" >>opp_info_tmp
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -e "SELECT opp.id AS opp_id,opp.cust_id,CASE opp.state WHEN 1 THEN '跟进中-未提单' WHEN 2 THEN '跟进中-已提单' WHEN 3 THEN '跟进中-已出单' WHEN 4 THEN '跟进成功-成单上线' WHEN 5 THEN '跟进失败-超时掉保' WHEN 6 THEN '跟进失败-放弃跟进' END AS state,opp.upd_time,opp.in_posid,CASE tl.opt_type WHEN 0 THEN '创建商机' WHEN 1 THEN '放弃商机' WHEN 2 THEN '调整IS' WHEN 4 THEN 'IS掉保' END AS opt_type,tl.create_time,tl.opt_ucid,tl.opt_posid FROM pg_sale_beijing.tb_opportunity_record opp LEFT JOIN pg_sale_beijing.tl_opp_info_log tl ON (opp.id = tl.opp_id  AND tl.create_time >= '$start_time' AND tl.create_time < '$end_time') WHERE opp.in_posid IN ($pos_id) AND opp.upd_time >= '$start_time' AND opp.upd_time < '$end_time';" >>opp_info_tmp
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -e "SELECT opp.id AS opp_id,opp.cust_id,CASE opp.state WHEN 1 THEN '跟进中-未提单' WHEN 2 THEN '跟进中-已提单' WHEN 3 THEN '跟进中-已出单' WHEN 4 THEN '跟进成功-成单上线' WHEN 5 THEN '跟进失败-超时掉保' WHEN 6 THEN '跟进失败-放弃跟进' END AS state,opp.upd_time,opp.in_posid,CASE tl.opt_type WHEN 0 THEN '创建商机' WHEN 1 THEN '放弃商机' WHEN 2 THEN '调整IS' WHEN 4 THEN 'IS掉保' END AS opt_type,tl.create_time,tl.opt_ucid,tl.opt_posid FROM pg_sale_yunying1.tb_opportunity_record opp LEFT JOIN pg_sale_yunying1.tl_opp_info_log tl ON (opp.id = tl.opp_id  AND tl.create_time >= '$start_time' AND tl.create_time < '$end_time') WHERE opp.in_posid IN ($pos_id) AND opp.upd_time >= '$start_time' AND opp.upd_time < '$end_time';" >>opp_info_tmp
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -e "SELECT s.posid,s.follow_storage,opp.in_posid,COUNT(opp.id) FROM pg_sale_beijing.tb_sale_set s LEFT JOIN pg_sale_beijing.tb_opportunity opp ON s.posid = opp.in_posid  WHERE s.disable_flag = 0 AND s.posid IN ($pos_id) GROUP BY s.posid;" >> opp_set_info
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -e "SELECT s.posid,s.follow_storage,opp.in_posid,COUNT(opp.id) FROM pg_sale_shanghai.tb_sale_set s LEFT JOIN pg_sale_shanghai.tb_opportunity opp ON s.posid = opp.in_posid  WHERE s.disable_flag = 0 AND s.posid IN ($pos_id) GROUP BY s.posid;" >> opp_set_info
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -e "SELECT s.posid,s.follow_storage,opp.in_posid,COUNT(opp.id) FROM pg_sale_guangzhou.tb_sale_set s LEFT JOIN pg_sale_guangzhou.tb_opportunity opp ON s.posid = opp.in_posid  WHERE s.disable_flag = 0 AND s.posid IN ($pos_id) GROUP BY s.posid;" >> opp_set_info
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -e "SELECT s.posid,s.follow_storage,opp.in_posid,COUNT(opp.id) FROM pg_sale_shenzhen.tb_sale_set s LEFT JOIN pg_sale_shenzhen.tb_opportunity opp ON s.posid = opp.in_posid  WHERE s.disable_flag = 0 AND s.posid IN ($pos_id) GROUP BY s.posid;" >> opp_set_info
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -e "SELECT s.posid,s.follow_storage,opp.in_posid,COUNT(opp.id) FROM pg_sale_dongguan.tb_sale_set s LEFT JOIN pg_sale_dongguan.tb_opportunity opp ON s.posid = opp.in_posid  WHERE s.disable_flag = 0 AND s.posid IN ($pos_id) GROUP BY s.posid;" >> opp_set_info
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -e "SELECT s.posid,s.follow_storage,opp.in_posid,COUNT(opp.id) FROM pg_sale_yunying1.tb_sale_set s LEFT JOIN pg_sale_yunying1.tb_opportunity opp ON s.posid = opp.in_posid  WHERE s.disable_flag = 0 AND s.posid IN ($pos_id) GROUP BY s.posid;" >> opp_set_info


# 获取oppId，逗号分隔
awk '{if($7=="调整IS")print $1>"oppId"}' opp_info_tmp
eval $(awk BEGIN{RS=EOF}'{gsub(/\n/,",");print "oppId="$0}' oppId)

mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -D pg_sale_beijing -e "SELECT opp_id,is_posid FROM tl_opp_info_log WHERE opp_id IN ($oppId) ORDER BY create_time DESC;" >> opp_follower_his
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -D pg_sale_shanghai -e "SELECT opp_id,is_posid FROM tl_opp_info_log WHERE opp_id IN ($oppId) ORDER BY create_time DESC;" >> opp_follower_his
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -D pg_sale_guangzhou -e "SELECT opp_id,is_posid FROM tl_opp_info_log WHERE opp_id IN ($oppId) ORDER BY create_time DESC;" >> opp_follower_his
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -D pg_sale_shenzhen -e "SELECT opp_id,is_posid FROM tl_opp_info_log WHERE opp_id IN ($oppId) ORDER BY create_time DESC;" >> opp_follower_his
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -D pg_sale_dongguan -e "SELECT opp_id,is_posid FROM tl_opp_info_log WHERE opp_id IN ($oppId) ORDER BY create_time DESC;" >> opp_follower_his
mysql -N -h $hint_host -P $hint_port -u $hint_user -p$hint_pass -D pg_sale_yunying1 -e "SELECT opp_id,is_posid FROM tl_opp_info_log WHERE opp_id IN ($oppId) ORDER BY create_time DESC;" >> opp_follower_his

# 拼接商机前跟进人信息
awk 'ARGIND == 1 {a[$1]=$0}; ARGIND == 2 {b[$1]=b[$1]+1;if(b[$1]==2)print a[$1],$2 >> "opp_info"}' opp_info_tmp opp_follower_his
awk '{if($7!="调整IS")print $0 >> "opp_info"}' opp_info_tmp


# 获取custid，逗号分隔
awk '{if(NR!=1)print $2>"custId"}' opp_info_tmp
eval $(awk BEGIN{RS=EOF}'{gsub(/\n/,",");print "custId="$0}' custId)

mysql -N -h $cust_host -P $cust_port -u $cust_user -p$cust_pass --default-character-set=utf8 -e "SELECT cu.id,cu.full_name,user_id,contents,oper_time FROM tb_cust cu LEFT JOIN tb_modify_content_$yyyymm content ON (content.entity_id = cu.id AND table_name = 'tb_cust' AND contents != '') WHERE cu.id IN ($custId);" >> cust_info

