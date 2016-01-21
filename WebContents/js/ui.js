$(document).ready(function(){
	
    var _mains = $(".depth1");
	var _mainMenuImg = $(".depth1 .txt");
	var _subGroup = $(".depth2");
	var _subs = $(".depth2 li .subTxt"); 
	var _mNum = -1;
    var _sNum = -1;
	var _currentMainId = -1;
	
    var activeMenu=( function(){
       var items = [];
       var subItems = [];
       var subBarHideX = -50;
       var subBarOverSpeed = 550;
       var subBarHideSpeed = 300;
       var addBarW = 30;
	   var startSubX=0;
       var easingFunc= "easeOutQuint";
	   var subOverColor="#aad0ff";
	   var subOutColor="#ffffff";
	   
       _mains.each(function(i, item){
           _subGroup.css("display", "block");
           var subMenus = _subGroup.eq(i).children("li");
           var subBar = $(this).children().eq(1);
           var arrow = subBar.children(".barArrow");
           var leftRect = subBar.children(".barLeftRect")
           var centerRect = subBar.children(".barCenterRect")
           var rightRect = subBar.children(".barRightRect");
           var subW = 0;
           var subLen = subMenus.length;
           subItems[i] = [];
           //서브 메뉴의 각각 길이값을 가져와 총 길이값을 계산한다.
           subMenus.each(function(j, child){
               subW += $(this).outerWidth();
               subItems[i].push(subMenus.children("a").eq(j));
           });
		   //배열에 각각의 정보를 수집해 둔다. menu-메인메뉴 이미지 / sub-서브메뉴 / subW - 서브메뉴width / bar-서브바 / arrow- 화살표시이미지
            items.push({ menu: _mainMenuImg[i], sub: _subGroup.eq(i), subW:subW, bar: subBar, arrow:arrow });
			_subGroup.eq(i).css({ width:(subW+18*i)+addBarW } );
           //서브 메뉴 위치 맞춤
           _subGroup.eq(i).css({left:(i==_mains.length-1)? subW*-1+addBarW*2+startSubX : startSubX});
           //화살표 x 위치 맞춤
           //중앙 서브바 길이 메뉴 길이에 맞춤
           centerRect.css({ width: subW + addBarW});
           //우측 서브바 위치 중앙서브바 길이에 맞추어 x값 재배치
           rightRect.css({ left: subW + rightRect.outerWidth() + addBarW});
       });
	   
   	   function init(){
	   	    activeMainMenu(-1);
	   }
	   
       //메인 메뉴 및 서브그룹/서브바 활성 
       function activeMainMenu(id){
           for (var i = 0, len = items.length; i < len; i++) {
		   	   var mains=$(  items[i].menu );
               var subs = $(items[i].sub);
               var bar = $(items[i].bar);
			   var arrow=$(items[i].arrow);
				
               if (id == i) {
			   	
				   mains.css("color", "#2c69b2");
			   	   //서브바 보이게 한다.
                   subs.css("display", "block");
				   //메인 이미지명이 _on으로 끝나는 것으로 바꿈
                   /*
mains.attr("src", function(){
                       return $(this).attr("src").replace("_off", "_on")
                   });
*/               
				  var mainX=mains.position().left;
				  var mainW=mains.outerWidth();
				  var arrowW=arrow.outerWidth();
				  
				  //마지막 메뉴일 경우 서브바 및 화살표 위치 업데이트
				  var barX=(i==items.length-1)? mainX-items[i].subW+addBarW : mainX-addBarW
				  var arrowX=(i==items.length-1)?( mainW-arrowW)/2+items[i].subW-addBarW : ( mainW-arrowW)/2+addBarW;
                   bar.css("display", "block").stop().animate({ left: barX, opacity: 1}, subBarOverSpeed, easingFunc );
				   arrow.stop().animate({ left:arrowX}, subBarOverSpeed, easingFunc );
               }else {
			   	   mains.css("color", "#000000");
                   subs.css("display", "none");
				   //메인 이미지명이 _off으로 끝나는 것으로 바꿈
                  /*
 mains.attr("src", function(){
                       return $(this).attr("src").replace("_on", "_off");
                   });
*/
				   //서브바를 -30으로 이동킨다. 단 마지막 서브바는  -items[i].subW만큼 이동시킴. 모션이 완료후 서브바를  display:none 으로 처리
				   var barDefaultX=(i==items.length-1)? -items[i].subW : -30;
                   bar.stop().animate({ left:barDefaultX, opacity: 0}, subBarHideSpeed, easingFunc, function(){
                       $(this).css("display", "none");
                   });
				   arrow.stop().animate({ left:0}, subBarOverSpeed, easingFunc );
               }
           }
       }
       //서브메뉴 색상 활성
       function activeSubMenu(parentId, childId){
           for (var i = 0, len = items.length; i < len; i++) {
               for (var j = 0, sLen = subItems[i].length; j < sLen; j++) {
                   var subM = $(subItems[i][j]);
                   if (i == parentId && j == childId) {
                       subM.css("color", subOverColor);
                   }else {
                       subM.css("color", subOutColor);
                   }
               }
           }
       }
	   
	   function setMainMenu( id ){
	   	  _mNum=id;
	   }
	   
	   function setSubMenu( id ){
	   	  _sNum=id;
	   }
	   
	   return {
	   	   init:init,
	   	   main:activeMainMenu,
		   sub:activeSubMenu,
		   setMain:setMainMenu,
		   setSub:setSubMenu
	   }
   }() );
    
    _mains.bind({mouseenter: onMainMouseOver, mouseleave: onMainMouseOut});
    _mains.bind("click", function(){
		//_mNum = $(this).index();
    });
    _subs.bind({mouseenter: onSubOver,mouseleave: onSubOut});
    _subs.bind("click", function(){
       // _mNum = $(this).parents(".depth1").index();
       // _sNum = $(this).parent().index();
    });
	
    activeMenu.init();
	
    function onMainMouseOver(e){
        var target = e.currentTarget;
        var id = $(target).index();
        _currentMainId = id;
        activeMenu.main(_currentMainId);
    }
    
    function onMainMouseOut(e){
        activeMenu.main(_mNum);
    }
    function onSubOver(e){
        var parent = $(e.target).parent();
        activeMenu.sub(_currentMainId, parent.index() );
    }
    
    function onSubOut(e){
        activeMenu.sub(_mNum, _sNum);
    }
    
});

