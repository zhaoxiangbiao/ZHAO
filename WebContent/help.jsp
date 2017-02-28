
辐射告警：
<span class="pull-right tooltips" pulsate="warning" data-container="body" data-placement="top" data-original-title="短信使用超出上限！" ><i class="fa fa-warning  warning"></i></span>


在customSelect2.js 中定义select2 的 格式化方法

列表中 多选提交操作时，后台获取选中的值集合的name=ids

 
 列表 ----枚举  (枚举名称：'deviceStatus')
			{ uxEnum:'deviceStatus',uxFastSet:true}
			
	 ---- 扩展操作按钮  {name:"审核",uri:'edit',dataHandler:'INLINE',iclass:'fa fa-info info',dataForm=true}


设置枚举值样式  <span class='label label-sm label-success'>运行正常</span> primary info default warning danger

查询条件
/**
	 * 比较类型
	 */
	public enum MatchType
	{
		EQ, // =
		LIKE, // like
		LT, // <
		LE, // <=
		GT, // >
		GE, // >=
		IN, // in  filter_INS_menuType=9,0,1
		IS, // is null  filter_IST_menuType
		ISNOT, // is not null
		NOTLIKE, 
		NOTEQ, // filter_NOTEQS_menuType=3
		NOTIN;
	}

	/**
	 * 字段类型
	 */
	public enum FiledType
	{
		S(String.class), //字符串
		I(Integer.class), //整形
		L(Long.class), //长整形
		N(Double.class), //双精度
		D(Date.class), //时间
		B(Boolean.class),//布尔
		T(Byte.class);//byte

	}


i.fa.danger{
color: #ed4e2a;
}
i.fa.info{
color: #57b5e3;
}
i.fa.primary{
color: #428bca ;
}
i.fa.warning{
color: #fcb322;
}
i.fa.success{
color: #3cc051;
}
i.fa.purple{
color:#852b99;
}



初始化菜单 
delete  FROM `sys_menu` where id > 670;
delete  FROM `sys_menu_role` where menu_id > 670;
