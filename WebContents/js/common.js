$(document).ready(function(){

	//-------------------------------------------------------------- ì „ì—­í•¨ìˆ˜ ëª¨ì�Œ //

	$('.btn_print').each(function(idx){
		$(this).bind({
			'click':function(){

				var tg = $(this).parent().parent().html();

				$('.location ul > li').eq(idx).addClass("z21").append('<div class="prev_map" />');
				$('.location').append('<div class="bg_printbl" />');
				$('.prev_map').append('<div class="inprev" />');
				$('.prev_map > .inprev').append("<p class='print_close'><a href='javascript:void(0);'><img src='/images/common/btn_close.gif' alt='ë‹«ê¸°' /></a></p>").append(tg);
				$('.prev_map .fold_con').css('display','block');
				$('.prev_map .btn').removeClass("btn_print").addClass("hrefPrint").attr("id","locPrint");
				var height = $(window).height();
				var w = $('.prev_map').width();
				var h = $('.prev_map').height();

				$('.prev_map').css({
					"left":"0px",
					"top": "0px"
				}).focus();

				if($('.prev_map').css('display') == "block"){
					$(this).parent().parent().find('#locPrint').bind({
						'keydown':function(e){
							if(e.keyCode == "9"){
								e.preventDefault();
								$(this).blur();
								$('.prev_map .print_close a').focus();
							}
						}
					});
				}

				//Print
				$(".hrefPrint").bind({
					click:function() {
						// Print the DIV.
						//$(".printdiv").print();
						$(this).parent().parent().print();
						return (false);
					}
				});

				$(".print_close").bind({
					click:function(){
						$(".prev_map").remove();
						$(".bg_printbl").remove();
						$('.location ul > li').eq(idx).removeClass("z21");
					},
					'keydown':function(e){
						if(e.keyCode == "13"){
							e.preventDefault();
							$(".prev_map").remove();
							$(".bg_printbl").remove();
							$('.location ul > li').eq(idx).removeClass("z21");
							//$('.btn_fold a').eq(idx).focus();
							$('.btn_print').eq(idx).focus();
						}
					}
				});
			},
			'focusout':function(){
				// ì—´ê¸° ì ‘ê¸° í�¬ì»¤ìŠ¤ ìˆ˜ì • 20140421 ì‹ í˜„í˜¸
				// if($('.prev_map').css('display') !="block"){
				// 	$(this).parent().siblings('.btn_fold').find('.open').focus();
				// }
			}
		});
	});


	// Window ì°½ ì‚¬ì�´ì¦ˆ ë°˜í™˜ ì „ì—­ í•¨ìˆ˜
	var get_win_width = function(){
		return $(window).width()
	}

	//RADIO CLASS
	$('.radio_class').find('>li').on('click',function(e){
		if($(this).attr('href') == '#'){
			e.preventDefault();
		}
		if(!!$(this).has('a')){
			$(this).addClass('on').siblings().removeClass('on');
		}else{
		}
	});

	// BUTTON RADIO CLASS
	$('.multi').find('.btn').on('click',function(e){
		//MOVIE AND DESCRIPTION ì œì–´
		var idx = $(this).index();
		var target = $(this).parent().parent().parent().find('.desc');
		var mov_tg = $(this).parent().parent().parent().parent().find('.rwd_movie');
		target.hide();
		target.eq(idx).show();
		if($(this).hasClass('mov01')){
			mov_tg.attr('src','//www.youtube.com/embed/m5vehYUAHng?rel=0&wmode=opaque')
		}else{
			mov_tg.attr('src','//www.youtube.com/embed/vcjp0iagbmU?rel=0&wmode=opaque')
		}
		//BTN ON ì œì–´
		if($(this).attr('href') == '#'){
			e.preventDefault();
		}
		$(this).addClass('on').siblings().removeClass('on');
	});

	// SCROLL TO TOP BUTTON ì œì–´

	scroll_fnc();

	function scroll_fnc(){
		var toTopBtn = $(this).scrollTop();
		if(toTopBtn >700){
			$('.scroll_top').fadeIn();
		}else{
			$('.scroll_top').fadeOut();
		}
	};
	$(window).scroll(function(){	
		scroll_fnc();
	});

	$('.scroll_top').on('click','a',function(e){
		e.preventDefault();
		$('html, body').stop().animate({
			scrollTop : 0
		},800);
	});

	// FAMILY SITE TOGGLE íŒ¨ë°€ë¦¬ ì‚¬ì�´íŠ¸ íŽ˜ì�´ë“œ í† ê¸€
	$('.f_fam').find('.fam_ttl').on('click',function(e){
		if($(this).attr('href') == '#'){
			e.preventDefault();
		}
		var fam_list = $(this).next();
		var fam_top = 10;
		fam_list.css('top',-(fam_list.height()+fam_top)+'px')
		$(this).next().fadeToggle(300,'linear')
	});

	// SKIP NAVIGATION
	$('.skip_navi').on(
		{focusin:function(){
			$(this).css('top','0px');
		},
		focusout:function(){
			$(this).css('top','-67px');
		}
	});

	//PRìž�ë£Œì‹¤ ë�™ì˜�ìƒ� ë†’ì�´ ì´ˆê¸° ì •ë³´
	var rwd_mov_fnc = {
		rwd_mov : $('.rwd_movie'),
		rwd_mh : $('.rwd_movie').attr('height'),
		rwd_mw : $('.rwd_movie').attr('width'),
		cal_rwd_size : function(){
			var rwd_mov_ratio =  this.rwd_mh / this.rwd_mw;
			return rwd_mov_ratio;
		}
	};


	// ëª¨ë°”ì�¼ ì�´ë¯¸ì§€ êµ�ì²´
	swapImg();
	//fixClear();
	
	// Window Resize Event
	$(window).resize(function(){

		// PRìž�ë£Œì‹¤ ë�™ì˜�ìƒ� ë†’ì�´ì œì–´
		rwd_mov_fnc.rwd_mov.height(rwd_mov_fnc.rwd_mov.width() * rwd_mov_fnc.cal_rwd_size());

		// ëª¨ë°”ì�¼ ì�´ë¯¸ì§€ êµ�ì²´
		swapImg();

		//Header Fixed Position Clear
		// fixClear();
		if($(this).width() <1200 ){
			$('.scroll_top').fadeOut();
		}else{
			$('.scroll_top').fadeIn();
		}

	});


	//Header Fixed Position Clear
	function fixClear(){
		if((verify_device.detect() == 'desktop')){

			var _win = $(window).width();
			if(_win < 1024){
				$('.header_w').css('position','absolute');
			}else{
				$('.header_w').css('position','fixed');
			}
		}
	}
	

	// Global Navigation
	function navi_fnc_01(e){
		var hgt = 67;
		$('.header_w').stop().animate({
			height:hgt
		},duration+300);
		con_pdt(hgt);
	};
	function navi_fnc_02(e){
		var hgt = 107;
		$('.header_w').stop().animate({
			height:hgt
		},duration);
		con_pdt(hgt);
	};
	function navi_fnc_03(e){
		var hgt = 147;
		$('.header_w').stop().animate({
			height:hgt
		},duration);
		con_pdt(hgt);
	};
	// Adjust Container Padding Top 
	function con_pdt (hgt){ 
		var cpt = ($('#wrap').hasClass('main')) ? 0 : 50;
		$('.container').stop().animate({
			'paddingTop':hgt+cpt+'px'
		},duration);
	};
		
	// GNB DEP02, SIDEBAR S_DEP02 í™”ì‚´í‘œ í‘œì‹œ
	$('.dep02, .s_dep02').find('>li').has('ul').each(function(){
		$(this).addClass('hv');
	});
	$('.dep02, .s_dep02').find('>li').not('.hv').each(function(){
		$(this).addClass('nothv');
	});

	if(get_win_width()<768){
		//MOBILE ì‹¤í–‰X
	}else{
		//TABLET AND PC ì‹¤í–‰
		var duration = 400;
		
		if(get_win_width() < 1025){
			//TABLET on ìƒ�íƒœ (Main, Guide íŽ˜ì�´ì§€ ì œì™¸)
			var gt = $('#content').hasClass('guide');
			var mt = $('#wrap').hasClass('main');

			if(gt || mt){
				$('.header_w').stop().animate({
					height:67
				},0);
				con_pdt(67);
			}else{
				$('.sub .dep01').find('>li.on>ul').show();
			}
			
		}

		$('.header').find('li').on({
			'mouseenter':function(){$(this).find('>ul').show().end().siblings().find('ul').hide();},
			'focusin':function(){$(this).find('>ul').show().end().siblings().find('ul').hide();}
		});
		$('.header_w').on({
			'mouseout':navi_fnc_01,
			'focusout':navi_fnc_01
		});
		$('.dep01').find('>li>a').on({
			'mouseover':navi_fnc_02,
			'focusin':navi_fnc_02
		});
		$('.dep02').find('>.nothv>a').each(function(){
			$(this).on({
				'mouseover':navi_fnc_02,
				'focusin':navi_fnc_02
			});
		});
		$('.dep02').find('>.hv>a').each(function(){
			$(this).on({
				'mouseover':navi_fnc_03,
				'focusin':navi_fnc_03
			});
		});
		$('.dep03').find('>li>a').each(function(){
			$(this).on({
				'mouseover':navi_fnc_03,
				'focusin':navi_fnc_03
			});
		});

	}

	// SIDEBAR NAVI SCRIPT
	$('.s_dep02').find('>li>a').each(function(){
		$(this).on({
			'click':function(e){
				if($(this).attr('href') == '#'){
					e.preventDefault();
				}
				var pr = $(this).parent();
				pr.siblings().find('ul').slideUp();
				pr.siblings().removeClass('sel');
				$(this).next().slideDown();
				if(!pr.hasClass('exter')){
					pr.addClass('sel');	
				}
			},
			'focusin':function(e){
				if($(this).attr('href') == '#'){
					e.preventDefault();
				}
				var pr = $(this).parent();
				pr.siblings().find('ul').slideUp();
				pr.siblings().removeClass('sel');
				$(this).next().slideDown();
				if(!pr.hasClass('exter')){
					pr.addClass('sel');	
				}
			}
		});
	});

	$('.s_dep02').find('>li:last-child').on('focusout',function(){
		// alert(1);
		$(this).removeClass('sel');
	});


	// FOLDER ACTION - ê³ ê°�ì„¼í„° ì°¾ì•„ì˜¤ì‹œëŠ”ê¸¸
	$('.folder').find('.btn_fold').on('click',function(e){

		if($(this).find('a').attr('href') == '#'){
			// e.preventDefault();
		}
		var _btn = $(this).find('a');

		$('.folder').find('.btn_fold>a').removeClass('open');
		$(this).parent().siblings().find('.fold_con').hide();

		// $(this).prev().toggle(300,function(){
		$(this).siblings('.fold_con').toggle(300,function(){

			if($('.folder').hasClass('sol_body')){ 
				// Solution ì—�ì„œ ì“°ëŠ”ê²½ìš°


				if($('.folder').hasClass('en')){
					// ì˜�ë¬¸ì�¼ ê²½ìš°
					if($(this).css('display') == 'block'){

						$(this).parent().siblings().find('.fold_con').hide();
						$(this).parent().siblings().find('dl').css('margin-bottom','0');
						$(this).parent().find('dl').css('margin-bottom','30px');
						$(this).parent().siblings().find('.btn_fold>a').text('Details');

						_btn.text('Close');
						_btn.addClass('open');
						$(this).parent().addClass('expanded')
						$('.summary').css('height','85px');
						$(this).parent().find('.summary').css({
							'height':'auto'
						});
						/*
						$('.sol_body').find('.summary').css({
							'height':'auto'
						});
						*/

					}else{
						_btn.text('Details');
						$(this).parent().find('dl').css('margin-bottom','0');
						$('.sol_body').find('.summary').css({
							'height':'85px'
						});
					}
				}else if($('.folder').hasClass('cn')){
					// ì¤‘ë¬¸ì�¼ ê²½ìš°
					if($(this).css('display') == 'block'){

						$(this).parent().siblings().find('.fold_con').hide();
						$(this).parent().siblings().find('dl').css('margin-bottom','0');
						$(this).parent().find('dl').css('margin-bottom','30px');
						$(this).parent().siblings().find('.btn_fold>a').text('æŸ¥çœ‹è¯¦æƒ…');

						_btn.text('å…³é—­');
						_btn.addClass('open');
						$(this).parent().addClass('expanded')
						$('.summary').css('height','85px');
						$(this).parent().find('.summary').css({
							'height':'auto'
						});
						/*
						$('.sol_body').find('.summary').css({
							'height':'auto'
						});
						*/

					}else{
						_btn.text('æŸ¥çœ‹è¯¦æƒ…');
						$(this).parent().find('dl').css('margin-bottom','0');
						$('.sol_body').find('.summary').css({
							'height':'85px'
						});
					}
				}else{
					if($(this).css('display') == 'block'){

						$(this).parent().siblings().find('.fold_con').hide();
						$(this).parent().siblings().find('dl').css('margin-bottom','0');
						$(this).parent().find('dl').css('margin-bottom','30px');
						$(this).parent().siblings().find('.btn_fold>a').text('ìž�ì„¸ížˆ ë³´ê¸°');

						_btn.text('ì ‘ê¸°');
						_btn.attr('title',_btn.attr('title').replace('ìž�ì„¸ížˆ ë³´ê¸°','ì ‘ê¸°'));

						_btn.addClass('open');
						$('.summary').css('height','85px');
						$(this).parent().find('.summary').css({
							'height':'auto'
						});
						/*
						$('.sol_body').find('.summary').css({
							'height':'auto'
						});
						*/

					}else{
						_btn.text('ìž�ì„¸ížˆ ë³´ê¸°');
						_btn.attr('title',_btn.attr('title').replace('ì ‘ê¸°','ìž�ì„¸ížˆ ë³´ê¸°'));

						$(this).parent().find('dl').css('margin-bottom','0');
						$('.sol_body').find('.summary').css({
							'height':'85px'
						});
					}
				}
			}else{
				// Location ì—�ì„œ ì“°ëŠ”ê²½ìš°
				if($(this).css('display') == 'block'){

					$(this).parent().siblings().find('.fold_con').hide();
					$(this).parent().siblings().find('.btn_fold>a').text('ì§€ë�„ë³´ê¸°');

					$(this).parent().find('.fold_con').focus();
					_btn.text('ì ‘ê¸°');
					_btn.addClass('open');
				}else{
					_btn.text('ì§€ë�„ë³´ê¸°');
				}
			}
		});
	});

	//SOLUTION AJAX CONTROL
	$(".sol_body").find('.btn_fold>a').each(function(idx){
		$(this).bind("click", function(e){
			e.preventDefault();
			var url = $(this).attr("href");
			
			if($(this).hasClass('open')){
			}else{
				var ajax = $.ajax({
					url: url,
					cache: false
				}).done(function(html){
					$(".fold_con").html(html);
					//slider.reloadSlider();
				}).fail(function(){
					console.error("Error");
				}).always(function(){
					// slider.reloadSlider();
					$('.sol_body').find('.img_second>li:first-child').addClass('ml0');
					$('.sol_body').find('.img_third>li:first-child').addClass('ml0');
					$('.sol_body').find('.sol_iul>li:first-child').addClass('ml0');
					$('.sol_body').find('.cols>col:first-child').addClass('ml0');
					swapImg();
				});
			}
		});
	});


//---------------------------------------------------------------------------------------- MOBILE //

	var lang_show = false;
	if(get_win_width() < 768){
		//$('.header').find('.lang').on('click',lang);
		//$('.header').find('.sch').on('click',submit);
		$(".lang").bind({
			click:function(){
				if(lang_show == true){
					$(this).parent().removeClass('tgl_on').addClass('tgl_off');	// close
					$('.header').find('.sch input').css("padding-left","30px");
					lang_show = false;
				}else{
					$(this).parent().removeClass('tgl_off').addClass('tgl_on');	// open
					$('.header').find('.sch input').css("padding-left","0");
					lang_show = true;
				}
			}
		});
		$('.sch a').bind({
			click:function(e){
				if($(this).parent().parent().parent().parent().parent().hasClass('tgl_on')){
					if($(".sch #q").val() == 'undefined' || $(".sch #q").val() == ""){
						e.preventDefault();
					}
				}

				$(this).parent().parent().parent().parent().parent().removeClass('tgl_on').addClass('tgl_off');	// close
				lang_show = false;
			}
		});
	}

	// ëª¨ë°”ì�¼ ìƒ�ë‹¨ ë©”ë‰´ ìƒ�ì„± í•¨ìˆ˜
	var m_top_html = {
		init : function(){
			var tab;
			this.tab = $('.con_body').find('.tab')

			var warpClass= $('#wrap').hasClass('main');
			if(warpClass){
				$('.ttl_now').find('a').replaceWith('<span>Smart Future POSCO ICT</span>')

			}else{
				this.tab.length >0 ? this.fromTab() : ($('.s_dep03').has('.on').length) ?  this.fromSideDep03() : this.fromSideDep02()
			}
		},
		fromTab : function(){
			var tab_list = this.tab.html();
			var tab_ttl = this.tab.find('.on>a').text();
			$('.to_now').html(tab_list);
			$('.ttl_now').find('a').text(tab_ttl);
		},
		fromSideDep03 : function(){
			var side_list = $('.s_dep03').has('.on');
			var side_ttl = side_list.find('.on>a');
			$('.to_now').html(side_list.html());
			$('.ttl_now').find('a').text(side_ttl.text());
		},
		fromSideDep02 : function(){
			var side_list = $('.s_dep02').has('.on');
			var side_ttl = side_list.find('.on>a');
			// $('.s_dep03').css("display","none"); Sang comment
			$('.s_dep03').css("display","block");
			$('.to_now').html($('.s_dep02').html());
			$('.ttl_now').find('a').text(side_ttl.text());
		}
	}
	// ëª¨ë°”ì�¼ ìƒ�ë‹¨ ë©”ë‰´ ì‹¤í–‰ í•¨ìˆ˜
	m_top_html.init();

	// LNB desktopì�¼ë•ŒëŠ” ìž‘ë�™í•˜ì§€ ì•Šì�Œ. Tablet, Mobileì—�ì„œë§Œ ë§�í�¬ ì�´ë�™
	$(".indep3").each(function(){
		$(this).bind({
			'click':function(e){
				if(verify_device.detect() == 'desktop'){
					e.preventDefault();
				}
			}
		});
	});

	// ëª¨ë°”ì�¼ ìƒ�ë‹¨ ë©”ë‰´ ì•¡ì…˜
	$('.ttl_now').on('click',function(){
		var now_list = $('.to_now');
		var _speed = 100;
		var _hwh = $('.header_w').height();
		var _hhh = now_list.height();

		var warpClass= $('#wrap').hasClass('main');
		if(warpClass){

		}else{
			if(now_list.data('stat') == 'open'){
				$('.to_now').slideDown(_speed);
				
				$('.header_w').animate({
					'height':_hwh+_hhh
				},_speed)
				now_list.data('stat','close');

			}else{
				$('.to_now').slideUp(_speed);
				$('.header_w').animate({
					'height':83
				},_speed);
				now_list.data('stat','open');
			}
		}
		
	});

	//ì œëª© ì„¤ëª… ìž�ë¦¬ ì˜¯ê¸°ê¸°
	if(get_win_width() < 768){
		var h4txt = $('.move_ttl').text();
		if (!!h4txt){
			$('.con_head').find('h3').text(h4txt);
		}else{
		};
	};

	//PRì„¼í„° PRìž�ë£Œì‹¤ ì¹´íƒˆë¡œê·¸
	$(".cata ul li a").each(function(idx){
		$(this).hover(
			function(){
				var w = $(this).find("img").width();
				var h = $(this).find("img").height();
				$(this).append("<span class='ovcata'></span>");
				$(".ovcata").css({
					"width":w+"px",
					"height":h+"px",
					"opacity":"0.5",
					"alpha":"50%"
				});
			}, function(){
				$(this).removeClass("slvzr-hover").find(".ovcata").remove();
			}
		).focusin(function(){
			var w = $(this).find("img").width();
			var h = $(this).find("img").height();
			$(this).append("<span class='ovcata'></span>");
			$(".ovcata").css({
				"width":w+"px",
				"height":h+"px",
				"opacity":"0.5",
				"alpha":"50%"
			});
		}).focusout(function(){
			$(this).removeClass("slvzr-hover").find(".ovcata").remove();
		});
	});
});

/*$(window).load(function(){
	// ì�´ë¯¸ì§€ MAX-WIDTH ì œì–´
	$('.con_body').find('img').each(function(){
		img_mx_width = $(this).width();
		$(this).css({'max-width':img_mx_width+'px'});

	});
});*/

var img_main_slide;

// ëª¨ë°”ì�¼ ì�´ë¯¸ì§€ êµ�ì²´
function swapImg(){
	
	var W = $(window).width();

	if( $(".swapImg img").attr("src") != "undefined" && $(".swapImg img").attr("src") != null && $(".swapImg img").attr("src") != "" ){
		$(".swapImg img").each(function(idx){
			if((verify_device.detect() != 'desktop')){
				if( W < 768){
					$(".swapImg img").eq(idx).stop(true).delay(500).attr("src", $(".swapImg img").eq(idx).attr("src").replace("_w.png","_m.png"));
				}else{
					$(".swapImg img").eq(idx).stop(true).delay(500).attr("src", $(".swapImg img").eq(idx).attr("src").replace("_m.png","_w.png"));
				}
			}
		});
	}

	img_main_slide = $("#main-slider li").not('.bx-clone').find('img');

	if( img_main_slide != "undefined" && img_main_slide != null && img_main_slide != "" ){

		img_main_slide.each(function(idx){

			var num = idx+1;

			if(W < 768 && W >= 480){
				//$(this).attr("src",'/images/main/slideImg/main_slide0'+(idx+1)+'_480.jpg');
				$(this).attr("src", $(this).attr("src").replace("_320.jpg","_480.jpg").replace("_pc.jpg","_480.jpg"));
			}else if(W < 480){
				//$(this).attr("src",'/images/main/slideImg/main_slide0'+(idx+1)+'_320.jpg');
				$(this).attr("src", $(this).attr("src").replace("_480.jpg","_320.jpg").replace("_pc.jpg","_320.jpg"));
			}else{
				//$(this).attr("src",'/images/main/slideImg/main_slide0'+(idx+1)+'_pc.jpg');
				$(this).attr("src", $(this).attr("src").replace("_480.jpg","_pc.jpg").replace("_320.jpg","_pc.jpg"));
			}
		});
	}
	
}