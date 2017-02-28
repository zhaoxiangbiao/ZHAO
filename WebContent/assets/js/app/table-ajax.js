var TableAjax = function () {
	
	/**
	 * 生成操作按钮
	 * options table的总配置
	 * col aoColumns中的操作按钮组
	 */
	var handleUxOptions = function(options,col){
		
		col.sTitle='操作';
		col.sWidth=options.sWidth?options.sWidth:'160px';
		col.bSortable = false;
		col.mData = 'id';
		
		col.mRender=function(data, type, full){
			var result = [];
			
			// 自定义按钮组
			var cogs = col.uxCogs;
//			result.push('<div class=" btn-group ">'+
//					'<a class="btn btn-xs blue" href="#" data-toggle="dropdown" data-close-others="true">'+
//					'<i class="fa fa-cog"></i> <i class="fa fa-angle-down"></i></a>'+
//					'<ul class="dropdown-menu pull-right">');
			
			var cc=0;
			var csize=cogs.length;
			$.each(cogs,function(i,cog){
				result.push(generateMenu(cog,data, type, full,options,cc,csize));
				cc++;
			})
			result.push('</ul></div>');
			
			// 拖拽排序
			if(options.uxDrapable){
				var sortField = 'sort';
				if(options.uxSortField){
					sortField = options.uxSortField;
				}
				 var dragStr = ' <div class="btn-group">'+
                 '<a class="btn btn-xs blue" href="#" data-toggle="dropdown" data-close-others="true"><i sort="'+full[sortField]+'" id="'+data+'"  class="fa fa-sort"></i>'+
				 ' <i class="fa fa-angle-down"></i></a>'+
				 '<ul class="dropdown-menu pull-right" >'+
				 '	<li><a data-handler="CONFIRM" href="'+options.uxUrlPrev+'sort?id='+data+'&p=1&sort='+full[sortField]+'"><i class="fa fa-angle-double-up primary"></i> 置顶</a></li>'+
				 '	<li><a data-handler="CONFIRM" href="'+options.uxUrlPrev+'sort?id='+data+'&p=2&sort='+full[sortField]+'"><i class="fa fa-angle-double-down primary"></i> 置底</a></li>'+
				 '	<li><a data-handler="CONFIRM" href="'+options.uxUrlPrev+'sort?id='+data+'&p=3&sort='+full[sortField]+'"><i class="fa fa-angle-up primary"></i> 前移</a></li>'+
				 '	<li><a data-handler="CONFIRM" href="'+options.uxUrlPrev+'sort?id='+data+'&p=4&sort='+full[sortField]+'"><i class="fa fa-angle-down primary"></i> 后移</a></li>'+
				 '</ul>'+
				 '</div>';
				 result.push(dragStr);
			}
			return result.join('');
		}
	}
	var generateMenu = function(cog,data, type, full,options,index,csize){
		var cc = {
			name:'default',
			uri:'view',
//			aclsss:'btn btn-xs',
//			dataHandler:'MODAL',
			modalSize:'',
			simple:false,
			iclass:'fa fa-info primary',
			dataForm:false
		}
		cc = $.extend(cc,cog);
		if(cc.name=='查看'){
			cc.uri='view';
//			cc.aclsss=' btn btn-xs ';
			cc.dataHandler='MODAL';
			cc.iclass= 'fa fa-info info';
			cc.dataForm = false;
		}
		else if(cc.name=='修改'){
			cc.uri='edit';
//			cc.aclsss='btn btn-xs ';
			cc.dataHandler='INLINE';
			cc.iclass= 'fa fa-pencil warning';
			cc.dataForm = true;
		}
		else if(cc.name=='删除'){
			cc.uri='delete';
//			cc.aclsss='btn btn-xs ';
			cc.dataHandler='CONFIRM';
			cc.iclass= 'fa fa-trash-o danger';
			cc.dataForm = false;
		}
		
		
		// 按钮是否可点击
		var active=true;
		if(cc.isShow){
			if(!cc.isShow(data, type, full)){
				active = false;
				return '';
			}
		}
		
		var title = cc.dataTitle;
		if(!title){
			title = options.uxDataTitle+'-'+cc.name;
		}
		var btnStr="";
		if(index==0){
			cc.aclsss='btn btn-xs ';
			btnStr= '<div class=" btn-group dropdown">'+
			'<a '+(cc.target=='_blank'?'target="_blank"':'')+' href="'+(cc.uri.indexOf("/")==0?_GLOBAL.ctx:options.uxUrlPrev)+cc.uri+(cc.name=='删除'?'?ids=':'?id=')+data+'" class="'+cc.aclsss+'" modal-simple='+cc.simple+'   data-handler="'+cc.dataHandler+'" modal-size="'+cc.modalSize+'" data-title="'+title+'"><i class="'+cc.iclass+'" ></i> '+cc.name+'</a>';
			if(csize>1){
				
				btnStr += ('<a class="btn  btn-xs dropdown-toggle " href="javascript:void(0);" data-toggle="dropdown" data-close-others="true">'+
				'<i class="fa fa-angle-down"></i></a>'+
				'<ul class="dropdown-menu dropdown-blue pull-right">');
			}
		}else{
			btnStr= '<li><a '+(cc.target=='_blank'?'target="_blank"':'')+' href="'+(cc.uri.indexOf("/")==0?_GLOBAL.ctx:options.uxUrlPrev)+cc.uri+(cc.name=='删除'?'?ids=':'?id=')+data+'" class="'+cc.aclsss+'" modal-simple='+cc.simple+'   data-handler="'+cc.dataHandler+'" modal-size="'+cc.modalSize+'" data-title="'+title+'"><i class="'+cc.iclass+'" ></i> '+cc.name+'</a></li>';
		}
		return btnStr;
		
	}
	
	
    return {
    	
        //main function to initiate the module
        init: function (tableId,opt) {
            
            if (!jQuery().dataTable) {
                return;
            }
            
            function getPageNo(aoData){
            	var start = aoData[3].value;
            	var length = aoData[4].value;
            	
            	return Math.ceil( start/length)+1;
            }
            function getSort(aoData){
//            	console.log(aoData);
            	var sort = {};
            	var cols = aoData[1].value;
            	var isort = aoData[5+cols*2].value;
            	sort.fieldName = aoData[5+isort*2].value;
            	sort.compositorType = aoData[6+cols*2].value;
            	return sort;
            }
            function getPageLength(aoData){
            	return aoData[4].value ;
            }
            function getSumData(aoColumns){
            	var sumData = null;
            	for (var i = 0; i < aoColumns.length; i++) {
					var ac = aoColumns[i];
					if(ac['uxSum']){
						if(!sumData){
							sumData = [];
						}
						sumData.push({field:ac.mData,index:i,sum:true});
					}
				}
            	return sumData;
            }
            function setFilter(data){
            	var dataDiv =$($('#'+tableId).parents('div.data-div')[0]);
            	dataDiv.find("form input").each(function(i,t){
            		
            		data[$(t).attr('name')]= $(t).val();
            	})
            	dataDiv.find("form select").each(function(i,t){
            		
            		data[$(t).attr('name')]= $(t).val();
            	})
            	return data;
            }
            
            var saveOrder = function(){
            	
            	var $this = $(this);
            	var this_sort = $this.find('i.fa-sort').attr('sort');
            	var this_id = $this.find('i.fa-sort').attr('id');
            	var before_sort= $this.prev('tr').find('i.fa-sort').attr('sort');
            	var after_sort = $this.next('tr').find('i.fa-sort').attr('sort');
            	if(!before_sort){
            		before_sort = -1;
            	}
            	if(!after_sort){
            		after_sort = -1;
            	}
            	
            	$.ajax({
					type: "POST",
					cache: false,
					url: options.uxUrlPrev+'sort',
					dataType: "json",
					data:{
						id:this_id,
						sort:this_sort,
						beforeSort:before_sort,
						afterSort:after_sort
					},
					success: function (res) {
						oTable.fnDraw(false);
//						toastr[res.type?res.type:'info'](res.message, '系统消息'); 
						Notify(res.message, 'top-right', '2000', res.type?res.type:'info', 'fa-check', true);
					},
					error: function (xhr, ajaxOptions, thrownError) {
						bootbox.alert("操作失败，请尝试刷新页面以解决该问题。");
						oTable.fnDraw(false);
					},
					async: false
				});
            }
            function fnFormatDetails(oTable, nTr) {
                var aData = oTable.fnGetData(nTr);
                var sOut = '<table>';
                sOut += '<tr><td rowspan="5" style="padding:0 10px 0 0;"><img src="assets/img/avatars/' + aData[6] + '"/></td><td>Name:</td><td>' + aData[1] + '</td></tr>';
                sOut += '<tr><td>Family:</td><td>' + aData[2] + '</td></tr>';
                sOut += '<tr><td>Age:</td><td>' + aData[3] + '</td></tr>';
                sOut += '<tr><td>Positon:</td><td>' + aData[4] + '</td></tr>';
                sOut += '<tr><td>Others:</td><td><a href="">Personal WebSite</a></td></tr>';
                sOut += '</table>';
                return sOut;
            }

            
            var options = {
//                  "sDom" : '<"table-top"<"clear">><"table-scrollable" rt><"table-bottom"<"table-info"ip>>', 
                  "sDom": "Bt<'row DTTTFooter'<'col-sm-6'li><'col-sm-6'p>>",
//                    "sDom": "Bfrtip",
                    buttons: [],
                    bLengthChange:true,
                    bAutoWidth: false,  
                    bFilter: false,
           		 	uxCheckable:false,
           		 	uxCloseScroll:false	,
                    bProcessing: true,
                    bServerSide: true,
                    bStateSave: false,
                    sAjaxDataProp: "pageData.result",
                    // set the initial value
                    iDisplayLength: 10,
                    "aLengthMenu": [
                                    [10, 15, 20, 100],
                                    [10, 15, 20, 100] // change per page values here
                                ],
                    sPaginationType: "bootstrap",
//                    "sPaginationType": "full_numbers",
                    oLanguage: {
//                    	"sProcessing": '<img src="'+_GLOBAL.ctx+'/assets/img/loading.gif" >',
                    	"sLengthMenu": "每页&nbsp_MENU_&nbsp条 ",
                    	"sZeroRecords": "没有您要搜索的内容",
                    	"sInfo": "   共 _TOTAL_ 条",
                    	"sInfoEmpty": "记录数为0",
                    	"sInfoFiltered": "(全部记录数 _MAX_  条)",
                    	"sInfoPostFix": "",
                    	"sSearch": "搜索",
                    	"sUrl": "",
                    	"oPaginate": {
                    	"sFirst":    "第一页",
                    	"sPrevious": "上一页 ",
                    	"sNext":     "下一页",
                    	"sLast":     "最后一页 "
                    	}
                   },
                   
                    "fnDrawCallback": function(oSettings, json) {
                        App.initAjax();
                       
                        // 双击事件
                        oTable.$('tr').on('dblclick',function(e){
//                        	$($(this)[0]).find('a.dblclick').click();
                        }); 
                        
                        //详情
                        jQuery('#'+tableId).on('click', ' tbody td .row-details', function () {
                            var nTr = $(this).parents('tr')[0];
                            if (oTable.fnIsOpen(nTr)) {
                                /* This row is already open - close it */
                                $(this).addClass("fa-plus-square-o").removeClass("fa-minus-square-o");
                                oTable.fnClose(nTr);
                            }
                            else {
                                /* Open this row */
                                $(this).addClass("fa-minus-square-o").removeClass("fa-plus-square-o");;
                                oTable.fnOpen(nTr, fnFormatDetails(oTable, nTr), 'details');
                            }
                        });
                        
                        // 初始化操作按钮的tooltips
                        //console.log(jQuery('#'+tableId+' tbody tr'));
                        jQuery('#'+tableId+' tbody i.fa-cog').tooltip({
                        	title:'操作'
                        });
                        jQuery('#'+tableId+' tbody i.fa-sort').tooltip({
                        	title:'排序'
                        });
                        
                        // 拖拽事件
                        if(opt.uxDrapable){
                        	jQuery('#'+tableId+' tbody').dragsort("destroy");
                            jQuery('#'+tableId+' tbody').dragsort({ dragBetween: true, dragEnd: saveOrder});
                        }
                        
                        // scrollable
                        if(opt.uxCloseScroll){
                        	jQuery('#'+tableId).parent().css({
                            	'overflow-x':'visible',
                            	'overflow-y':'visible'
                            		});
                        }
                        // 取消check
                        if(options.uxCheckable){
                        	var checkAll = jQuery('#'+tableId+' .group-checkable');
                        	checkAll.attr("checked", false);
//                        	jQuery.uniform.update(checkAll);
                        	jQuery('#'+tableId+' tbody tr .checkboxes').change(function(){
                        		$(this).parents('tr').toggleClass("active");
                        	});
                        }
                        
                        //初始化上一点击的INLINE类型的BUTTON
                    	if(_GLOBAL.initInline){
                    		_GLOBAL.initInline = false;
                    		App.clickLastInlineBtn();
                    	}
//                        console.log(oSettings);
                    	// 首行为总计
                        if(options.uxSumConfig && oSettings._iRecordsTotal){
                        	var tbody = oTable.children('tbody');
                        	tbody.addClass('showTotal');
                        	var firstRow = $(tbody.children('tr').first());
                        	var cols = firstRow.children('td');
                        	var ust = options.uxSumConfig;
                        	if(ust.hiddenCols){
                        		for(var i=0;i<ust.hiddenCols.length;i++){
                        			$(cols[ust.hiddenCols[i]]).html('')
                        		}
                        	}
                        	
                        	$(cols[ust.title.cols[0]]).text(ust.title.text);
                        	if(ust.title.cols.length>1){
                        		$(cols[ust.title.cols[0]]).attr('colSpan',ust.title.cols.length);
                        		for(var i=1;i<ust.title.cols.length;i++){
                        			$(cols[ust.title.cols[i]]).remove();
                        		}
                        	}
                        	
                        	
                        }
                     },
                     
                     // 查询参数
                    "fnServerData": function ( sSource, aoData, fnCallback, oSettings ) {
//                    	  console.log(aoData);
//                    	  console.log(oSettings);
                    	  var pageNo = getPageNo(aoData);
                    	  var pageLength = getPageLength(aoData);
                    	  var sort = getSort(aoData);
                    	  var sumData = getSumData(oSettings.aoColumns);
//                    	  console.log(sumData)
                    	  var data={
                    			  	pageNo:pageNo,
                    			  	pageLength:pageLength,
                    			  	fieldName:sort.fieldName?sort.fieldName:'',
                    			  	sumData:JSON.stringify(sumData),
                    				compositorType:sort.compositorType?sort.compositorType:''
                    	  };
                    	  data = setFilter(data);
	                      oSettings.jqXHR = $.ajax( {
	                          "dataType": 'json',
	                          "type": "POST",
	                          "url": sSource,
	                          "data": data,
	                          "success": fnCallback
	                        } );
                      }
                };
            if (typeof(opt) !== 'object') opt = {};
            
            var options = $.extend(options, opt);
//            console.log(options)
            
            
            // 是否可以多选
            if(options.uxCheckable){
            	options.aoColumns.unshift({
               	    sTitle:'<div class="checkbox" ><label><input type="checkbox" class="group-checkable"  /><span class="text"></span></label></div>',
             	    mData: "id",
                    bSortable: false,
                    sWidth:'40px',
                    mRender:function(data){
                 	   return '<div class="checkbox"><label><input type="checkbox" class="checkboxes" value="'+data+'" /><span class="text"></span></label></div>';
                    }
                });
            }
            // 是否可以展开
//            if(true){
//            	options.aoColumns.unshift({
//            		sTitle:'+',
//            		mData: "id",
//            		bSortable: false,
//            		sWidth:'40px',
//            		mRender:function(data){
//            			return '<i class="fa fa-plus-square-o row-details"></i>';
//            		}
//            	});
//            }
           

            
            // 个性化配置
            $.each(options.aoColumns,function(i,n){
            	//  如果是图片
            	if(n.uxImg){
            		n.mRender = Common.img;
            		n.bSortable = false;
            		n.sWidth = "20px";
            	}else if(n.uxLongText){ // 长内容自动换行
            		n.sClass = "word-break";
            	}else if(n.uxCogs){ // 按钮下拉菜单
            		handleUxOptions(options,n);
            	}else if(n.uxEnum){// 枚举
            		n.mRender = function(data,type,full){
            			var result = [];
            			
            			// 快速设置
            			if(n.uxFastSetUri || n.uxFastSet){
            				result.push(' <div class=" btn-group ">'+
            						'<a class="btn btn-xs " href="#" data-toggle="dropdown" data-close-others="true">'+
            						_GLOBAL.getEnum(n.uxEnum,data)+
            						' <i class="fa fa-angle-down"></i></a>'+
            						'<ul class="dropdown-menu pull-right">');
            				var es = _GLOBAL.getEnums(n.uxEnum);
            				var uri = n.uxFastSetUri?n.uxFastSetUri:('set'+Common.toUpperCase1(n.mData));
            				if(es){
            					$.each(es,function(enumKey,enumValue){
            						if(data!=enumKey){
            							result.push('<li ><a href="'+options.uxUrlPrev+uri+'?id='+full.id+'&value='+enumKey+'" data-handler="CONFIRM" >'+enumValue+'</a></li>');
            						}
            					})
            				}
            				
            				result.push('</ul></div>');
            			}else{
            				result.push(_GLOBAL.getEnum(n.uxEnum,data));
            			}
            			return result.join('');
            		};
            	}
            	if(n.uxNumber){ // 数字靠右
            		n.sClass = "ux-number";
            		n.mRender = function(data,type,full){
            			
            			return Common.toThousands(data);
            			
            		};
            	}
            	if(n.uxPrice){ // 数字靠右
            		n.sClass = "ux-number";
            		n.mRender = function(data,type,full){
            			
            			return Common.toThousands(data,2);
            			
            		};
            	}
            	if(n.uxCutText){ // 数字靠右
            		n.mRender = function(data,type,full){
            			return Common.cutText(data,n.uxCutText);
            		};
            	}
            	if(n.uxTextArea){ // 自动换行
            		n.mRender = function(data,type,full){
            			if(data){
            				return data.replaceAll("\n","<br/>");
            			}else {
            				return "";
            			}
            		};
            	}
            	if(!n.sWidth){ // 数字靠右
            		n.sWidth="100px";
            	}
            	if(n.uxSum){ // 合计
            		
            	}
            	
            	// 如果可以拖拽排序 则禁用手动排序
//                if(options.uxDrapable){
////                	n.bSortable = false;
//                }
            })
            
            // init table
            var oTable = $('#'+tableId).dataTable(options);
            
            
            // 每页显示N条 样式
//            jQuery('#'+tableId+'_wrapper .dataTables_length select').addClass("select2me form-control input-table-length").unwrap();
            
            // 分页按钮样式
//            <a tabindex="0" class="previous paginate_button paginate_button_disabled" id="example_previous">Previous</a>
//            jQuery('#'+tableId+'_info').removeClass();
            
            var dataDiv =$($('#'+tableId).parents('div.data-div')[0]);
            // handle 查询按钮
            dataDiv.find(".search").on('click',function(){
            	oTable.fnDraw();
            	Notify('查询成功', 'top-right', '100', 'success', 'fa-check', true);
            });
            // handle input enter event
//            $('#'+tableId).parent().parent().parent().find("form input").keyup(function(e){
//                if(e.keyCode == 13){
//                
//                	oTable.fnDraw();
//                	
//                }
//                e.preventDefault();
//            });
            // handle reload btn
            $('#refresh-toggler').off().on('click',function(){
//            	alert(1);
            	oTable.fnDraw(true);
            	Notify('刷新成功', 'top-right', '100', 'success', 'fa-check', true);
            });
           
          
            // begin hadle check box
            jQuery('#'+tableId+' .group-checkable').off().on("change",function () {
                var set = jQuery('#'+tableId+' .checkboxes');
                var checked = jQuery(this).is(":checked");
                jQuery(set).each(function () {
                	
                    if (checked) {
                        $(this).attr("checked", "checked");
                        this.checked=true;
                        $(this).parents('tr').addClass("active");
                    } else {
                        $(this).removeAttr("checked");
                        this.checked=false;
                        $(this).parents('tr').removeClass("active");
                    }
                });
//                jQuery.uniform.update(set);

            });
            
            
            
            // end hadle check box
            
            
            // 编辑
            if(options.uxEdit){
            	 var isEditing = null;
                 //Cancel Editing or Adding a Row
                 $(oTable).on("click", 'a.cancel', function (e) {
                     e.preventDefault();
                     if ($(this).attr("data-mode") == "new") {
                         var nRow = $(this).parents('tr')[0];
                         oTable.fnDeleteRow(nRow);
                     } else {
                         restoreRow(oTable, isEditing);
                         isEditing = null;
                     }
                 });

                 //Edit A Row
                 $(oTable).on("click", 'a.edit', function (e) {
                     e.preventDefault();
                     
                     var nRow = $(this).parents('tr')[0];
                     
                     if (isEditing !== null) {
//                         restoreRow(oTable, isEditing);
//                         editRow(oTable, nRow);
//                         isEditing = nRow;
                     } else {
                         editRow(oTable, nRow);
                         isEditing = nRow;
                     }
                 });

                 //Save an Editing Row
                 $(oTable).on("click", 'a.save', function (e) {
                     e.preventDefault();
                     saveRow(oTable, isEditing);
                     isEditing = null;
                     //Some Code to Highlight Updated Row
                        
                 });


                 var restoreRow = function (oTable, nRow) {
//                     var aData = oTable.fnGetData(nRow);
//                     var jqTds = $('>td', nRow);
//
//                     for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
//                         oTable.fnUpdate(aData[i], nRow, i, false);
//                     }

                     oTable.fnDraw(false);
                 }
               
                 var editRow = options.uxEdit.edit || function (oTable, nRow) {
                	 
                 }

                 var saveRow = options.uxEdit.save || function (oTable, nRow) {
                	 
                 }

                 var cancelEditRow = options.uxEdit.cancel || function (oTable, nRow) {
                     oTable.fnDraw(false);
                 }
            }
            
            return oTable;
            
        }
    

    };

}();