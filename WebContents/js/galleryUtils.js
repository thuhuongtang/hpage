/**
 * @author gdj
 * ì�´ ëª¨ë“ˆì�€  http://code.jQuery.com/jquery-1.7.js ëª¨ë“ˆì�˜ animate()ë“±ì�˜ í•¨ìˆ˜ë¥¼ì‚¬ìš©í•˜ ì˜€ìŠµë‹ˆë‹¤.    
 * ì�´ ëª¨ë“ˆì�€  http://code.jquery.com/ui/1.9.2/jquery-ui.js ëª¨ë“ˆì�˜ "easeInOutCubic" ë“±ì�˜ í•¨ìˆ˜ë¥¼ì‚¬ìš©í•˜ ì˜€ìŠµë‹ˆë‹¤.
 
 //(example)
 <script type="text/javascript">
			$(document).ready(function(){
				//================  1. ì�´ë¯¸ì§€ ë�°ì�´í„° ===================
				var totalImage=11;					// ì�´ë¯¸ì§€ ê²Ÿìˆ˜
				var imgM_W = 480 , imgS_W = 144;	// ì�´ë¯¸ì§€ width
				var imageDataM 		= repeatArray(totalImage, "m" 		, ".jpg");		// í�°ì�´ë¯¸ì§€ ë°°ì—´
				var imageDataS 		= repeatArray(totalImage, "s_m" 	, ".jpg");		// ì„¬ë„¤ì�¼(thumbnail) ì�´ë¯¸ì§€ ë°°ì—´
				
				var imageData 		= new ObjData("imgM","imgS");				
				var objData = imageData.values(imageDataM,imageDataS);
				//	for (var f=0; f<totalImage; f++) {			console.log(objData[f]);		};		  //  objData í…ŒìŠ¤íŠ¸ ë�°ì�´í„°
																
				//================  2. ì�´ë¯¸ì§€ ë°°ì¹˜ ===================
				 // ë©”ì�¸ì�´ë¯¸ì§€ ë°°ì¹˜
				 createImageTag("mainViewContainer" 	,"slider_m", "ë©”ì�¸ì�´ë¯¸ì§€"		,"image/" , imageDataM ,imgM_W );
				 // ì„¬ë„¤ì�¼ ì�´ë¯¸ì§€ ë°°ì¹˜
				 createImageTag("thumbNailViewContainer","slider_s", "ì„¬ë„¤ì�¼ì�´ë¯¸ì§€"		,"image/" , imageDataS ,imgS_W );
				
				//================  3. ì„¬ë„¤ì�¼ ë²„íŠ¼ ì„¤ì • =================== #thumbNailView >				
				var galeryMain 		= new Gallery("mainViewContainer"		,"slider_m");
				var galeryThumbNail = new Gallery("thumbNailViewContainer"	,"slider_s");
				galeryThumbNail.setThumbNailBtn( function(index){
					//console.log("index : "+ index);
					//galeryMain.motionEnd(index,1);
					galeryMain.motionOverlap(index,1);					
				});		   
			   
				//================  4. í™”ì‚´ ë²„íŠ¼  =================== 
				$("#arrowL").click(function(){
					//galeryThumbNail.motionEnd( (galeryThumbNail.index -1) ,3  );
					galeryThumbNail.motionLoop( (galeryThumbNail.index -2)  );
				})	
				$("#arrowR").click(function(){					
					//galeryThumbNail.motionEnd( (galeryThumbNail.index +1) ,3  );
					galeryThumbNail.motionLoop( (galeryThumbNail.index +2) );					
				})
					
			}) // ready			
		</script>

 */

/*====================================== ì�´ë¯¸ì§€ ë�°ì�´í„° ë§Œë“œëŠ” í•¨ìˆ˜ =================================*/

/**
 * repeatArray					: ë°˜ë³µë�˜ëŠ” ê²ƒì�„ ë°°ì—´ë¡œ
 * @param {number} total		: ì´� ì�´ë¯¸ì§€ê²Ÿìˆ˜
 * @param {string} repeatName   : ë°˜ë³µë�˜ëŠ” ì�´ë¦„ 		(m0 ,m1 ,m2 => "m")
 * @param {string} repeatName2  : ë�›ë¶™ì�´ëŠ” ë°˜ë³µ ì�´ë¦„ 	(m0.jpg ,m1.jpg ,m2.jpg => ".jpg")
 */
 function repeatArray(total,repeatName,repeatName2){
	var array=[];
	for (var i=0 ; i<total ; ++i)
	{
		array.push(  repeatName+i+repeatName2);		
	}
	return array;		
}

/*====================================== json ë�°ì�´í„° ë§Œë“œëŠ” í•¨ìˆ˜ =================================*/

/**
 * í‚¤ê°’ (key1,key2,...)  
 * @param {array} args : í‚¤ ë°°ì—´ê°’
 */
function ObjData(){
	this.keys = Array.prototype.slice.call(arguments);   // ë°°ì—´ë¡œ ë³€í™˜	
}


/**
 * í‚¤ê°’ì—� ëŒ€ì�‘ë�˜ëŠ” ê°’ ( [key1value1, key1value2,.. ] , [ key2value1,key2value2,..] ,...  )  
 * @param {array} value : ê°’ ë°°ì—´ 
 */
ObjData.prototype.values=function(){	
	var datas 		= [];							// 
	var values 		= arguments;					// í‚¤ì�˜ ëŒ€ì�‘ë�˜ëŠ” ê°’ 
	var total_key 	= this.keys.length;				// í‚¤ê°’ ê²Ÿìˆ˜
	var total_val 	= arguments[0].length;			// ì²«ë²ˆì§¸ ìš”ì†Œì�˜ ê²Ÿìˆ˜ = ë�°ì�´í„° ê²Ÿìˆ˜
	
	for(var i=0  ; i<total_val ; ++i ){
	
		var dataObj		= {};				
		for(var j=0   ; j<total_key ; ++j ){			
			var keyName = this.keys[j];			
			dataObj[keyName]	= 	arguments[j][i];		
		}
		//console.log(dataObj)
		datas.push(dataObj);
	}
	//console.log(datas[0].imgM)
	return datas;
}


/*====================================== imgTag ë§Œë“¤ê¸° =================================*/
/**				
 * @param {string} panelID		: ì�´ë¯¸ì§€ë„£ì�„ íƒœê·¸ ID
 * @param {string} itemClass	: ì�´ë¯¸ì§€ í�´ëž˜ìŠ¤ì�´ë¦„
 * @param {String} introduction : alt ë©”ì„¸ì§€
 * @param {String} path			: ì�´ë¯¸ì§€ê²½ë¡œ
 * @param {Object} fileNameArr	: íŒŒì�¼ì�´ë¦„ ë°°ì—´
 */				
function createImageTag(panelID , itemClass , introduction , path , fileNameArr ,imageWidth) {
    var imgData = "";
	var total=fileNameArr.length;
    for (var k=0  ; k<total ;++k){		             
		imgData += '<li class="' +itemClass+ '" index_data="'+ k +'" ><img src="' + (path+fileNameArr[k]) + '" alt="' + introduction + '" /></li>'						
    }					
    $( ("#"+panelID) ).append(imgData);							// í…Œê·¸ì—� ì�´ë¯¸ì§€í…Œê·¸ ë„£ê¸°
	                
	// ìŠ¤íƒ€ì�¼ ì �ìš©
	$( ("."+itemClass) ).css("display", "inline" );				// div inline	
	//$( ("."+itemClass) ).css("float", "left" );				// float:left;
	$(  ("#"+panelID) ).css("width", total*imageWidth );		// ì�´ë¯¸ì§€ í�¬ê¸°ë§Œí�¼ ì»¨í…Œì�´ë„ˆë¥¼ ëŠ˜ë¦¼ ë³€í™”
	//var widthW = $( "."+itemClass ).css("border","#ff0000 solid 1px ") 	
}		

/*====================================== ê²”ëŸ¬ë¦¬ í�´ëž˜ìŠ¤ =================================*/
				/**
				 * Gallery : ê²”ëŸ¬ë¦¬ í�´ëž˜ìŠ¤
				 * @param {String} panelID	: itemë‹´ê³ ìžˆëŠ” panel ID
				 * @param {String} itemClass: itemë“¤ì�˜ Class
				 */
				function Gallery(panelID,itemClass){
					/*============ ì†�ì„±  ============*/
					this.panelID 	= $("#"+panelID);
					this.itemClass 	= $("."+itemClass);
					this.index = 0;								// ì�¸í…�ìŠ¤
					this.viewNum = 1;							// ë³´ì—¬ì§€ëŠ” ì�´ë¯¸ì§€ê²Ÿìˆ˜
					this.total = $(this.itemClass).length;      // ì•„ì�´í…œ ê²Ÿìˆ˜
					this.oldIndex = 0;
					
					/*============ ë©”ì„œë“œ ============*/
					/**
					 * 	íƒ€ìž… ê²€ì‚¬
					 * @param {Number} index 	: ì�¸ë�±ìŠ¤
					 * @param {Number} viewNum  : ë³´ì�´ëŠ” ì˜�ì—­ê²Ÿìˆ˜
					 */				
					this.typeValidation = function(index,viewNum){
						
						// íƒ€ìž… ê²€typeValidation
						if( index 	== undefined 	|| index=="" 	|| index 	== isNaN	){index  = 0};  // ì�¸ë�±ìŠ¤ ê²€ì‚¬ ê¸°ë³¸ê°’
						if( viewNum == undefined	|| viewNum==""	|| viewNum 	== isNaN	){viewNum=1};   // ë³´ì—¬ì§€ ê²Ÿìˆ˜ ê²€ì‚¬ ê¸°ë³¸ê°’
						if( viewNum > this.total)throw new Error("ì•„ì�´í…œ ê²Ÿìˆ˜("+ this.total +")ë³´ë‹¤  ë³´ì�´ëŠ” ì˜�ì—­ì�˜ ê²Ÿìˆ˜("+ viewNum +")ê°€ ë�” í�¬ë©´ ì•ˆë�©ë‹ˆë‹¤.");				
						this.index 		= index;
						this.viewNum 	= viewNum;							
					}
				}
								
				/**
				 * ê²”ëŸ¬ë¦¬ ì„¬ë„¤ì�¼ ë²„íŠ¼ì„¸íŒ… ë©”ì†Œë“œ
				 * @param {function} fn => functionName(index) : í�´ë¦­ë�˜ë©´ ì‹¤í–‰ë�  í•¨ìˆ˜ ìž�ë�™ìœ¼ë¡œ ì�¸ë�±ìŠ¤ê°€ ë„˜ì–´ê°�
				 */
				Gallery.prototype.setThumbNailBtn = function (fn){
					this.itemClass.click(function() {
	                    var index = $(this).index();
						fn(index);
	                });
					//this.itemClass = this.panelID.children();  					
				}
						
				/**
				 * type1/3 ê²”ëŸ¬ë¦¬ ëª¨ì…˜_ì •ì§€ ë©”ì†Œë“œ
				 * @param {Number} index 	: ì�¸ë�±ìŠ¤
				 * @param {Number} viewNum  : ë³´ì�´ëŠ” ì˜�ì—­ê²Ÿìˆ˜
				 */
				Gallery.prototype.motionEnd = function(index,viewNum){
					// ê°’ìœ ë¬´ ì²´í�¬ íƒ€ìž… ê²€typeValidation
					this.typeValidation(index,viewNum);
					
					// ëª¨ìž�ëž€ ê°’ ì²´í�¬
					if(  this.index < 0 ){ this.index = 0 ; return;};
					// ë„˜ì¹˜ëŠ” ê°’ ì²´í�¬
					if(  this.index > (this.total - this.viewNum) ){ this.index=this.total - this.viewNum; return; };
					
					var distance = this.itemClass.outerWidth(true);
					var move =  this.index * parseInt(distance);														// parseInt(distance) px ë‹¨ìœ„ë¥¼ ì œê±°
					//$( this.panelID ).filter(':not(:animated)').animate({left:-move},500 ,"easeInOutCubic" );			// ! ê²½ìš°ì—� ì•ˆë§žì�Œ.
					this.panelID.stop().animate({left:-move},500 ,"easeInOutCubic" );
					//console.log("index : " + index);
				}
				
				/**
				 * type2/3 ê²”ëŸ¬ë¦¬ ëª¨ì…˜_ë¦¬í„´ ë©”ì†Œë“œ
				 * @param {Number} index 	: ì�¸ë�±ìŠ¤
				 * @param {Number} viewNum  : ë³´ì�´ëŠ” ì˜�ì—­ê²Ÿìˆ˜
				 */
				Gallery.prototype.motionReturn = function(index , viewNum){
					// ê°’ìœ ë¬´ ì²´í�¬ íƒ€ìž… ê²€typeValidation
					this.typeValidation(index,viewNum);
					
					// ëª¨ìž�ëž€ ê°’ ì²´í�¬
					if(  this.index < 0 ){ this.index = this.total - this.viewNum };
					// ë„˜ì¹˜ëŠ” ê°’ ì²´í�¬
					if(  this.index > (this.total - this.viewNum) ){ this.index=0; };
					
					var distance = this.itemClass.width();			// 1ì¹¸ ì›€ì§�ì�´ëŠ” ê±°ë¦¬ 						
					var move =  this.index * distance;				// ì´�ì›€ì§�ìž„ ê±°ë¦¬
					this.panelID.stop().animate({left:-move},500 ,"easeInOutCubic" );					
					//console.log("index : "+ index);
					
				}
				
				/**
				 * type3/3 ê²”ëŸ¬ë¦¬ ëª¨ì…˜_ë£¨í”„ ë©”ì†Œë“œ
				 * @param {Number} index 	: ì�¸ë�±ìŠ¤
				 * @param {Number} viewNum  : ë³´ì�´ëŠ” ì˜�ì—­ê²Ÿìˆ˜
				 */
				Gallery.prototype.motionLoop = function(index ){
					this.oldIndex = this.index;						// ì�´ì „ ì�¸ë�±ìŠ¤
					var	setp = indexToStep(index,this.oldIndex)		// ìŠ¤í…�					
									
					this.index = stepToIndexLoop(this.oldIndex , setp , this.total );
					var distance = this.itemClass.width()*setp;			// ì›€ì§�ìž„ ê±°ë¦¬ êµ¬í•˜ê¸°					
					
					if((setp > 0 )){	// ì˜¤ë¥¸ë²„íŠ¼		//console.log("<<<"+ this.itemClass.first().html());
						this.panelID.filter(':not(:animated)').animate( {left:distance*-1},500 , "easeInOutCubic", function(){
							// ì•„ì�´í…œ ë¶™ì�´ê¸°
							for (var j = 0; j < setp ; ++j) {
								var temp 		= $(this).children().first();	// ë³€ìˆ˜ë‹´ê¸°
								$(this).append(temp);							//ë’¤ì—� ë„£ê¸°
								$(this).css("left" , 0);						// ìœ„ì¹˜
							}
						} );				
							
					}else{				// ì™¼ìª½ë²„íŠ¼		//console.log("<<<"+ this.itemClass.last().html());
						if ( !this.panelID.is(':animated') ){  												// ëª¨ì…˜ ì¤‘ì�¸ì§€ë¥¼ ì²´í�¬		
							this.panelID.filter(':not(:animated)').css("left" , distance );					// ìœ„ì¹˜					 	
					 		this.panelID.filter(':not(:animated)').animate({left:0},500 ,"easeInOutCubic" );// ì›€ì§�ìž„
							// ì•„ì�´í…œë¶™ì�´ê¸°
							for (var i = 0; i < Math.abs(setp) ; ++i) {
								var temp = this.itemClass.last(); 	// ë³€ìˆ˜ë‹´ê¸°
								this.panelID.prepend(temp); 		// ì•žì—�ë„£ê¸°
								this.itemClass = this.panelID.children();
							}							
					 	}						
					}
					this.itemClass = this.panelID.children();	// this.itemClass ê°±ì‹ í•´ì¤˜ì•¼ í•¨... (this.itemClass new ìƒ�ì„œë�˜ì„œ ì°¸ì¡°ê°€ì•„ë‹Œ ë³µì‚¬ë�˜ëŠ”ë“¯ ëª¨ë¥´ê² ë‹¤.ã… )
				}
				
				Gallery.prototype.motionLoopY = function(index,$height ){
					this.oldIndex = this.index;						// ì�´ì „ ì�¸ë�±ìŠ¤
					var	setp = indexToStep(index,this.oldIndex)		// ìŠ¤í…�								
					this.index = stepToIndexLoop(this.oldIndex , setp , this.total );
					var distance = ($height)?$height*setp : this.itemClass.height()*setp;			// ì›€ì§�ìž„ ê±°ë¦¬ êµ¬í•˜ê¸°					
					
					if((setp > 0 )){	// ì˜¤ë¥¸ë²„íŠ¼		//console.log("<<<"+ this.itemClass.first().html());
						this.panelID.filter(':not(:animated)').animate( {top:distance*-1},500 , "easeInOutCubic", function(){
							// ì•„ì�´í…œ ë¶™ì�´ê¸°
							for (var j = 0; j < setp ; ++j) {
								var temp 		= $(this).children().first();	// ë³€ìˆ˜ë‹´ê¸°
								$(this).append(temp);							//ë’¤ì—� ë„£ê¸°
								$(this).css("top" , 0);						// ìœ„ì¹˜
							}
						} );				
							
					}else{				// ì™¼ìª½ë²„íŠ¼		//console.log("<<<"+ this.itemClass.last().html());
						if ( !this.panelID.is(':animated') ){  												// ëª¨ì…˜ ì¤‘ì�¸ì§€ë¥¼ ì²´í�¬		
							this.panelID.filter(':not(:animated)').css("top" , distance );					// ìœ„ì¹˜					 	
					 		this.panelID.filter(':not(:animated)').animate({top:0},500 ,"easeInOutCubic" );// ì›€ì§�ìž„
							// ì•„ì�´í…œë¶™ì�´ê¸°
							for (var i = 0; i < Math.abs(setp) ; ++i) {
								var temp = this.itemClass.last(); 	// ë³€ìˆ˜ë‹´ê¸°
								this.panelID.prepend(temp); 		// ì•žì—�ë„£ê¸°
								this.itemClass = this.panelID.children();
							}							
					 	}						
					}
					this.itemClass = this.panelID.children();	// this.itemClass ê°±ì‹ í•´ì¤˜ì•¼ í•¨... (this.itemClass new ìƒ�ì„œë�˜ì„œ ì°¸ì¡°ê°€ì•„ë‹Œ ë³µì‚¬ë�˜ëŠ”ë“¯ ëª¨ë¥´ê² ë‹¤.ã… )
				}	

				/**
				 * type4/3 ê²”ëŸ¬ë¦¬ ëª¨ì…˜_ì˜¤ë²„ëž© ë©”ì†Œë“œ
				 * @param {Number} index  : ì�¸ë�±ìŠ¤
				 */				
				Gallery.prototype.motionOverlap = function(index){
					// ì „ì²´ì†�ì„±
				  var distance = this.itemClass.width();
				  this.itemClass.css({ "position":"absolute" , "display":"block" , "left": distance+"px" ,"display":"inline " });			// ì•„ì�´í…œ cssì†�ì„±
				  	// ê³¼ê±°ì†�ì„±
				  this.itemClass.eq(this.index).css({ "position":"absolute" , "display":"block" , "left":"0px" ,"display":"inline" ,"z-index":"0" });			// ì•„ì�´í…œ cssì†�ì„±
				 	
					// í™œì„±í™” ì†�ì„±
				   this.itemClass.eq(index).css({ "z-index":"100"});
				   this.itemClass.eq(index).filter(':not(:animated)').animate( { left:0 },500 , "easeInOutCubic"); 
				   this.index = index;				  								
				}
				
			
										 
/// ==================================================================================================================================

	/** 1
		 * 		indexToIndex		: ìƒˆë¡œìš´ ì�¸ë�±ìŠ¤ë¥¼ ì´�ë²”ìœ„ì•ˆìœ¼ë¡œ ë§Œë“¬
		 * @param	$newIndex		: ìƒˆë¡œìš´ ì�¸ë�±ìŠ¤
		 * @param	$total			: ì „ì²´ ê²Ÿìˆ˜		 
		 * @return					: ë²”ìœ„ì•ˆì�˜ ì�¸ë�±ìŠ¤
		 */
		function indexToIndexLoop($newIndex , $total){
			var num;			
			num = $newIndex;
			if (num >= $total){			// í�´ë•Œ
				num = (num % $total);
			}else if (num < 0) {		// ìž‘ì�„ë•Œ
				num = $total- (-num % $total) 
			}else {					
				num = num;			
			}
			return num ;
		}
		
	/**  3
		 *		stepToIndexLoop				: í˜„ìž¬ì—�ì„œ +ì•žìœ¼ë¡œ & -ë’¤ë¡œ ëª‡ë²ˆì§¸ loop 
		 * 	@param $current					: í˜„ìž¬ ì�¸ë�±ìŠ¤ê°’
		 * 	@param $step					: í˜„ìž¬ ì�¸ë�±ìŠ¤ì—�ì„œ ëª‡ë²ˆì§¸ ì „í›„(-,+)
		 * 	@param $total					: ì›�ë³¸ ë°°ì—´ê¸¸ì�´;
		 * 	return							: ì°¾ëŠ” ë°°ì—´ ì�¸ë�±ìŠ¤ê°’
		 * */		
		function stepToIndexLoop($current, $step , $total){
			var $num;
			var $sum = $current + $step;
			$num =  indexToIndexLoop($sum , $total);			
			return $num ;
		}
		
	/**  4
		 * 		indexToStep		: ì�¸ë�±ìŠ¤ë¥¼ ìŠ¤í…�ë³€í™˜
		 * @param	$newIndex  	: ìƒˆë¡œìš´  ì�¸ë�±ìŠ¤
		 * @param	$oldIndex	: ê³¼ê±° ì�¸ë�±ìŠ¤
		 * return				: ìŠ¤í…�
		 **/
		function indexToStep($newIndex, $oldIndex){			
			return parseInt($newIndex - $oldIndex);
		}		