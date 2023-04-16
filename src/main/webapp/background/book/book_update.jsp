<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="zh-cn">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>图书修改</title>
		<link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=basePath%>/css/mmss.css"/>
		<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
		<link rel="stylesheet" href="<%=basePath%>/layer/skin/default/layer.css" media="all">
		  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
		<script src="<%=basePath%>/js/jquery-1.11.3.js"></script>
		<script src="<%=basePath%>/js/bootstrap.js"></script>
	</head>
	<body>
	 <div class="container">
	    <div class="col-lg-8">
	    	<div class="panel panel-info">
	        	<div class="panel-heading">
	                            图书信息新增
	            </div>
				<div class="panel-body">
					<form class="form-horizontal" enctype="multipart/form-data" id="book_save_form" action="<%=basePath %>/book/updateBook?id=${bean.bookId}" method="post">
				        <div class="form-group top">
				              <ul>
				                  <li>
					                  <div class="form-group top">
					                      <label  class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书名称 </span></label>
					                      <div class="col-sm-10">
					                      	<input name="bookName" type="text" id="bookName" value="${bean.bookName}"/>
					                      </div>
					                   </div>
				                  </li>
				                  <li>
					                  <div class="form-group top2">
					                      <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书封面 </span></label>
					                      <div class="col-sm-10">
					                      	<input name="bookCover1" type="file" style="display:inline;" id="file"/>
					                      </div>
					                   </div>
				                  </li>
				                  <li>
					                  <div class="form-group top2">
					                      <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书作者</span></label>
					                      <div class="col-sm-10">
					                      	<input name="bookAuthor" type="text" id="bookAuthor" value="${bean.bookAuthor}"/>
					                      </div>
					                  </div>
				                  </li>
				                  <li>
					                  <div class="form-group top2">
					                      <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书详情</span></label>
					                      <div class="col-sm-10">
						                      <!-- <input name="bookdetails" type="text" id="bookdetails"/> -->
						                      <a class=" btn btn-primary " data-toggle="modal" data-target="#details1">图书详情添加</a>
						                       <input type="hidden" id="bookdetails" name="bookdetails" value="${bean.bookdetails}">
					                       </div>
					                    </div>
				                   </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>出版社</span></label>
					                        <div class="col-sm-10">
					                        	<input name="bookPress" type="text" id="bookPress" value="${bean.bookPress}"/>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>出版时间 </span></label>
					                        <div class="col-sm-10">
					                        	<input name="bookPblishTime" type="text" id="bookPblishTime" value="${bean.bookPblishTime}"/>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书版次 </span></label>
					                        <div class="col-sm-10">
					                        	<input name="bookEdition" type="text" id="bookEdition" value="${bean.bookEdition}"/>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书开本 </span></label>
					                        <div class="col-sm-10">
					                        	<input name="bookSize" type="text" id="bookSize" value="${bean.bookSize}"/>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书定价 </span></label>
					                        <div class="col-sm-10">
					                        	<input name="bookPrice"  type="text" id="bookPrice" value="${bean.bookPrice}"/>
					                        	<span id="helpBlock" class="help-block">请输入非0正整数，单位是：分</span>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书售价 </span></label>
					                        <div class="col-sm-10">
					                        	<input name="bookSellPrice" type="text" id="bookSellPrice" value="${bean.bookSellPrice}"/>
					                        	<span id="helpBlock" class="help-block">请输入非0正整数，单位是：分</span>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书进货价 </span></label>
					                        <div class="col-sm-10">
					                        	<input name="bookPrimeCost" type="text" id="bookPrimeCost" value="${bean.bookPrimeCost}"/>
					                        	<span id="helpBlock" class="help-block">请输入非0正整数，单位是：分</span>
					                        </div>
					                    </div>
				                    </li>
				                    <li>
					                    <div class="form-group top2">
					                        <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>一级分类 </span></label>
					                        <div class="col-sm-10">
					                         <!-- <input name="bookTyprFirst" type="text"/> -->
						                         <select class="bookTyprFirst">
						                         	<option>请选择</option>
													<c:forEach items="${firstList}" var="firstList">
													<option>${firstList.typeName}</option>
													</c:forEach>
												</select>
												<input type="hidden" id="bookTyprFirst" name="bookTyprFirst">
												<input type="hidden" id="bookOldTypeFirst" value="${firstTypeDTO.typeName}">
										    </div>
									   </div>
					                </li>
					                 <li>
						                 <div class="form-group top2">
						                    <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>二级分类 </span></label>
						                                                <!-- <input name="bookTypeSecond" type="text"/> -->
						                    <div class="col-sm-10">
							                    <select class="bookTypeSecond">
							                    	<option>请选择</option>
													<%-- <c:forEach items="${secondList}" var="secondList">
													<option>${secondList.typeName}</option>
													</c:forEach> --%>
												</select>
												<input name="bookTypeSecond" type="hidden" id="bookTypeSecond" value="">
												<input type="hidden" id="bookOldTypeSecond" value="${secondTypeDTO.typeName}">
											</div>
										</div>
					                 </li>
					                 <li>
						                 <div class="form-group top2">
						                    <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>三级分类 </span></label>
						                    <div class="col-sm-10">
							                    <select class="bookTypeThird">
							                    	<option>请选择</option>
							                    	<%-- <c:forEach items="${thirdList}" var="thirdList">
													<option>${thirdList.typeName}</option>
													</c:forEach> --%>
												</select>
												<input name="bookTypeThird" type="hidden" id="bookTypeThird">
												<input type="hidden" id="bookOldTypeThird" value="${thirdTypeDTO.typeName}">
											</div>
										</div>
					                 </li>
					                 <li>
						                 <div class="form-group top2">
						                    <label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书库存 </span></label>
						                    <div class="col-sm-10">
						                    	<input name="bookNumber" type="text" id="bookNumber" value="${bean.bookNumber}"/>
						                    	<span id="helpBlock" class="help-block">请输入正整数，单位是：本</span>
						                    </div>
						                 </div>
					                 </li>
					                 <li>
						                 <div class="form-group top2">
						                	<label class="col-sm-2 control-label" style="padding-top: 0px;"><span>图书ISBN </span></label>
						                	<div class="col-sm-10">
						                 		<input name="bookISBN" type="text" id="bookISBN" value="${bean.bookISBN}"/>
						                 	</div>
						                 </div>
					                 </li>
					                 <li>
						                 <div class="form-group top2">
						                	<label class="col-sm-2 control-label" style="padding-top: 0px;"><span>状态</span></label>
						                	<div class="col-sm-10" id="status_radio">
						                		<input name="bookStatus" type="radio" value="0" id="status0_label"/>
						                		<label for="status0_label">普通</label>
						                		<input name="bookStatus" type="radio" value="1" id="status1_label"/>
						                		<label for="status1_label">预售</label>
						                		<input name="bookStatus" type="radio" value="2" id="status2_label"/>
						                		<label for="status2_label">精选</label>
						                		<input name="bookStatus" type="radio" value="3" id="status3_label"/>
						                		<label for="status3_label">特惠</label>
						                		<input name="bookStatus" type="radio" value="4" id="status4_label"/>
						                		<label for="status4_label">畅销</label>
						                		<input name="bookStatus" type="radio" value="5" id="status5_label"/>
						                		<label for="status4_label">下架</label>
						                		<input name="bookStatus" type="radio" value="6" id="status6_label"/>
						                		<label for="status4_label">网购爆品</label>
						                		<input name="bookStatus" type="radio" value="7" id="status7_label"/>
						                		<label for="status4_label">热卖图书</label>
						                		<input name="bookStatus" type="radio" value="8" id="status8_label"/>
						                		<label for="status4_label">限时抢购</label>
						                		<input name="bookStatus" type="radio" value="9" id="status9_label"/>
						                		<label for="status4_label">热评商品</label>
						                		<input type="hidden" value="${bean.bookStatus}" id="book_status">
						                	</div>
						                </div>
					                </li>                            
					               	<li>
						               	<div class="form-group top2">
						                	<label class="col-sm-2 control-label" style="padding-top: 0px;"><span>销量</span></label>
						                	<div class="col-sm-10">
						                    	<input name="bookSales" type="text" id="bookSales" value="${bean.bookSales}"/>
						                    	<span id="helpBlock" class="help-block">请输入正整数，单位是：本</span>
						                    </div>
						                </div>
					            	</li>
					        	</ul>
					        </div>
						</form>
				        	<button id="save_book_submit" class="btn btn-primary btn-sm">提交</button>
				            <button class="btn btn-default btn-sm" data-dismiss="modal" onclick="javascript:history.back()">取消</button>
						<div class="modal fade" id="details1" tabindex="-1" role="dialog" aria-labelledby="details11">
					         <div class="modal-dialog" role="document">
					             <div class="modal-content">
					                 <div class="modal-header">
					               						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					                     <h4 class="modal-title" id="details11">图书详情添加</h4>
					                 </div>
					                  <div class="modal-body">
									<textarea id="book_details" name="bookdetails1" rows="40" class="col-sm-12">${bean.bookdetails}</textarea>
					                  </div>
					                  <div class="modal-footer">
					                      <button class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
					                      <input class="btn btn-primary btn-sm" type="text" data-dismiss="modal" id="details_submit" value="提交">
					                  </div>
					             </div>
					         </div>
					    </div>
			        </div>
				</div>
			</div>
		</div>
		<script src="<%=basePath %>/layer/layer.js"></script>
		<script src="<%=basePath %>/ckEiditor/ckeditor.js"></script>
	    <script type="text/javascript">
		     CKEDITOR.replace('book_details',{ height: '420px' });
		     /* $('#details').on('show.bs.modal', function (event) {
		    	    var button = $(event.relatedTarget);
		    	    var recipient = button.data('whatever');
		    	    var modal = $(this);
		    	    modal.find('.modal-title').text('' + recipient);
		    	    modal.find('.modal-body input').val(recipient)
		    	}); */
		    $("#details_submit").click(function (){
			    var content = CKEDITOR.instances.book_details.getData();
		    	$("#bookdetails").val(content);
		    }); 
		     $("#save_book_submit").click(function (){
		    		var bookNameVal =$.trim($("#bookName").val()); 
		    		var bookAuthorVal =$.trim($("#bookAuthor").val());
		    		var bookISBNVal =$.trim($("#bookISBN").val());
		    		var bookPressVal =$.trim($("#bookPress").val());
		    		var bookPblishTimeVal =$.trim($("#bookPblishTime").val());
		    		var bookEditionVal =$.trim($("#bookEdition").val());
		    		var bookSizeVal =$.trim($("#bookSize").val());
		    		var bookPriceVal =$.trim($("#bookPrice").val());
		    		var bookCoverval = $.trim($("#file").val());
		    		var strFileName=bookCoverval.replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi,"$1");  //正则表达式获取文件名，不带后缀
		    		var FileExt=strFileName+"."+bookCoverval.replace(/.+\./,"");   //正则表达式获取后缀
		    		var bookSellPriceVal =$.trim($("#bookSellPrice").val());
		    		var bookPrimeCostVal =$.trim($("#bookPrimeCost").val());
		    		var bookTypeSecondVal =$("#bookTypeSecond").val();
		    		var bookTyprFirstVal =$("#bookTyprFirst").val();
		    		var bookFirstVal =$(".bookTyprFirst").find("option:selected").text();
		    		var bookSecondVal =$(".bookTypeSecond").find("option:selected").text();
		    		var bookThirdVal =$(".bookTypeThird").find("option:selected").text();
		    		var bookTypeThirdVal =$("#bookTypeThird").val();
		    		var bookNumberVal =$.trim($("#bookNumber").val());
		    		var bookdetailsVal =$.trim($("#bookdetails").val());
		    		var bookStatusVal =$('#status_radio input[name="bookStatus"]:checked ').val();
		    		var bookSalesVal =$.trim($("#bookSales").val());
		    		if(null!=bookNameVal&&bookNameVal!=""){
		    			if(null!=bookAuthorVal&&bookAuthorVal!=""){
		    				if(null!=bookISBNVal&&bookISBNVal!=""){
		    					if(null!=bookPressVal&&bookPressVal!=""){
		    						if(null!=bookPblishTimeVal&&bookPblishTimeVal!=""){
		    							if(null!=bookEditionVal&&bookEditionVal!=""){
		    								if(null!=bookSizeVal&&bookSizeVal!=""){
		    									if(null!=bookPriceVal&&bookPriceVal!=""&&bookPriceVal.match(/^\+?[1-9][0-9]*$/)){
		    										if(null!=bookSellPriceVal&&bookSellPriceVal!=""&&bookPriceVal.match(/^\+?[1-9][0-9]*$/)){
		    											if(null!=bookPrimeCostVal&&bookPrimeCostVal!=""&&bookPriceVal.match(/^\+?[1-9][0-9]*$/)){
		    												if(null!=bookTyprFirstVal&&bookTyprFirstVal!=""&&bookFirstVal!="请选择"){
		    													if(null!=bookTypeSecondVal&&bookTypeSecondVal!=""&&bookSecondVal!="请选择"){
		    														if(null!=bookTypeThirdVal&&bookTypeThirdVal!=""&&bookThirdVal!="请选择"){
		    															if(null!=bookNumberVal&&bookNumberVal!=""&&bookNumberVal.match(/^\d+$/)){
		    																if(null!=bookdetailsVal&&bookdetailsVal!=""){
		    																		if(null!=bookSalesVal&&bookSalesVal!=""&&bookSalesVal.match(/^\d+$/)){
		    																			 <%-- $.post(
		    																				    	"<%=basePath %>/book/saveBook",
		    																				    		{
		    																				    			bookName:bookNameVal,
		    																				    			bookAuthor:bookAuthorVal,
		    																				    			bookISBN:bookISBNVal,
		    																				    			bookPress:bookPressVal,
		    																				    			bookPblishTime:bookPblishTimeVal,
		    																				    			bookEdition:bookEditionVal,
		    																				    			bookSize:bookSizeVal,
		    																				    			bookPrice:bookPriceVal,
		    																				    			bookSellPrice:bookSellPriceVal,
		    																				    			bookPrimeCost:bookPrimeCostVal,
		    																				    			bookCover:FileExt,
		    																				    			bookTyprFirst:bookTyprFirstVal,
		    																				    			bookTypeSecond:bookTypeSecondVal,
		    																				    			bookTypeThird:bookTypeThirdVal,
		    																				    			bookNumber:bookNumberVal,
		    																				    		    bookdetails:bookdetailsVal, 
		    																				    			bookStatus:bookStatusVal,
		    																				    			bookSales:bookSalesVal   
		    																				    		},
		    																				    		function(data){
		    																				    			if(data == "success"){
		    																				    				window.location.href="<%=basePath %>/book/list";
		    																				     			}else{
		    																				    				alert("注册失败");
		    																				    			}
		    																				    		}); --%>
		    																				   $("#book_save_form").submit();	
		                                                        					}else{
		                                                            					alert("销量格式不正确，请重新输入");
		                                                            				}
		                                                					}else{
		                                                    					alert("详情不能为空，请重新输入");
		                                                    				}
		                                            					}else{
		                                                					alert("库存格式不正确，请重新输入");
		                                                				}
		                                        					}else{
		                                            					alert("三级目录不能为空，请重新输入");
		                                            				}
		                                    					}else{
		                                        					alert("二级目录不能为空，请重新输入");
		                                        				}
		                                					}else{
		                                    					alert("一级目录不能为空，请重新输入");
		                                    				}
		                            					}else{
		                                					alert("进价格式不正确，请重新输入");
		                                				}
		                        					}else{
		                            					alert("售价格式不正确，请重新输入");
		                            				}
		                    					}else{
		                        					alert("定价格式不正确，请重新输入");
		                        				}
		                					}else{
		                    					alert("开本不能为空，请重新输入");
		                    				}
		            					}else{
		                					alert("版次不能为空，请重新输入");
		                				}
		        					}else{
		            					alert("出版时间不能为空，请重新输入");
		            				}
		    					}else{
		        					alert("出版社不能为空，请重新输入");
		        				}
		    				}else{
		    					alert("条形码不能为空，请重新输入");
		    				}
		    			}else{
		    				alert("作者不能为空，请重新输入");
		    			}
		    		}else{
		    			alert("书名不能为空，请重新输入");
		    		}
		    	});
		    	//动态获取二级类目
		    	$(".bookTyprFirst").change(function(){
		    		var bookTyprFirstVal =$(".bookTyprFirst").find("option:selected").text();
		    		$(".bookTypeSecond").html("<option>请选择</option>");
		    		if(bookTyprFirstVal!="请选择"&&bookTyprFirstVal!=null&&bookTyprFirstVal!=""){
		    		$.post(
						    "<%=basePath %>/book/checksecond",
						   		{
						   			typeName:bookTyprFirstVal,
					    		},
					    		function(data){
					    			var json = $.parseJSON(data);
					    			$("#bookTyprFirst").val(json.bookFirstId);
					    			var list = json.bookSecond;
					    			var niw="";
					    			for(var i=0;i<list.length;i++){
					    				 niw+='<option>'+list[i]+'</option>';
					    			}
					    			$(".bookTypeSecond").html("<option>请选择</option>"+niw);
						    	}) 
		    		}
		    	});
		    /* 	$(".bookTypeSecond").focus(function(){
		    		$(".bookTypeThird").append("");
		    	} ; */
		    	//动态获取三级类目
		    	$(".bookTypeSecond").change(function(){
		    		var bookTyprSecondVal =$(".bookTypeSecond").find("option:selected").text();
					$(".bookTypeThird").html("<option>请选择</option>");
					if($(".bookTypeThird").focus()){
		    		if(bookTyprSecondVal!="请选择"&&bookTyprSecondVal!=null&&bookTyprSecondVal!=""){
		    		$.post(
						    "<%=basePath %>/book/checkthird",
						   		{
						   			typeName:bookTyprSecondVal,
					    		},
					    		function(data){
					    			var json = $.parseJSON(data);
						    		var list = json.bookThird;
					    			$("#bookTypeSecond").val(json.bookSecondId);
										var niw="";
						    			for(var i=0;i<list.length;i++){
						    				 niw+='<option>'+list[i]+'</option>';
						    			}
						    			$(".bookTypeThird").html("<option>请选择</option>"+niw);
					    			}
					    			
						    	) 
		    		}
					}
		    	});
		    	
		    	$(".bookTypeThird").change(function(){
		    		var bookTyprSecondVal =$(".bookTypeThird").find("option:selected").text();
		    		if(bookTyprSecondVal!="请选择"&&bookTyprSecondVal!=null&&bookTyprSecondVal!=""){
			    		$.post(
							    "<%=basePath %>/book/getid",
							   		{
							   			typeName:bookTyprSecondVal,
						    		},
						    		function(data){
						    			$("#bookTypeThird").val(data);
							    	});
		    		}
		    	});
		    	var typeOldFirstVal = $("#bookOldTypeFirst").val();
		    	var bookOldSecondVal = $("#bookOldTypeSecond").val();
		    	var bookOldThirdtVal = $("#bookOldTypeThird").val();
		    	$.post(
				    "<%=basePath %>/book/checksecond",
				   		{
				   			typeName:typeOldFirstVal,
			    		},
			    		function(data){
			    			var json = $.parseJSON(data);
			    			$("#bookTyprFirst").val(json.bookFirstId);
			    			var list = json.bookSecond;
			    			var niw="";
			    			for(var i=0;i<list.length;i++){
			    				 niw+='<option>'+list[i]+'</option>';
			    			}
			    			$(".bookTypeSecond").html("<option>请选择</option>"+niw);
			    			 $(".bookTyprFirst").val(typeOldFirstVal); 
		    	$.post(
				    "<%=basePath %>/book/checkthird",
				   		{
				   			typeName:bookOldSecondVal,
			    		},
			    		function(data){
			    			var json = $.parseJSON(data);
				    		var list = json.bookThird;
			    			$("#bookTypeSecond").val(json.bookSecondId);
								var niw="";
				    			for(var i=0;i<list.length;i++){
				    				 niw+='<option>'+list[i]+'</option>';
				    			}
				    			$(".bookTypeThird").html("<option>请选择</option>"+niw);
				    			$(".bookTypeSecond").val(bookOldSecondVal);
						    	$.post(
									    "<%=basePath %>/book/getid",
									   		{
									   			typeName:bookOldThirdtVal,
								    		},
								    		function(data){
								    			$("#bookTypeThird").val(data);
								    			$(".bookTypeThird").val(bookOldThirdtVal);
									    	});
			    			});
				    	});
		    	$("input[name=bookStatus]:eq("+$("#book_status").val()+")").attr("checked",'checked'); 
	     </script>                               
	</body>
</html>