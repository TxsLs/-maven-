<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
    <div class="right_col" role="main"> 
	<form class="form-horizontal form-label-left" novalidate>

                      <span class="section">每日销售单信息</span>
					  <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-5" width="15">id<span >*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-5">
                          <input id="id" class="form-control input-small input-sm "  value="${dailysale.id}"  type="text" readonly>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-5" width="15">商品id<span >*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-5">
                          <input id="proid" class="form-control input-small input-sm "  value="${dailysale.proid}"  type="text" readonly>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-5" >名称<span >*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-5">
                          <input id="proname" class="form-control col-md-7 col-xs-5" value="${dailysale.pname}"  type="text" readonly>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-5" >总价 <span >*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-5">
                          <input id="price" class="form-control col-md-7 col-xs-5" value="${dailysale.price}"  type="text" readonly>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-5" >数量<span >*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-5">
                          <input id="num" class="form-control col-md-7 col-xs-5" value="${dailysale.num}"  type="text" readonly>
                        </div>  
                        </div>
                      
						<a href="${pageContext.request.contextPath }/manage/flatform/dailysale/getall" class=" text-left btn btn-default  " role="button">返回上页</a>
                    </form>
	<div class="clearfix"></div>
	</div>
<%@include file="common/footer.jsp"%>