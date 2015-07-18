# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

addresses = [
     Address.new({longitude: 114.407185, latitude: 30.511534, city: '武汉市', province: '湖北省', street: '光谷世界城广场16F-16'}),
     Address.new({longitude: 114.415557, latitude: 30.481218, city: '武汉市', province: '湖北省', street: '关山大道光谷软件园A10'}),
     Address.new({longitude: 114.420947, latitude: 30.476090, city: '武汉市', province: '湖北省', street: '关南园二路光谷理想城'}),
     Address.new({longitude: 114.430362, latitude: 30.512110, city: '武汉市', province: '湖北省', street: '珞喻路1037号华中科技大学'}),
     Address.new({longitude: 114.346280, latitude: 30.540854, city: '武汉市', province: '湖北省', street: '洪山公园'}),
     Address.new({longitude: 114.279374, latitude: 30.592659, city: '武汉市', province: '湖北省', street: '中山公园'}),
     Address.new({longitude: 114.399963, latitude: 30.490951, city: '武汉市', province: '湖北省', street: '民族大学'})
]

puts 'Create users...'
users = User.create([
  {username: "gongming", password: "123456", avatar: "https://avatars0.githubusercontent.com/u/4431171?v=3&s=460", wechat: "gongmingqm10", email: "gongmingqm10@gmail.com", telephone: "18827070760", address: addresses[0]},
  {username: "zengheng", password: "123456", avatar: "https://avatars1.githubusercontent.com/u/1768182?v=3&s=460", wechat: "hengzeng", email: "hengzeng@gmail.com", telephone: "18827070761", address: addresses[1]},
  {username: "suoqin", password: "123456", avatar: "https://avatars2.githubusercontent.com/u/790027?v=3&s=460", wechat: "suoqin", email: "suoqin@gmail.com", telephone: "18827070762", address: addresses[2]},
  {username: "huanglei", password: "123456", avatar: "https://avatars1.githubusercontent.com/u/1477111?v=3&s=460", wechat: "huanglei", email: "huanglei@gmail.com", telephone: "18827070763", address: addresses[3]},
  {username: "dumohan", password: "123456", avatar: "https://avatars0.githubusercontent.com/u/3795170?v=3&s=460", wechat: "dumohan", email: "dumohan@gmail.com", telephone: "18827070764", address: addresses[4]}
])


puts 'Create books...'

books = Book.create([
    {name: "Xiaoming", owner: users[0]},
    {name: "梦里花落知多少", author: "郭敬明",
      summary: "《梦里花落知多少》是郭敬明出版第二部小说，此作一改《幻城》的奇幻风格，从天上回到人间。小说以北京、上海等大都市为背景，讲述了几个年青人的爱情故事，情节曲折，语言幽默生动。主人公是一些即将走出校门的大学生，在成长的过程中，友情、爱情都在经历着蜕变，那种成长的快乐和忧伤很能引起年轻读者的共鸣。",
      image: "http://img4.douban.com/lpic/s1513378.jpg",
      doubanid: "1016300", status: "drifting", owner: users[0], holder: users[0]},
    {name: "致我们终将逝去的青春", author: "辛夷坞",
      summary: "自喻为“玉面小飞龙”的郑微，洋溢着青春活力，心怀着对邻家哥哥林静浓浓的爱意，来到大学。可是当她联系林静的时候，却发现出国的林静并没有告诉她任何消息。生性豁达的她，埋藏起自己的爱情，享受大学时代的快乐生活。却意外地爱上同学校的陈孝正，板正、自闭而又敏感、自尊的陈孝正却在毕业的时候又选择了出国放弃了郑微。 几年后，林静和陈孝正都出现在郑微面前，而工作后的郑微也纠葛在工作、感情甚至阴谋之中。郑微感情的天平，会倾向于哪一个呢？",
      image: "http://img3.douban.com/lpic/s2652662.jpg",
      doubanid: "2209098", status: "reading", owner: users[0], holder: users[1]},
    {name: "挪威的森林", author: "树上春树",
      summary: "这是一部动人心弦的、平缓舒雅的、略带感伤的恋爱小说。小说主人公渡边以第一人称展开他同两个女孩间的爱情纠葛。渡边的第一个恋人直子原是他高中要好同学木月的女友，后来木月自杀了。一年后渡边同直子不期而遇并开始交往。此时的直子已变得娴静腼腆，美丽晶莹的眸子里不时掠过一丝难以捕捉的阴翳。两人只是日复一日地在落叶飘零的东京街头漫无目标地或前或后或并肩行走不止。直子20岁生日的晚上两人发生了性关系，不料第二天直子便不知去向。几个月后直子来信说她住进一家远在深山里的精神疗养院。渡边前去探望时发现直子开始带有成熟女性的丰腴与娇美。晚间两人虽同处一室，但渡边约束了自己，分手前表示永远等待直子。返校不久，由于一次偶然相遇，渡边开始与低年级的绿子交往。绿子同内向的直子截然相反，“简直就像迎着春天的晨光蹦跳到世界上来的一头小鹿”。这期间，渡边内心十分苦闷彷徨。一方面念念不忘直子缠绵的病情与柔情，一方面又难以抗拒绿子大胆的表白和迷人的活力。不久传来直子自杀的噩耗，渡边失魂魄地四处徒步旅行。最后，在直子同房病友玲子的鼓励下，开始摸索此后的人生。",
      image: "http://img3.douban.com/lpic/s1228930.jpg",
      doubanid: "1046265", status: "drifting", owner: users[0], holder: users[2]},
    {name: "何以笙箫默", author: "顾漫",
      summary: "一段年少时的爱恋，牵出一生的纠缠。大学时代的赵默笙阳光灿烂，对法学系大才子何以琛一见倾心，开朗直率的她拔足倒追，终于使才气出众的他为她停留驻足。然而，不善表达的他终于使她在一次伤心之下远走他乡……",
      image: "http://img3.douban.com/lpic/s2529195.jpg",
      doubanid: "1461903", status: "drifting", owner: users[1], holder: users[2]},
    {name: "你好，旧时光", author: "八月长安",
      summary: "最好的青春共鸣文本！ 盛大的记忆共鸣曲，写给每个女孩的“成长之书”，带你重回“最美的时光”。 网络原名《玛丽苏病例报告》，随书附赠精美2010年历卡！ 1部晋江网6年来唯一不谈情爱而人气爆棚、高居榜首的小说！ 1部让所有心中有爱的70、80、90后共同追捧的青春奇书！ “玛丽苏”是一种“自以为是主角”的病，我们都是患者。感染无须惊慌，它只宣告成长的开始。这是一个小女孩的成长故事，这或许也是你的故事。她是女侠、雅典娜、月野兔、花仙子、希瑞、白娘子……她以为所有人都爱她，世界等着她拯救。却没想到，这世界无人可以拯救，她所能做的，只是长大。彼得潘终于走完了小时候，彼时的少年站在成长的尽头，回首过去，一路崎岖竟已遍地繁花盛开。",
      image: "http://img4.douban.com/lpic/s4293097.jpg",
      doubanid: "4166819", status: "reading", owner: users[1], holder: users[3]},
    {name: "三重门", author: "韩寒",
      summary: "《三重门》是一部由一个少年写就，但却不能简单划入儿童文学的一般意义上的小说，它恰恰是以成熟、老练，甚至以老到见长的。17岁的韩寒注定要扮演不安分且引人注目的角色。他以一篇《杯中窥人》问鼎首届全国新概念作文大赛。然而，他却因期末考试的成绩单高挂七盏红灯而留级。在2000年还是用七门功课红灯照亮前程。眼下的韩寒已经成为一个“话题”——“一个‘高材’留级生引出的话题”。这个韩寒，何许人也？",
      image: "http://img3.douban.com/lpic/s1024882.jpg",
      doubanid: "1026425", status: "reading", owner: users[2], holder: users[4]},
    {name: "那些年，我们一起追的女孩", author: "九把刀",
      summary: "柯景腾读国中时是一个成绩暴烂而且又调皮捣蛋的男生，老师将他“托付”给班里最优秀的女生沈佳仪。只要他不认真学习，沈佳仪就会用钢笔戳他的衣服。 在沈佳仪的监督和鼓励下，柯景腾的成绩就像芝麻开花节节高，渐渐地，他也喜欢上了气质优雅的沈佳仪。但是柯景腾却不敢向心爱的女生表白，因为几乎被所有男生喜欢的沈佳仪对追求她的男生一律有一种反感，她只想好好学习，不希望别人介入自己的生活。 但是，为何沈佳仪唯独愿意把心事与柯景腾分享呢？她对他究竟有没有别样的感觉呢？柯景腾暗恋沈佳仪八年最终能否修得正果呢？让我们走进《那些年，我们一起追过的女孩》，一起来寻找最纯真的感动吧！",
      image: "http://img3.douban.com/lpic/s1982025.jpg", doubanid: "1958227", status: "drifting", owner: users[3], holder: users[4]},
    {name: "悲伤逆流成河", author: "郭敬明", summary: "你曾经有梦见这样无边无际的月光下的水域么？ 无声起伏的黑色的巨浪，在地平线上爆发出沉默的力量。 就这样，从仅仅打湿脚底，到盖住脚背，漫过小腿，一步一步地，走向寒冷寂静的深渊。 你有听到过这样的声音么？ 在很遥远，又很贴近的地方响起来。 像是有细小的虫子飞进了耳孔。在耳腔里嗡嗡地振翅。 突突地跳动在太阳穴上的声音。 视界里拉动出长线的模糊的白色光点。 又是什么。 漫长的时光像是一条黑暗潮湿的闷热洞穴。 青春如同悬在头顶上面的点滴瓶。一滴一滴地流逝干净。 而窗外依然是阳光灿烂的晴朗世界。 就是这样了吧。",
      image: "http://img3.douban.com/lpic/s2405994.jpg", doubanid: "2062200", status: "reading", owner: users[4], holder: users[3]},
    {name: "一个人的好天气", author: "[日] 青山七惠",
      summary: "《一个人的好天气》描述了一个打零工的女孩如何与年长亲人相处，同时追寻自我、独立的故事，走向自立的一名女孩在工作、生活和恋爱中的种种际遇和心情令人揪心，小说写尽了做一名自由职业者（“飞特族”）的辛酸。内容折射出当前日本的一个社会问题，即许多年轻人不愿投入全职工作而四处打工，宁愿做自由职业者，他们不想长大，不愿担负责任，无法独立，害怕走出去看看这个世界，但是又不知道这种恐惧从何而来。据日本官方统计，15至34岁的短期雇工在1996年到2004年之间翻了一番，达21.4万人。调查也显示，打零工的人收入不稳，结婚生子的机率大减，这对少子化严重的日本来说是一大警讯。作者青山七惠在接受记者采访时说：“我想告诉他们，只要你肯迈出第一步，自然会有出路。”她希望自己的作品能帮助他们“迈出第一步”。",
      image: "http://img3.douban.com/lpic/s2755472.jpg", doubanid: "2250587", status: "drifting", owner: users[3], holder: users[4]},
    {name: "幻城", author: "郭敬明",
      summary: "这是一本奇特的书。一边是火族，一边是冰族，一边是火焰之城，一边是幻雪帝国。作品属于纯粹的虚构。对虚空的虚构，其实比对现实的摹写更难。相对于虚构的能力，我以为摹写的能力只是一个基本的能力，而虚构才是更高一层的能力，而且是区别文学是否进入风光境界的能力。中国文学的可检讨之处，就正在于若干年来停滞于摹写，而无法将文字引入虚构。",
      image: "http://img4.douban.com/lpic/s1100387.jpg",
      doubanid: "1059406", status: "reading", owner: users[2], holder: users[3]}
])
