import '../models/product.dart';

const List<Product> dummyProducts = [

  // ── CAKES (from cakes.html — 14 products) ────────────────────────────────
  Product(id:'cake_1', name:'Pineapple Cream', categoryId:'cakes', price:895, imageUrl:'assets/images/cakehtml.jpg', description:'Fresh pineapple cream cake', weight:500, isAvailable:true),
  Product(id:'cake_2', name:'Black Forest', categoryId:'cakes', price:995, imageUrl:'assets/images/blackforest.png', description:'Classic black forest with cherries and fresh cream', weight:500, isAvailable:true),
  Product(id:'cake_3', name:'Simple Fresh Cream Cake', categoryId:'cakes', price:795, imageUrl:'assets/images/cakehtml.jpg', description:'Classic fresh cream cake', weight:500, isAvailable:true),
  Product(id:'cake_4', name:'2 in 1', categoryId:'cakes', price:995, imageUrl:'assets/images/cakehtml.jpg', description:'Two flavour combination cake', weight:500, isAvailable:true),
  Product(id:'cake_5', name:'Chocolate Chip Cake', categoryId:'cakes', price:995, imageUrl:'assets/images/choclatechip.png', description:'Rich chocolate chip fresh cream cake', weight:500, isAvailable:true),
  Product(id:'cake_6', name:'Strawberry Flavored Cake', categoryId:'cakes', price:995, imageUrl:'assets/images/cakehtml.jpg', description:'Fresh strawberry flavored cream cake', weight:500, isAvailable:true),
  Product(id:'cake_7', name:'Butter Scotch Cake', categoryId:'cakes', price:1195, imageUrl:'assets/images/butterscotch.png', description:'Buttery butterscotch cream cake', weight:500, isAvailable:true),
  Product(id:'cake_8', name:'Caramel Cake', categoryId:'cakes', price:995, imageUrl:'assets/images/caremalcake.png', description:'Smooth caramel layered cake', weight:500, isAvailable:true),
  Product(id:'cake_9', name:'Blueberry Flavored Cake', categoryId:'cakes', price:1195, imageUrl:'assets/images/cakehtml.jpg', description:'Blueberry cream cake', weight:500, isAvailable:true),
  Product(id:'cake_10', name:'Oreo Fresh Cream Cake', categoryId:'cakes', price:995, imageUrl:'assets/images/cakehtml.jpg', description:'Creamy cake with Oreo crumbles', weight:500, isAvailable:true),
  Product(id:'cake_11', name:'Eclair Cake', categoryId:'cakes', price:995, imageUrl:'assets/images/cakehtml.jpg', description:'Elegant eclair flavored cake', weight:500, isAvailable:true),
  Product(id:'cake_12', name:'Butter Cake', categoryId:'cakes', price:995, imageUrl:'assets/images/cakehtml.jpg', description:'Rich buttery fresh cream cake', weight:500, isAvailable:true),
  Product(id:'cake_13', name:'Chocolate Wafer Cake', categoryId:'cakes', price:995, imageUrl:'assets/images/cakehtml.jpg', description:'Chocolate wafer layered cake', weight:500, isAvailable:true),
  Product(id:'cake_14', name:'Vanilla Brownie Syrup', categoryId:'cakes', price:1095, imageUrl:'assets/images/cakehtml.jpg', description:'Vanilla brownie with syrup drizzle', weight:500, isAvailable:true),

  // ── ICE CREAM CAKES (from cakes.html > icecream cakes — 10 products) ────────
  Product(id:'cake_ic1', name:'Vanilla Ice Cream Cake', categoryId:'cakes', price:1195, imageUrl:'assets/images/vanillaicecream.png', description:'Creamy vanilla ice cream cake', weight:500, isAvailable:true),
  Product(id:'cake_ic2', name:'Chocolate Fudge Ice Cream Cake', categoryId:'cakes', price:1295, imageUrl:'assets/images/choclateicecream.png', description:'Rich chocolate fudge ice cream cake', weight:500, isAvailable:true),
  Product(id:'cake_ic3', name:'Strawberry Ice Cream Cake', categoryId:'cakes', price:1195, imageUrl:'assets/images/strawberryicecream.png', description:'Fresh strawberry ice cream cake', weight:500, isAvailable:true),
  Product(id:'cake_ic4', name:'Oreo Ice Cream Cake', categoryId:'cakes', price:1245, imageUrl:'assets/images/cakehtml.jpg', description:'Oreo ice cream cake', weight:500, isAvailable:true),
  Product(id:'cake_ic5', name:'Pistachio Ice Cream Cake', categoryId:'cakes', price:1395, imageUrl:'assets/images/cakehtml.jpg', description:'Pistachio ice cream cake', weight:500, isAvailable:true),
  Product(id:'cake_ic6', name:'Mango Ice Cream Cake', categoryId:'cakes', price:1195, imageUrl:'assets/images/mangoicecream.png', description:'Mango ice cream cake', weight:500, isAvailable:true),
  Product(id:'cake_ic7', name:'Coffee Ice Cream Cake', categoryId:'cakes', price:1295, imageUrl:'assets/images/cakehtml.jpg', description:'Coffee ice cream cake', weight:500, isAvailable:true),
  Product(id:'cake_ic8', name:'Tutti Frutti Ice Cream Cake', categoryId:'cakes', price:1245, imageUrl:'assets/images/cakehtml.jpg', description:'Tutti frutti ice cream cake', weight:500, isAvailable:true),
  Product(id:'cake_ic9', name:'Kulfa Ice Cream Cake', categoryId:'cakes', price:1345, imageUrl:'assets/images/cakehtml.jpg', description:'Kulfa ice cream cake', weight:500, isAvailable:true),
  Product(id:'cake_ic10', name:'Blueberry Ice Cream Cake', categoryId:'cakes', price:1395, imageUrl:'assets/images/cakehtml.jpg', description:'Blueberry ice cream cake', weight:500, isAvailable:true),

  // ── MOUSSE CAKES (from cakes.html > mousse cakes — 7 products) ───────────────
  Product(id:'cake_m1', name:'Vanilla Mousse Cake', categoryId:'cakes', price:1195, imageUrl:'assets/images/cakehtml.jpg', description:'Light vanilla mousse cake', weight:500, isAvailable:true),
  Product(id:'cake_m2', name:'Chocolate Mousse Cake', categoryId:'cakes', price:1195, imageUrl:'assets/images/cakehtml.jpg', description:'Rich chocolate mousse cake', weight:500, isAvailable:true),
  Product(id:'cake_m3', name:'Belgian Chocolate Mousse Cake', categoryId:'cakes', price:1395, imageUrl:'assets/images/cakehtml.jpg', description:'Premium Belgian chocolate mousse cake', weight:500, isAvailable:true),
  Product(id:'cake_m4', name:'3 Milk Cake', categoryId:'cakes', price:1195, imageUrl:'assets/images/cakehtml.jpg', description:'Classic tres leches 3 milk cake', weight:500, isAvailable:true),
  Product(id:'cake_m5', name:'Caramel Crunch Mousse Cake', categoryId:'cakes', price:1195, imageUrl:'assets/images/cakehtml.jpg', description:'Caramel crunch mousse cake', weight:500, isAvailable:true),
  Product(id:'cake_m6', name:'Wafer Mousse Cake', categoryId:'cakes', price:1195, imageUrl:'assets/images/cakehtml.jpg', description:'Wafer mousse cake', weight:500, isAvailable:true),
  Product(id:'cake_m7', name:'Lotus Cake', categoryId:'cakes', price:1395, imageUrl:'assets/images/cakehtml.jpg', description:'Lotus Biscoff mousse cake', weight:500, isAvailable:true),

  // ── DRY CAKES (from cakes.html > dry cakes — 12 products) ────────────────────
  Product(id:'cake_d1', name:'Almond Honey Cake', categoryId:'cakes', price:895, imageUrl:'assets/images/cakehtml.jpg', description:'Dry cake with almond and honey', weight:500, isAvailable:true),
  Product(id:'cake_d2', name:'Roasted Almond Honey Cake', categoryId:'cakes', price:1195, imageUrl:'assets/images/cakehtml.jpg', description:'Dry cake with roasted almonds and honey', weight:500, isAvailable:true),
  Product(id:'cake_d3', name:'Walnut Honey Cake', categoryId:'cakes', price:1145, imageUrl:'assets/images/cakehtml.jpg', description:'Dry cake with walnuts and honey', weight:500, isAvailable:true),
  Product(id:'cake_d4', name:'Roasted Walnut Honey Cake', categoryId:'cakes', price:1195, imageUrl:'assets/images/cakehtml.jpg', description:'Dry cake with roasted walnuts and honey', weight:500, isAvailable:true),
  Product(id:'cake_d5', name:'Butter Icing Strawberry Cake', categoryId:'cakes', price:1045, imageUrl:'assets/images/cakehtml.jpg', description:'Butter icing strawberry dry cake', weight:500, isAvailable:true),
  Product(id:'cake_d6', name:'Butter Icing Vanilla Cake', categoryId:'cakes', price:1045, imageUrl:'assets/images/cakehtml.jpg', description:'Butter icing vanilla dry cake', weight:500, isAvailable:true),
  Product(id:'cake_d7', name:'Butter Icing Chocolate Cake', categoryId:'cakes', price:1045, imageUrl:'assets/images/cakehtml.jpg', description:'Butter icing chocolate dry cake', weight:500, isAvailable:true),
  Product(id:'cake_d8', name:'Butter Icing Chocolate Fudge Cake', categoryId:'cakes', price:1045, imageUrl:'assets/images/cakehtml.jpg', description:'Butter icing chocolate fudge dry cake', weight:500, isAvailable:true),
  Product(id:'cake_d9', name:'Brownie Cake', categoryId:'cakes', price:1045, imageUrl:'assets/images/cakehtml.jpg', description:'Rich brownie dry cake', weight:500, isAvailable:true),
  Product(id:'cake_d10', name:'Rich Plum Cake', categoryId:'cakes', price:1595, imageUrl:'assets/images/cakehtml.jpg', description:'Traditional rich plum cake', weight:500, isAvailable:true),
  Product(id:'cake_d11', name:'Lemon Tart Cake', categoryId:'cakes', price:1495, imageUrl:'assets/images/cakehtml.jpg', description:'Tangy lemon tart dry cake', weight:500, isAvailable:true),
  Product(id:'cake_d12', name:'Cheese Cake', categoryId:'cakes', price:1495, imageUrl:'assets/images/cakehtml.jpg', description:'Classic New York style cheesecake', weight:500, isAvailable:true),

  // ── BISCUITS (from biscuits.html — 17 products) ───────────────────────────
  // Standard @ Rs.400 per 250g
  Product(id:'biscuit_1', name:'Plain Biscuits', categoryId:'biscuits', price:400, imageUrl:'assets/images/plainbiscuit.png', description:'Classic plain biscuit', weight:250, isAvailable:true),
  Product(id:'biscuit_2', name:'Chocolate Biscuits', categoryId:'biscuits', price:400, imageUrl:'assets/images/choclatebiscuit.png', description:'Crispy chocolate biscuit', weight:250, isAvailable:true),
  Product(id:'biscuit_3', name:'2 in 1 Biscuits', categoryId:'biscuits', price:400, imageUrl:'assets/images/biscuitshtml.png', description:'Two flavour biscuit mix', weight:250, isAvailable:true),
  Product(id:'biscuit_4', name:'Chocolate Chip Biscuit', categoryId:'biscuits', price:400, imageUrl:'assets/images/chocochipbiscuit.png', description:'Biscuit with chocolate chips', weight:250, isAvailable:true),
  Product(id:'biscuit_5', name:'Chocolate Fudge Biscuit', categoryId:'biscuits', price:400, imageUrl:'assets/images/biscuitshtml.png', description:'Rich chocolate fudge biscuit', weight:250, isAvailable:true),
  Product(id:'biscuit_6', name:'Chocolate Almond Biscuit', categoryId:'biscuits', price:400, imageUrl:'assets/images/biscuitshtml.png', description:'Biscuit with chocolate and almonds', weight:250, isAvailable:true),
  Product(id:'biscuit_7', name:'Jam Biscuit', categoryId:'biscuits', price:400, imageUrl:'assets/images/biscuitshtml.png', description:'Sweet jam filled biscuit', weight:250, isAvailable:true),
  Product(id:'biscuit_8', name:'Saltish Biscuit', categoryId:'biscuits', price:400, imageUrl:'assets/images/biscuitshtml.png', description:'Crispy saltish biscuit', weight:250, isAvailable:true),
  Product(id:'biscuit_9', name:'Super Biscuit', categoryId:'biscuits', price:400, imageUrl:'assets/images/biscuitshtml.png', description:'Classic super biscuit', weight:250, isAvailable:true),
  Product(id:'biscuit_10', name:'Candy Biscuit', categoryId:'biscuits', price:400, imageUrl:'assets/images/biscuitshtml.png', description:'Sweet candy biscuit', weight:250, isAvailable:true),
  Product(id:'biscuit_11', name:'Sugar Free Biscuit', categoryId:'biscuits', price:400, imageUrl:'assets/images/sugarfreebiscuit.png', description:'Healthy sugar-free biscuit', weight:250, isAvailable:true),
  Product(id:'biscuit_12', name:'Black Current Biscuit', categoryId:'biscuits', price:400, imageUrl:'assets/images/biscuitshtml.png', description:'Biscuit with black current flavour', weight:250, isAvailable:true),
  // Premium @ Rs.500 per 250g
  Product(id:'biscuit_13', name:'Walnut Biscuit', categoryId:'biscuits', price:500, imageUrl:'assets/images/walnutbiscuit.png', description:'Premium biscuit with walnuts', weight:250, isAvailable:true),
  Product(id:'biscuit_14', name:'Pistachio Biscuit', categoryId:'biscuits', price:500, imageUrl:'assets/images/biscuitshtml.png', description:'Premium biscuit with pistachios', weight:250, isAvailable:true),
  Product(id:'biscuit_15', name:'Peanut Biscuit', categoryId:'biscuits', price:500, imageUrl:'assets/images/biscuitshtml.png', description:'Premium biscuit with peanuts', weight:250, isAvailable:true),
  Product(id:'biscuit_16', name:'Coconut Biscuit 1 Bite', categoryId:'biscuits', price:500, imageUrl:'assets/images/biscuitshtml.png', description:'Mini coconut biscuit bites', weight:250, isAvailable:true),
  Product(id:'biscuit_17', name:'Vanilla Bites', categoryId:'biscuits', price:500, imageUrl:'assets/images/biscuitshtml.png', description:'Mini vanilla flavored biscuit bites', weight:250, isAvailable:true),

  // ── BREAD (from bread.html — 10 products) ────────────────────────────────
  Product(id:'bread_1', name:'Plain Bread', categoryId:'bread', price:90, imageUrl:'assets/images/plain_bread.jpg', description:'Fresh daily-baked plain bread', weight:500, isAvailable:true),
  Product(id:'bread_2', name:'Sweet Bread', categoryId:'bread', price:140, imageUrl:'assets/images/sweet_bread.jpg', description:'Soft sweet bread for breakfast', weight:500, isAvailable:true),
  Product(id:'bread_3', name:'Sugar Free Bread', categoryId:'bread', price:150, imageUrl:'assets/images/sugarfree_bread.jpg', description:'Healthy sugar-free bread', weight:450, isAvailable:true),
  Product(id:'bread_4', name:'Sandwich Slice Bread', categoryId:'bread', price:250, imageUrl:'assets/images/plain_bread.jpg', description:'Perfect sandwich slice bread', weight:500, isAvailable:true),
  Product(id:'bread_5', name:'Sweet Bun', categoryId:'bread', price:80, imageUrl:'assets/images/sweet_bun.jpg', description:'Soft sweet bun for tea time', weight:100, isAvailable:true),
  Product(id:'bread_6', name:'Plain Burger Bun (Round)', categoryId:'bread', price:50, imageUrl:'assets/images/sweet_bun.jpg', description:'Soft round burger bun', weight:80, isAvailable:true),
  Product(id:'bread_7', name:'Plain Burger Bun (Long)', categoryId:'bread', price:50, imageUrl:'assets/images/sweet_bun.jpg', description:'Soft long burger bun', weight:80, isAvailable:true),
  Product(id:'bread_8', name:'Sheermal', categoryId:'bread', price:150, imageUrl:'assets/images/Sheermal.jpg', description:'Traditional saffron and cardamom bread', weight:400, isAvailable:true),
  Product(id:'bread_9', name:'Fruit Sheermal', categoryId:'bread', price:170, imageUrl:'assets/images/Sheermal.jpg', description:'Sheermal with dried fruits', weight:400, isAvailable:true),
  Product(id:'bread_10', name:'Mini Burger Bun', categoryId:'bread', price:30, imageUrl:'assets/images/sweet_bun.jpg', description:'Mini-sized burger bun', weight:40, isAvailable:true),

  // ── RUSK (from rusk.html — 9 products) ───────────────────────────────────
  // Standard @ Rs.200 per 250g
  Product(id:'rusk_1', name:'Special Rusk', categoryId:'rusk', price:200, imageUrl:'assets/images/ruskhtml.jpg', description:'Crispy special rusk', weight:250, isAvailable:true),
  Product(id:'rusk_2', name:'Slice Rusk', categoryId:'rusk', price:200, imageUrl:'assets/images/rusk.png', description:'Crispy slice rusk', weight:250, isAvailable:true),
  Product(id:'rusk_3', name:'Round Rusk', categoryId:'rusk', price:200, imageUrl:'assets/images/rusk.png', description:'Classic round rusk', weight:250, isAvailable:true),
  Product(id:'rusk_4', name:'1 Bite Round Rusk', categoryId:'rusk', price:200, imageUrl:'assets/images/rusk.png', description:'Mini round rusk bites', weight:250, isAvailable:true),
  Product(id:'rusk_5', name:'1 Bite Slice Rusk', categoryId:'rusk', price:200, imageUrl:'assets/images/rusk.png', description:'Mini slice rusk bites', weight:250, isAvailable:true),
  Product(id:'rusk_6', name:'Long Sesame Rusk', categoryId:'rusk', price:200, imageUrl:'assets/images/ruskhtml.jpg', description:'Long rusk with sesame seeds', weight:250, isAvailable:true),
  // Premium @ Rs.300 per 250g
  Product(id:'rusk_7', name:'Almond Rusk', categoryId:'rusk', price:300, imageUrl:'assets/images/almondrusk.jpg', description:'Crunchy rusk with almond pieces', weight:250, isAvailable:true),
  Product(id:'rusk_8', name:'Coconut Rusk', categoryId:'rusk', price:300, imageUrl:'assets/images/ruskhtml.jpg', description:'Rusk with coconut flavour', weight:250, isAvailable:true),
  Product(id:'rusk_9', name:'Garlic Rusk', categoryId:'rusk', price:300, imageUrl:'assets/images/Garlicrusk.jpg', description:'Savory garlic flavored rusk', weight:250, isAvailable:true),

  // ── COOKIES & KHATAI (from cookies&khatai.html — 13 products) ─────────────
  // All @ Rs.550 per 250g
  Product(id:'cookie_1', name:'Walnut Cookie', categoryId:'cookies', price:550, imageUrl:'assets/images/khataihtml.png', description:'Cookie with walnuts', weight:250, isAvailable:true),
  Product(id:'cookie_2', name:'Almond Cookie', categoryId:'cookies', price:550, imageUrl:'assets/images/khataihtml.png', description:'Cookie with almonds', weight:250, isAvailable:true),
  Product(id:'cookie_3', name:'Chocolate Chip Cookie', categoryId:'cookies', price:550, imageUrl:'assets/images/chocochipbiscuit.png', description:'Classic chocolate chip cookie', weight:250, isAvailable:true),
  Product(id:'cookie_4', name:'Peanut Cookie', categoryId:'cookies', price:550, imageUrl:'assets/images/khataihtml.png', description:'Cookie with peanuts', weight:250, isAvailable:true),
  Product(id:'cookie_5', name:'Date Cookie', categoryId:'cookies', price:550, imageUrl:'assets/images/khataihtml.png', description:'Cookie with dates', weight:250, isAvailable:true),
  Product(id:'cookie_6', name:'Red Velvet Cookie', categoryId:'cookies', price:550, imageUrl:'assets/images/khataihtml.png', description:'Red velvet flavored cookie', weight:250, isAvailable:true),
  Product(id:'cookie_7', name:'Brownie Cookie', categoryId:'cookies', price:550, imageUrl:'assets/images/khataihtml.png', description:'Rich brownie cookie', weight:250, isAvailable:true),
  Product(id:'cookie_8', name:'Naan Khatai', categoryId:'cookies', price:550, imageUrl:'assets/images/khataihtml.png', description:'Traditional naan khatai', weight:250, isAvailable:true),
  Product(id:'cookie_9', name:'Beesan Khatai', categoryId:'cookies', price:550, imageUrl:'assets/images/khataihtml.png', description:'Traditional beesan khatai', weight:250, isAvailable:true),
  Product(id:'cookie_10', name:'Almond Khatai', categoryId:'cookies', price:550, imageUrl:'assets/images/khataihtml.png', description:'Khatai with almonds', weight:250, isAvailable:true),
  Product(id:'cookie_11', name:'Coconut Khatai', categoryId:'cookies', price:550, imageUrl:'assets/images/khataihtml.png', description:'Khatai with coconut', weight:250, isAvailable:true),
  Product(id:'cookie_12', name:'Lahori Khatai', categoryId:'cookies', price:550, imageUrl:'assets/images/khataihtml.png', description:'Traditional Lahori khatai', weight:250, isAvailable:true),
  Product(id:'cookie_13', name:'Pistachio Cookie', categoryId:'cookies', price:550, imageUrl:'assets/images/khataihtml.png', description:'Cookie with pistachios', weight:250, isAvailable:true),

  // ── PUFFS (from puffs.html — 15 products) ────────────────────────────────
  Product(id:'puff_1', name:'Chicken Patty', categoryId:'puffs', price:120, imageUrl:'assets/images/puffhtml.png', description:'Savory chicken patty', weight:80, isAvailable:true),
  Product(id:'puff_2', name:'Vegetable Patty', categoryId:'puffs', price:120, imageUrl:'assets/images/puffhtml.png', description:'Crispy vegetable patty', weight:80, isAvailable:true),
  Product(id:'puff_3', name:'Chicken Patties 1 Bite', categoryId:'puffs', price:400, imageUrl:'assets/images/puffhtml.png', description:'Mini chicken patty bites', weight:250, isAvailable:true),
  Product(id:'puff_4', name:'Cheese Tie Puff', categoryId:'puffs', price:400, imageUrl:'assets/images/puffhtml.png', description:'Cheese filled tie puff', weight:250, isAvailable:true),
  Product(id:'puff_5', name:'Zeera Stick Puff', categoryId:'puffs', price:400, imageUrl:'assets/images/puffhtml.png', description:'Cumin flavored stick puff', weight:250, isAvailable:true),
  Product(id:'puff_6', name:'Icing Tie Puff', categoryId:'puffs', price:400, imageUrl:'assets/images/puffhtml.png', description:'Sweet icing tie puff', weight:250, isAvailable:true),
  Product(id:'puff_7', name:'French Heart Tie Puff', categoryId:'puffs', price:400, imageUrl:'assets/images/puffhtml.png', description:'Heart shaped French puff', weight:250, isAvailable:true),
  Product(id:'puff_8', name:'U Puff', categoryId:'puffs', price:400, imageUrl:'assets/images/puffhtml.png', description:'U-shaped crispy puff', weight:250, isAvailable:true),
  Product(id:'puff_9', name:'Sugar Puff', categoryId:'puffs', price:400, imageUrl:'assets/images/puffhtml.png', description:'Sweet sugar puff', weight:250, isAvailable:true),
  Product(id:'puff_10', name:'Butter Puff', categoryId:'puffs', price:400, imageUrl:'assets/images/puffhtml.png', description:'Buttery crispy puff', weight:250, isAvailable:true),
  Product(id:'puff_11', name:'Plain Puff', categoryId:'puffs', price:400, imageUrl:'assets/images/plainpuff.png', description:'Classic plain puff', weight:250, isAvailable:true),
  Product(id:'puff_12', name:'Chocolate Puff', categoryId:'puffs', price:400, imageUrl:'assets/images/puffhtml.png', description:'Chocolate filled puff', weight:250, isAvailable:true),
  Product(id:'puff_13', name:'Ringo Puff', categoryId:'puffs', price:400, imageUrl:'assets/images/puffhtml.png', description:'Ring shaped puff', weight:250, isAvailable:true),
  Product(id:'puff_14', name:'Butter Bakarkhani Puff', categoryId:'puffs', price:400, imageUrl:'assets/images/puffhtml.png', description:'Butter bakarkhani puff', weight:250, isAvailable:true),
  Product(id:'puff_15', name:'Parsley Stick Puff', categoryId:'puffs', price:400, imageUrl:'assets/images/puffhtml.png', description:'Parsley flavored stick puff', weight:250, isAvailable:true),

  // ── PASTRIES ─────────────────────────────────────────────────────────────
  Product(id:'pastry_1', name:'Chocolate Puff Pastry', categoryId:'pastries', price:180, imageUrl:'assets/images/choclatepuffpastry.png', description:'Crispy puff pastry with chocolate', weight:100, isAvailable:true),
  Product(id:'pastry_2', name:'Fresh Cream Pastry', categoryId:'pastries', price:150, imageUrl:'assets/images/freshcreampastryhtml.png', description:'Light pastry with fresh cream', weight:80, isAvailable:true),
  Product(id:'pastry_3', name:'Black Currant Pastry', categoryId:'pastries', price:160, imageUrl:'assets/images/blackcurrentpastry.png', description:'Pastry with black currant jam', weight:90, isAvailable:true),
  Product(id:'pastry_4', name:'Almond Honey Pastry', categoryId:'pastries', price:200, imageUrl:'assets/images/almondhoneypastry.png', description:'Flaky pastry with almond and honey', weight:110, isAvailable:true),
  Product(id:'pastry_5', name:'Mousse Pastry', categoryId:'pastries', price:200, imageUrl:'assets/images/moussepastry.jpg', description:'Smooth mousse filled pastry', weight:100, isAvailable:true),

  // ── ICE CREAM (from icecream.html — 10 items, coming soon) ──────────────────
  Product(id:'icecream_1', name:'Classic Vanilla', categoryId:'icecream', price:0, imageUrl:'assets/images/icecream.png', description:'Coming soon — Classic Vanilla ice cream', weight:500, isAvailable:false),
  Product(id:'icecream_2', name:'Belgian Chocolate', categoryId:'icecream', price:0, imageUrl:'assets/images/icecream.png', description:'Coming soon — Belgian Chocolate ice cream', weight:500, isAvailable:false),
  Product(id:'icecream_3', name:'Fresh Strawberry', categoryId:'icecream', price:0, imageUrl:'assets/images/icecream.png', description:'Coming soon — Fresh Strawberry ice cream', weight:500, isAvailable:false),
  Product(id:'icecream_4', name:'Royal Mango', categoryId:'icecream', price:0, imageUrl:'assets/images/icecream.png', description:'Coming soon — Royal Mango ice cream', weight:500, isAvailable:false),
  Product(id:'icecream_5', name:'Pistachio Praline', categoryId:'icecream', price:0, imageUrl:'assets/images/icecream.png', description:'Coming soon — Pistachio Praline ice cream', weight:500, isAvailable:false),
  Product(id:'icecream_6', name:'Crunchy Butterscotch', categoryId:'icecream', price:0, imageUrl:'assets/images/icecream.png', description:'Coming soon — Crunchy Butterscotch ice cream', weight:500, isAvailable:false),
  Product(id:'icecream_7', name:'Espresso Coffee', categoryId:'icecream', price:0, imageUrl:'assets/images/icecream.png', description:'Coming soon — Espresso Coffee ice cream', weight:500, isAvailable:false),
  Product(id:'icecream_8', name:'Cookies & Cream', categoryId:'icecream', price:0, imageUrl:'assets/images/icecream.png', description:'Coming soon — Cookies & Cream ice cream', weight:500, isAvailable:false),
  Product(id:'icecream_9', name:'Tutti Frutti', categoryId:'icecream', price:0, imageUrl:'assets/images/icecream.png', description:'Coming soon — Tutti Frutti ice cream', weight:500, isAvailable:false),
  Product(id:'icecream_10', name:'Shahi Kulfa', categoryId:'icecream', price:0, imageUrl:'assets/images/icecream.png', description:'Coming soon — Shahi Kulfa ice cream', weight:500, isAvailable:false),

  // ── DONUTS (from donuts.html — 8 products) ───────────────────────────────
  // Standard @ Rs.150
  Product(id:'donut_1', name:'Glazed Original', categoryId:'donuts', price:150, imageUrl:'assets/images/donut_category.png', description:'Classic glazed donut', weight:80, isAvailable:true),
  Product(id:'donut_2', name:'Chocolate Frosted', categoryId:'donuts', price:150, imageUrl:'assets/images/donut_category.png', description:'Chocolate frosted donut', weight:80, isAvailable:true),
  Product(id:'donut_3', name:'Strawberry Sprinkles', categoryId:'donuts', price:150, imageUrl:'assets/images/donut_category.png', description:'Strawberry donut with sprinkles', weight:80, isAvailable:true),
  Product(id:'donut_4', name:'Cinnamon Sugar', categoryId:'donuts', price:150, imageUrl:'assets/images/donut_category.png', description:'Cinnamon sugar coated donut', weight:80, isAvailable:true),
  // Filled @ Rs.200
  Product(id:'donut_5', name:'Boston Cream (Filled)', categoryId:'donuts', price:200, imageUrl:'assets/images/donut_category.png', description:'Boston cream filled donut', weight:100, isAvailable:true),
  Product(id:'donut_6', name:'Raspberry Jelly (Filled)', categoryId:'donuts', price:200, imageUrl:'assets/images/donut_category.png', description:'Raspberry jelly filled donut', weight:100, isAvailable:true),
  Product(id:'donut_7', name:'Nutella Dream (Filled)', categoryId:'donuts', price:200, imageUrl:'assets/images/donut_category.png', description:'Nutella filled donut', weight:100, isAvailable:true),
  Product(id:'donut_8', name:'Vanilla Custard (Filled)', categoryId:'donuts', price:200, imageUrl:'assets/images/donut_category.png', description:'Vanilla custard filled donut', weight:100, isAvailable:true),

  // ── SNACKS (from snacks.html — Coming Soon) ─────────────────────────────
  Product(id:'snack_1', name:'Savory Snacks', categoryId:'snacks', price:0, imageUrl:'assets/images/snacks.jpg', description:'Coming soon — Our exclusive range of savory snacks is being crafted for you!', weight:500, isAvailable:false),

  // ── NIMKO (from nimko.html — 10 products @ Rs.130) ─────────────────────
  Product(id:'nimko_1', name:'Daal Moong', categoryId:'nimko', price:130, imageUrl:'assets/images/Nimko.png', description:'Crispy daal moong nimko', weight:250, isAvailable:true),
  Product(id:'nimko_2', name:'Daal Chana', categoryId:'nimko', price:130, imageUrl:'assets/images/Nimko.png', description:'Crispy daal chana nimko', weight:250, isAvailable:true),
  Product(id:'nimko_3', name:'Daal Moth', categoryId:'nimko', price:130, imageUrl:'assets/images/Nimko.png', description:'Crispy daal moth nimko', weight:250, isAvailable:true),
  Product(id:'nimko_4', name:'Daal Mash', categoryId:'nimko', price:130, imageUrl:'assets/images/Nimko.png', description:'Crispy daal mash nimko', weight:250, isAvailable:true),
  Product(id:'nimko_5', name:'Mix Nimko', categoryId:'nimko', price:130, imageUrl:'assets/images/Nimko.png', description:'Mixed nimko assortment', weight:250, isAvailable:true),
  Product(id:'nimko_6', name:'Spicy Mix', categoryId:'nimko', price:130, imageUrl:'assets/images/Nimko.png', description:'Spicy nimko mix', weight:250, isAvailable:true),
  Product(id:'nimko_7', name:'Gathiya', categoryId:'nimko', price:130, imageUrl:'assets/images/Nimko.png', description:'Traditional gathiya nimko', weight:250, isAvailable:true),
  Product(id:'nimko_8', name:'Sev', categoryId:'nimko', price:130, imageUrl:'assets/images/Nimko.png', description:'Crispy sev nimko', weight:250, isAvailable:true),
  Product(id:'nimko_9', name:'Masala Peanuts', categoryId:'nimko', price:130, imageUrl:'assets/images/Nimko.png', description:'Spiced masala peanuts', weight:250, isAvailable:true),
  Product(id:'nimko_10', name:'Potato Sticks', categoryId:'nimko', price:130, imageUrl:'assets/images/Nimko.png', description:'Crunchy potato stick nimko', weight:250, isAvailable:true),

  // ── CHOCOLATE (from chocolate.html — Coming Soon) ──────────────────────
  Product(id:'choco_1', name:'Premium Chocolates', categoryId:'chocolate', price:0, imageUrl:'assets/images/chocolate.png', description:'Coming soon — Our premium chocolate collection is being crafted!', weight:100, isAvailable:false),

  // ── SANDWICHES ────────────────────────────────────────────────────────────
  Product(id:'sandwich_1', name:'Chicken Sandwich', categoryId:'sandwiches', price:400, imageUrl:'assets/images/sandwich.jpg', description:'Delicious chicken sandwich', weight:250, isAvailable:true),

  // ── SALAD (from salad.html — Coming Soon) ───────────────────────────────
  Product(id:'salad_1', name:'Fresh Salads', categoryId:'salad', price:0, imageUrl:'assets/images/salad.png', description:'Coming soon — Fresh, healthy and delicious salads are on their way!', weight:300, isAvailable:false),

  // ── GIFTING ───────────────────────────────────────────────────────────────
  Product(id:'gift_1', name:'Gift Hamper', categoryId:'gifting', price:2500, imageUrl:'assets/images/gifting.png', description:'Premium gift hamper with assorted bakery items', weight:1000, isAvailable:true),
];
