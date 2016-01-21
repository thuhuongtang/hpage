
//var val_lang = $('input[name="hidden_lang"]').val();
var val_lang = "en";
var mStr_kr, mStr_en, mStr_cn, href, text, W = 0;
//var href, text = "이동하실 메뉴를 선택해 주세요.";

//lang = en
mStr_en = '<div class="hide_menu">';
mStr_en += '<div class="scrollOver overthrow">';
mStr_en += '<div class="ms_menu">';
mStr_en += '<p class="mstit"><span class="msico"><a href="/index_en.html">Home</a></span><span class="mstxt">Please select a menu.</span></p>';

mStr_en += '<div class="depth12">';

mStr_en += '<ul class="depth1">';
mStr_en += '<li><a href="javascript:void(0);">Business<span>&nbsp;</span></a>';
mStr_en += '<ul class="depth2">';
mStr_en += '<li><a href="javascript:void(0)" class="dep3">Service<span>&nbsp;</span></a></li>';
mStr_en += '<li><a href="/business/solution01_en.jsp">Solution</a></li>';
mStr_en += '<li><a href="/servlet/Reference?lang=en">References</a></li>';
mStr_en += '</ul>';
mStr_en += '</li>';
mStr_en += '<li><a href="javascript:void(0);">About Us<span>&nbsp;</span></a>';
mStr_en += '<ul class="depth2">';
mStr_en += '<li><a href="javascript:void(0)" class="dep3">Company Profile<span>&nbsp;</span></a></li>';
mStr_en += '<li><a href="javascript:void(0)" class="dep3">CEO<span>&nbsp;</span></a></li>';
mStr_en += '<li><a href="/introduce/vision_en.jsp">Vision</a></li>';
mStr_en += '<li><a href="javascript:void(0)" class="dep3">Sustainable Management<span>&nbsp;</span></a></li>';
mStr_en += '<li><a href="javascript:void(0)" class="dep3">Innovative Management<span>&nbsp;</span></a></li>';
mStr_en += '</ul>';
mStr_en += '</li>';
mStr_en += '<li><a href="javascript:void(0);">IR<span>&nbsp;</span></a>';
mStr_en += '<ul class="depth2">';
mStr_en += '<li><a href="/ir/ir_stockInfo_en.jsp">Stock Information</a></li>';
mStr_en += '<li><a href="/ir/ir_financialInfo_en.jsp">Financial Information</a></li>';
mStr_en += '</ul>';
mStr_en += '</li>';
mStr_en += '<li><a href="javascript:void(0);">PR Center<span>&nbsp;</span></a>';
mStr_en += '<ul class="depth2">';
mStr_en += '<li><a href="/servlet/PoscoictBoard?code=news&lang=en">News</a></li>';
mStr_en += '<li><a href="/prcenter/pr_multimedia_en.jsp">PR Data Room</a></li>';
mStr_en += '<li><a href="/prcenter/pr_ci_en.jsp">CI Guide</a></li>';
mStr_en += '</ul>';
mStr_en += '</li>';
mStr_en += '<li><a href="javascript:void(0);">Support<span>&nbsp;</span></a>';
mStr_en += '<ul class="depth2">';
mStr_en += '<li><a href="/support/cs_cvms_en.jsp">Contact Us</a></li>';
mStr_en += '<li><a href="/support/cs_location_en.jsp">Global Network</a></li>';
mStr_en += '</ul>';
mStr_en += '</li>';
mStr_en += '<li><a href="javascript:void(0);">Information<span>&nbsp;</span></a>';
mStr_en += '<ul class="depth2">';
mStr_en += '<li><a href="/guide/sitemap_en.jsp">Site Map</a></li>';
mStr_en += '<li><a href="/guide/search_en.jsp">Search</a></li>';
mStr_en += '</ul>';
mStr_en += '</li>';
mStr_en += '</ul>';

mStr_en += '</div>';

//사업분야 - Service
mStr_en += '<div class="depth34">';

mStr_en += '<ul class="depth3">';
mStr_en += '<li><a href="/business/srv_overview_en.jsp">Overview</a></li>';
mStr_en += '<li><a href="javascript:void(0);">Smart Business<span>&nbsp;</span></a>';
mStr_en += '<ul class="depth4">';
mStr_en += '<li><a href="/business/srv_business_en.jsp">Smart Energy</a></li>';
mStr_en += '<li><a href="/business/srv_business02_en.jsp">Smart Grid</a></li>';
mStr_en += '<li><a href="/business/srv_business03_en.jsp">Smart City</a></li>';
mStr_en += '<li><a href="/business/srv_business04_en.jsp">Smart Building</a></li>';
mStr_en += '<li><a href="/business/srv_business05_en.jsp">Smart Work</a></li>';
mStr_en += '</ul>';
mStr_en += '</li>';
mStr_en += '<li><a href="javascript:void(0);">Smart Integration<span>&nbsp;</span></a>';
mStr_en += '<ul class="depth4">';
mStr_en += '<li><a href="/business/srv_integration_en.jsp">Consulting</a></li>';
mStr_en += '<li><a href="/business/srv_integration02_en.jsp">Smart ITO</a></li>';
mStr_en += '</ul>';
mStr_en += '</li>';
mStr_en += '<li><a href="javascript:void(0);">Smart Engineering<span>&nbsp;</span></a>';
mStr_en += '<ul class="depth4">';
mStr_en += '<li><a href="/business/srv_engineering_en.jsp">Plant</a></li>';
mStr_en += '<li><a href="/business/srv_engineering02_en.jsp">Logistics</a></li>';
mStr_en += '<li><a href="/business/srv_engineering03_en.jsp">Transport</a></li>';
mStr_en += '<li><a href="/business/srv_engineering04_en.jsp">Power/Energy</a></li>';
mStr_en += '<li><a href="/business/srv_engineering05_en.jsp">Environment</a></li>';
mStr_en += '</ul>';
mStr_en += '</li>';
mStr_en += '<li><a href="javascript:void(0);">Smart Infra<span>&nbsp;</span></a>';
mStr_en += '<ul class="depth4">';
mStr_en += '<li><a href="/business/srv_consulting_en.jsp">Cloud Computing</a></li>';
mStr_en += '<li><a href="/business/srv_consulting02_en.jsp">Cloud Data Center</a></li>';
mStr_en += '<li><a href="/business/srv_consulting03_en.jsp">Network Integration</a></li>';
mStr_en += '<li><a href="/business/srv_consulting04_en.jsp">Smart Security</a></li>';
mStr_en += '</ul>';
mStr_en += '</li>';
mStr_en += '</ul>';
mStr_en += '</div>';

//기업정보 - 기업정보
mStr_en += '<div class="depth34">';
mStr_en += '<ul class="depth3">';
mStr_en += '<li><a href="/introduce/intro_comInfo_en.jsp">Overview</a></li>';
mStr_en += '<li><a href="/introduce/intro_history_en.jsp">History</a></li>';
mStr_en += '</ul>';
mStr_en += '</div>';

//기업정보 - CEO
mStr_en += '<div class="depth34">';
mStr_en += '<ul class="depth3">';
mStr_en += '<li><a href="/introduce/ceo_msg_en.jsp">Greetings</a></li>';
mStr_en += '<li><a href="/introduce/ceo_profile_en.jsp">Profile</a></li>';
mStr_en += '</ul>';
mStr_en += '</div>';

//기업정보 - 지속가능경영
mStr_en += '<div class="depth34">';
mStr_en += '<ul class="depth3">';
mStr_en += '<li><a href="/introduce/sust_gratitude_en.jsp">Sharing Appreciation</a></li>';
mStr_en += '<li><a href="/introduce/sust_csr_en.jsp">Social Contribution</a></li>';
mStr_en += '<li><a href="/introduce/sust_ethics_en.jsp">Ethical Management<span>&nbsp;</span></a></li>';
mStr_en += '<li><a href="/introduce/sust_fairTrade_en.jsp">Win-Win Growth</a></li>';
mStr_en += '<li><a href="/introduce/sust_manageEco_en.jsp">Environmental management</a></li>';
mStr_en += '</ul>';
mStr_en += '</div>';

//기업정보 - 혁신경영
mStr_en += '<div class="depth34">';
mStr_en += '<ul class="depth3">';
mStr_en += '<li><a href="/introduce/innov_rnd_en.jsp">R&amp;D</a></li>';
mStr_en += '<li><a href="/introduce/innov_qm_en.jsp">Quality Management</a></li>';
mStr_en += '</ul>';
mStr_en += '</div>';

mStr_en += '</div>';
mStr_en += '</div>';
mStr_en += '</div>';

if($(window).width() < 767){
	switch(val_lang){
		case 'kr':
			$('body').prepend(mStr_kr);
			href = "/";
			txt = "이동하실 메뉴를 선택해 주세요.";
		break;
		case 'en' :
			$('body').prepend(mStr_en);
			href = "/servlet/Main?lang=en";
			txt = "Please select a menu.";
		break;
		case 'cn' :
			$('body').prepend(mStr_cn);
			href = "/servlet/Main?lang=cn";
			txt = "请选择一个菜单。";
		break;
		default:
		 	document.write("<b>없는 데이터 입니다</b>");	
	}
}

//모바일 슬라이드 메뉴 - 홈으로 이동 버튼 클릭시 클래스 적용
$('.toHome>a').click(function(index){
	$("html").css({"overflow-x":"visible"});
	$("body").css({"overflow":"visible"});
	$(".hide_menu").animate({"left":"-85%"}, 200).css({"height":"100%"});
	$("#footer").animate({"left":"0"}, 200);
	$("#wrapper").css({'position':'static'}).animate({"left":"0"}, 200);
})

//모바일 슬라이드 메뉴 - 슬라이드 모션
var opens = false;
$("#open-left").click(function(){
	if(opens == false){
		$(this).toggleClass('on');
		$('.ttl_now').css('background-color','#182045');
		$("html").css({"overflow-x":"hidden"});
		$("body").css({"overflow":"hidden"});
		$(".hide_menu").css({"display":"block"}).animate({"left":"0"}, 200);
		$("#footer").animate({"left":"85%"}, 200);
		$("#wrap").css({'position':'relative','height':'100%'}).animate({"left":"85%"}, 200);
		opens = true;
	}else{
		$(this).removeClass('on');
		$('.ttl_now').css('background-color','#0062C3');
		$("html").css({"overflow-x":"visible"});
		$("body").css({"overflow":"visible"});
		$(".hide_menu").animate({"left":"-85%"}, 200).css({"height":"100%"});
		$("#footer").animate({"left":"0"}, 200);
		$("#wrap").css({'position':'static'}).animate({"left":"0"}, 200);
		opens = false;
	}
});

//Side Menu Control
$(function(){
	$(".depth1>li>a").each(function(idx){
		$(this).bind({
			click:function(){
				$(this).parent().toggleClass("openul");
				$(this).parent().find(".depth2").slideToggle('fast');
			}
		});
	});
	$(".depth2>li>a").each(function(idx){
		$(this).bind({
			click:function(e){
				if($(this).attr("class") == "dep3"){
					W = $(this).parent().parent().parent().parent().width();
					$(this).parent().parent().parent().parent().animate({'margin-left':W+'px'}, 200, function(){
						$(this).hide();
					});

					href = $(".msico a").attr("href");

					$(".msico a").css({"background-position":"21px -26px"}).text(txt).attr("href","#").addClass("mprev");
					//alert($(this).text());
					$(".mstxt").text($(this).text()).css({"font-size":"16px"});
				}
			}
		});
	});

	$(".dep3").each(function(idx){
		$(this).bind({
			click:function(){
				$(".depth3").eq(idx).show().animate({'margin-left':'0px'}, 200);
			}
		});
	});

	$(".depth3>li>a").each(function(idx){
		$(this).bind({
			click:function(){
				$(this).parent().toggleClass("openul2");
				$(this).parent().find(".depth4").slideToggle('fast');
			}
		});
	});

	$(".msico a").bind({
		click:function(e){
			if($(this).hasClass("mprev")){
				$(".depth1").animate({'margin-left':'0'}, 200);
				$(".ms_menu ul li").each(function(){
					$(this).removeClass("openul2");
				});

				$(".msico a").css({"background-position":"23px 13px"}).text("Home").attr("href",href).removeClass("mprev");
				$(".mstxt").text(text).css({"font-size":"13px"});

				reset();//초기화

				e.preventDefault();
			}
		}
	});

	$("#open-left").bind({
		click:function(e){
			e.preventDefault();
			reset();
		}
	});
});

//Side Menu Reset
function reset(){
	$(".depth2, .depth4").each(function(){
		$(this).slideUp('fast');
	});
	$(".depth1 li, .depth3 li").each(function(){
		$(this).removeClass("openul").removeClass("openul2");
	});
	$(".depth1").css({"margin-left":"0"}).show();
	$(".depth3").hide();
	$(".msico a").css({"background-position":"23px 13px"}).text("Home").attr("href",href).removeClass("mprev");
	$(".mstxt").text(txt).css({"font-size":"13px"});
}