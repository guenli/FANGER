<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        

<jsp:include page="../../common/Header.jsp" flush="false"></jsp:include>

  <div class="container">
        <div class="row">
        
            <div class="span9">
                <div class="row">
                    <div class="span9 image-detail">
                        <div class="auto image-single">
                            <img src='<c:url value="${spotDetail.images.resId }"/>' class="centered" />
                        </div>
                    </div>
                    <div class="span9 image-description">
                        <h3>简介：</h3>
                        <p>
                        ${spotDetail.summary }
                       </p>
                    </div>
                    <div class="span9 image-comments">
                    	<div class="comment">
                    	  <c:choose>
	                        <c:when test="${spotDetail.commentsCount==0 }">
	                        	<h3>暂无评论...</h3>
	                        </c:when>
	                        <c:otherwise>
	                        	<h3>共有 ${spotDetail.commentsCount } 条评论</h3>
	                        	<ul>
	                        	<c:forEach items="${spotDetail.comments }" var="comment">
	                        		<li>
	                                    <div class="avatar">
	                                        <a href="#"><img src="<c:url value="/resources/img/gravatar.jpg"/>" /></a>
	                                        <span class="comment-name">
	                                        <c:choose>
	                                        <c:when test="${empty comment.createdBy }">
	                                        	匿名用户：<a href=""><c:out value="${comment.name }" /></a>
	                                        </c:when>
	                                        <c:otherwise>
	                                        	注册用户：<a href="#">${comment.createdBy.name }:</a>
	                                        </c:otherwise>
	                                        </c:choose>
		                                       
	                                        </span>
	                                        <span class="comment-date"><p>${comment.createdAt }</p></span>
	                                    </div>
	                                    <div class="comment-text">
	                                        <p>${comment.content }</p>
	                                    </div>
	                                </li>
	                        	</c:forEach>
	                        	</ul>
	                        </c:otherwise>
	                        </c:choose>
                        </div>
                        
                        <br class="clearfix" />
                        
                        <!--  -->
                        
                        <h3>我要评论</h3>
                        <div class="post-comment">
                            <form id="add-comment-form" class="form-horizontal" action="<c:url value="/addComment"/>" autocomplete="off" method="post">
             					<input type="hidden" name="spotId" value="${spotDetail.id }"/>
             					<c:choose>
             					<c:when test="${empty sessionScope.signInUser}">
             						<hr class="alt" />
	                                 <p>要评论，但不想填写这些信息。您可以点击<a href="<c:url value="/signIn"/>">这里登陆</a>系统，如果没有账号，那就去<a href="<c:url value="/signUp"/>">注册</a>吧！
	                                 <hr class="alt" />
	                                 <textarea rows="5" class="input-xxlarge inp-btm" name=content style="resize: none;" placeholder="写评论.."  required></textarea><br />
	                                <input type="email" name="email" class="input-xxlarge inp-btm" placeholder="你的邮箱..." required/><br />
	                                <input type="text" name="name" class="input-xxlarge inp-btm" placeholder="怎么称呼..." required /><br />
	                                <input type="text" name="siteAdd" class="input-xxlarge inp-btm" placeholder="你的站点..."  /><br />
	                                
             					</c:when><c:otherwise>
             						<textarea rows="5" class="input-xxlarge inp-btm" name="content" style="resize: none;" placeholder="写评论.."  required></textarea><br />
             					</c:otherwise>
             					</c:choose>		
                                <input type="submit" name="submit" value="提交" class="btn btn-primary" /> 
                                <input type="reset" name="reset" value="取消" class="btn" />
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
            
            <div class="span3">
                <div class="row">
                    <div class="span3 sidebar-detail-menu">
                        <ul>
                            <li><a href="#" id="link_share" rel="tooltip" title="分享">分享</a></li>
                            <li><a href="#" id="link_mark" rel="tooltip" title="标记">标记</a></li>
                            <li><a href="<c:url value="/spotDetail/download/${spotDetail.id }"/>" id="link_download" rel="tooltip" title="下载">下载</a></li>
                            <li><a href="#" id="link_like" rel="tooltip" title="顶一个">顶一个</a></li>
                        </ul>
                    </div>
                    
                    
                    <div class="span3 sidebar-detail-similiar">
                        <div class="similiar-image">
                            <h4>您可能还喜欢...</h4>
                            <hr class="alt" />
                            <a href="#"><img src="<c:url value="/resources/images_repo/1_b.jpg"/>" class="img-thumbs" /></a>
                            <a href="#"><img src="<c:url value="/resources/images_repo/3_b.jpg"/>" class="img-thumbs" /></a>
                            <a href="#"><img src="<c:url value="/resources/images_repo/5_b.jpg"/>" class="img-thumbs" /></a>
                            <a href="#"><img src="<c:url value="/resources/images_repo/1_b.jpg"/>" class="img-thumbs" /></a>
                            <a href="#"><img src="<c:url value="/resources/images_repo/5_b.jpg"/>" class="img-thumbs" /></a>
                            <a href="#"><img src="<c:url value="/resources/images_repo/1_b.jpg"/>" class="img-thumbs" /></a>
                        </div>    
                    </div>
                    
                    <!--标签 
                    <div class="span3 sidebar-detail-category">
                        <div class="category-image">
                            <div class="cat-tags">Tags : <a href="#">Building</a>, <a href="#">Tower</a>, <a href="#">Eifel</a>, <a href="#">Wonders of the world</a>, <a href="#">Miracle</a></div>
                            <div class="cat-category">Category : <a href="#">image</a>, <a href="#">building</a>, <a href="#">photography</a> </div>
                            <div class="cat-downloaded">Downloaded by : <a href="#">John Doe</a>, <a href="#">Lisa</a>, <a href="#">Andra</a>, <a href="#">Avriq</a>, <a href="#">Aji satria</a> </div>
                            <div class="cat-liked">Liked by : <a href="#">Lisa</a>, <a href="#">John Doe</a>, <a href="#">Avriq</a>, <a href="#">Aji satria</a> </div>
                            <div class="cat-shared">Shared by : <a href="#">Nichols</a>, <a href="#">John Doe</a>, <a href="#">Avriq</a>, <a href="#">Abraham</a>, <a href="#">Jordan</a>, <a href="#">James</a> </div>
                        </div>
                    </div>
                   -->
                </div>
            </div>
        </div>
    </div>

<!-- alert pop model -->
<div id="alert-msg-model" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h3>信息提示</h3>
  </div>
  <div class="modal-body">
  	<div id="alert_msg_content" class="alert alert-block alert-error fade in"></div>
  </div>
  <div class="modal-footer">
    <a href="#" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">关闭</a>
  </div>
</div>

<jsp:include page="../../common/Script.jsp" flush="false"></jsp:include>
<script type="text/javascript">
<!--
$(function(){
	$('#add-comment-form').ajaxForm({ 
	    dataType:  'json', 
	    beforeSubmit: function(formData, jqForm, options){
	    	
	    },
	    success:  function(data){
	    	var alertStr = "";
	    	if(!data || data.resultCode == 'SUCCESS' ){alertStr="评论成功！";}
	    	if(!data || data.resultCode == 'EXCEPTION' ){alertStr="程序异常！";}
	    	if(!data || data.resultCode == 'NO_AUTH' ){alertStr="认证没有通过！";}
	    	alert(alertStr);
	    	window.top.location.reload();//刷新当前页面
	    },
	    complete: function(jqXHR, textStatus){
	    	
	  	}
	});	
	
	$("#link_share").bind("click",function(){
		var url = "<c:url value="/spotDetail/share/${spotDetail.id }"/>";
		doTask(url,'分享');
	});
	$("#link_mark").bind("click",function(){
		var url = "<c:url value="/spotDetail/mark/${spotDetail.id }"/>";
		doTask(url,'标记');	
	});
	$("#link_like").bind("click",function(){
		var url = "<c:url value="/spotDetail/like/${spotDetail.id }"/>";
		doTask(url,'喜欢');
	});
	
	function doTask(url,typeStr){
		var alertStr = "功能为实现！";
		 $.ajax({
		        type: "POST",
		        dataType: "json",
		        url: url,
		        success: function(data){
		        	if(!data || data.resultCode == 'SUCCESS' ){alertStr="<p class=\"alert-message success\">"+typeStr+"成功！</p>";}
			    	if(!data || data.resultCode == 'EXCEPTION' ){alertStr="<p class=\"alert-message warning\">程序异常，请重新尝试！</p>";}
			    	if(!data || data.resultCode == 'NO_AUTH' ){alertStr="<p class=\"alert-message error\">您还未登陆，点击 <a href='<c:url value='/signIn' />'>这里</a> 登陆！</p>";}
				    	
			    },
			    complete: function(jqXHR, textStatus){
			    	
		            $('#alert_msg_content').html(alertStr);
		            $("#alert-msg-model").modal('show');
		            
			  	}
		    });	
	}
});
//-->
</script>

<!-- 返回顶部-->
<jsp:include page="../utill/backTop.jsp" flush="false"></jsp:include>
<!-- 版权信息 -->
<jsp:include page="../../common/Tail.jsp" flush="false"></jsp:include>