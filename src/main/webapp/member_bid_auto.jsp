<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html dir="ltr" lang="zh-CN" xml:lang="zh-CN">
 <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <meta name="description" content="点融网为广大个人和微小企业提供便利的投融资服务。借款产品灵活、大额、费用低、手续快；投资方式人性友好、回报高、百分百本金保护！Dianrong.com provides online efficient investment and financing services for individuals and SMEs. Better rates, lower cost, faster way to borrowers and more flexible investment, higher returns, 100% principal protection to investors." /> 
  <meta name="keywords" content="P2P网贷,P2P网络贷款平台,P2P网络投资平台,P2P投资理财平台,网络贷款平台,团团赚,点融,点融网,点融官网" /> 
  <link rel="shortcut icon" href="./static/images/favicon.ico" />
  <title>自动投标-member_bid_auto.html</title> 
  <link href="./static/css/bootstrap.min.css" rel="stylesheet" />
  <link href="./static/css/components.css?ver=142682356" rel="stylesheet" />
  <link href="./static/css/main.css?ver=142682356" rel="stylesheet" />
  <link href="./static/css/new-home.css?ver=142682356" rel="stylesheet" />
  <style type="text/css">
    @media (min-width: 992px) {
      @font-face {
        font-family: 'proxima-nova';
        src: url('./static/fonts/proximanova-regular-webfont.eot');
        src: url('./static/fonts/proximanova-regular-webfont.eot?#iefix') format('embedded-opentype'),
          url('./static/fonts/proximanova-regular-webfont.woff') format('woff'),
          url('./static/fonts/proximanova-regular-webfont.ttf') format('truetype');
        font-weight: normal;
        font-style: normal;
      }

      @font-face {
        font-family: 'proxima-nova';
        src: url('./static/fonts/proximanova-bold-webfont.eot');
        src: url('./static/fonts/proximanova-bold-webfont.eot?#iefix') format('embedded-opentype'),
          url('./static/fonts/proximanova-bold-webfont.woff') format('woff'),
          url('./static/fonts/proximanova-bold-webfont.ttf') format('truetype');
        font-weight: bold;
        font-style: normal;
      }
    }
  </style> 
  <!-- Add support for bootstrap in IE8 --> 
  <!--[if lt IE 9]>
  <link href="./static/css/ie8.css?ver=142682356" rel="stylesheet">
  <![endif]--> 
  <!--[if IE 9]>
  <link href="./static/css/ie9.css?ver=142682356" rel="stylesheet">
  <![endif]--> 

 </head> 
 <body> 
  <!--[if lt IE 8]>
<div class="alert alert-warning text-center" style="margin-bottom:0;">
  <p>你的浏览器不支持点融网的一些新特性，请升级你的浏览器至<a href="http://se.360.cn/">360浏览器</a>或<a href="http://browsehappy.com/">Chrome</a>。
  </p>
  <p>正在为你跳转到旧版网站...<a href="index.jsp">立即跳转</a></p>
  <p>2015年了，IE8老了...</p>
</div>
<![endif]--> 
  <div class="wrapper "> 
   <!--header--> 
   <header class="sl-header" ng-controller="HeaderCtrl" id="sl-header"> 
    <nav class="navbar navbar-inverse navbar-./static-top site-nav" role="navigation"> 
     <div class="container"> 
      <!-- Contact info --> 
      <ul class="nav navbar-nav site-nav-sns"> 
       <li class="site-nav-sns-phone"><span class="navbar-text">客服热线：400-921-9218</span></li> 
       <li> <a href="#" class="icon-sns qq"> 
         <div class="social-content"> 
          <p class="social-title">点融网官方QQ群</p> 
          <p>141444867</p> 
         </div> </a> </li> 
       <li> <a href="http://weibo.com/dianrongwang" target="_blank" class="icon-sns weibo" rel="nofollow"></a> </li> 
       <li> <a href="#" class="icon-sns wechat"> 
         <div class="social-content"> 
          <p class="social-title">扫描关注微信公众号</p> 
          <p><img src="./static/images/qr-code.jpg" /></p>
         </div> </a> </li> 
      </ul> 
      <!-- For non-login users --> 
      <ul id="nonLoginBar" class="nav navbar-nav navbar-right navbar-sm site-nav-login"> 
       <li><a id="login-panel" href="login.jsp" rel="nofollow">登录</a></li>
       <li><a id="create-account" href="reg.jsp" class="btn btn-sm" rel="nofollow">注册账户</a></li>
      </ul> 
      <!-- For login users --> 
      <ul class="nav navbar-nav navbar-right navbar-sm site-nav-user ng-cloak" ng-if="isAuthenticated()"> 
       <!-- Shopping Cart Widget --> 
       <li ng-show="hasRole('LENDER')" class="dropdown shopping-cart-widget" ng-controller="CartSummaryCtrl"> 
        <!-- Shopping Cart Widget: Not yet invested --> 
        <ul class="dropdown-menu" ng-show="cart.amountSum==0"> 
         <li class="shopping-cart-empty"> <p>你还没有投标，查看<a href="market.jsp">热投项目</a>，立即开启投资之旅！</p> </li>
        </ul> 
        <!-- Shopping Cart Widget: Invested --> 
        <ul class="dropdown-menu" ng-show="cart.amountSum!= 0" ng-controller="CartCtrl"> 
         <li class="shopping-cart-title"> <span>投标 <strong>{{ cart.itemsCount }}笔</strong> </span> <span class="pull-right"> 总额<span ng-bind-html="cart.amountSum | slMoney"></span> </span> </li> 
         <li class="divider"></li> 
         <li ng-repeat="item in cart.items" class="shopping-cart-item" ng-mouseover="show=true" ng-mouseleave="show=false" ng-init="show=false"> <a href="#"> <span>{{item.loanTitle | slStringTruncate:18}}</span> <span ng-bind-html="item.amount | slMoney" ng-class="{hidden:show}"></span> <span data-toggle="modal" data-target="#deleteCartItem" class="sl-icon-trash hidden" ng-click="transId(item.loanId)" ng-class="{hidden:!show}"></span> </a> </li> 
         <li class="divider"></li> 
         <li class="shopping-cart-checkout"> <a id="checkout-shopping-cart" href="/market/checkout" class="btn btn-sm btn-primary btn-block btn-embossed">查看购物车</a> </li> 
        </ul> </li> 
       <!-- My Account Menu --> 
       <li class="dropdown"> <a href="member_info.jsp" class="dropdown-toggle hoverHeader" ng-show="session.firstLoaded &amp;&amp; session.actor.username" data-toggle="dropdown" data-hover="dropdown">素材火的账户 <b class="caret"></b></a>
        <ul class="dropdown-menu"> 
         <li><a href="member_info.jsp">我的账户</a></li>
         <li><a href="#" ng-click="logout()">退出</a></li> 
        </ul> </li> 
      </ul> 
     </div> 
    </nav> 
    <div class="site-menu"> 
     <div class="header-navbar-container sl-nav-wrapper header-nav-container"> 
      <nav class="navbar navbar-./static-top sl-navbar" role="navigation"> 
       <div class="container"> 
        <div class="navbar-header  col-xs-6"> 
         <button type="button" class="navbar-toggle"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button> 
         <a class="navbar-brand" href="index.jsp"> <span class="sl-logo">点融网 - DianRong</span> </a>
        </div> 
        <div class=" navbar-collapse navbar-ex1-collapse sl-nav"> 
         <ul class="nav navbar-nav main-menu navbar-right"> 
          <!--menus--> 
          <li class="main-link-list"> <a class="main-link" href="market.jsp"> <span class="main-link-text">我要投资</span> </a> </li>
          <li class="main-link-list"> <a class="main-link" href="borrow.jsp"> <span class="main-link-text">我要借款</span> </a> </li>
          <li class="main-link-list" ng-class="{active:isActive('/public/help-center')}"> <a class="main-link" href="help.jsp"> <span class="main-link-text">帮助中心</span> </a> </li>
          <li class="main-link-list"> <a class="main-link" href="about.jsp"> <span class="main-link-text">关于我们</span> </a> </li>
         </ul> 
        </div> 
        <!-- /.navbar-collapse --> 
       </div> 
      </nav> 
     </div> 
     <!--secondaryNav--> 
     <!--jumbotron--> 
    </div> 
   </header> 
   <div class="modal fade" id="deleteCartItem" tabindex="-1" role="dialog" aria-hidden="true"> 
    <div class="modal-dialog" ng-controller="CartCtrl"> 
     <div class="modal-content"> 
      <div class="modal-header"> 
       <button type="button" class="close sl-icon-cross" data-dismiss="modal" aria-hidden="true"></button> 
       <h6 class="modal-title">删除投标</h6> 
      </div> 
      <div class="modal-body"> 
       <h4>确定删除投标：ID{{selectedId}}？</h4> 
      </div> 
      <div class="modal-footer"> 
       <a class="btn btn-link" data-dismiss="modal">取消</a> 
       <a class="btn btn-action" ng-model="loanId" ng-click="removeNote()">删除</a> 
      </div> 
     </div> 
    </div> 
   </div> 
   <div id="notifications" ng-show="notify.messages.msg.length &gt; 0" class="ng-cloak affix-top" data-spy="affix" data-offset-top="0"> 
    <div class="container"> 
     <div class="msg-fold-up" ng-class="{ 'alert-success' : notify.messages.type == 'success', 'alert-danger' : notify.messages.type == 'error', 'alert-info' : notify.messages.type == 'info' }"> 
     </div> 
     <div class="alert msg-content"> 
      <a type="button" class="close sl-icon-cross" ng-click="notify.dismiss($index)" aria-hidden="true"></a> 
      <p ng-repeat="m in notify.messages.msg track by $index" ng-bind-html="m"></p> 
     </div> 
     <div class="msg-fold-down" ng-class="{ 'alert-success' : notify.messages.type == 'success', 'alert-danger' : notify.messages.type == 'error', 'alert-info' : notify.messages.type == 'info' }"> 
     </div> 
    </div> 
   </div> 
   <!--content--> 
   <!-- This empty div is a placehodler to avoid extra spaces between content area and the affix header --> 
   <div style="height: 1px;"></div> 
   <div id="my-account" class="container my-account" ng-controller="MyAccountCtrl"> 
    <div class="row"> 
     <nav class="summary-nav col-xs-3 &lt;!--hidden-sm hidden-xs--&gt;" id="summary-nav"> 
      <header class="summary-nav-header"> 
       <div class="header-content-wrapper"> 
        <div class="avatar-row"> 
         <a href="index.jsp" class="profile-avatar">
            <img width="100%" ng-src="images/green-head.jpg" ng-clock="" src="./static/images/green-head.jpg">
         </a> 
         <!--<sl-avatar size="70" class="avatar"></sl-avatar>--> 
         <div class="profile"> 
          <h6 class="user-name ng-binding">
晚上好!
<p class="say-hi ng-binding">Member_11501404</p>
</h6>
         </div> 
        </div> 
        <div class="header-row"> 
         <label>安全等级</label> 
         <span class="white" ng-bind="basicProfile.securityText">中</span> 
         <a href="member_info.jsp" class="manage-security">管理</a>
        </div> 
       </div> 
      </header> 
      <section class="summary-nav-body"> 
       <!-- My Account Nav --> 
       <ul class="nav nav-list"> 
        <li class="divider"></li> 
        <li class="nav-header">我的账户</li> 
        <li> <a href="member_index.jsp"><span class="sl-icon-account"></span>账户总览</a> </li>
        <li><a href='member_info.jsp'><span class="sl-icon-profile"></span>基本信息</a> </li>
        <li class="divider"></li> 
        <li class="nav-header">我的投资</li> 
        <li><a href='member_tuan.jsp'><span class="sl-icon-agreement"></span>团团赚</a> </li>
        <li ng-class="{active:isTabActive('invest-history')}"> <a href='member_bid_record.jsp'><span class="sl-icon-details-more"></span>投标记录</a> </li>
        <li class="active"> <a href='member_bid_auto.jsp'><span class="sl-icon-dart"></span>自动投标</a> </li>
        <li ng-class="{active:isTabActive('trade-history')}"> <a href='member_trade.jsp'><span class="sl-icon-tutorial"></span>交易记录</a> </li>
        <li class="divider"></li> 
        <li class="nav-header">账户管理</li> 
        <li ng-class="{active:isTabActive('transfer')}"> <a href='member_pay.jsp'><span class="sl-icon-piggy-bank"></span>充值提现</a> </li>
        <li ng-class="{active:isTabActive('bank-cards')}"> <a href='member_bank.jsp'><span class="sl-icon-credit-card"></span>银行卡管理</a> </li>
        <li class="divider"></li> 
        <li class="nav-header">资讯中心</li>
        <li> <a href='member_invite.jsp'><span class="sl-icon-branch"></span>友情邀请</a> </li>
       </ul> 
      </section> 
     </nav> 
     <div class="col-xs-9 ng-scope" autoscroll="false" ui-view="" style="">
<div class="auto-invest content-wrapper ng-scope">
<header class="section-header">
<h6 class="section-header-title">自动投标</h6>
</header>
<section class="summary-section">
<div class="row">
<div class="col-xs-8">
<div class="tip-wrapper">
<header class="header">
<h6 class="header-label">自动投标工具说明</h6>
</header>
<div>
<ul class="my-account-tip">
<li>
<p>当符合条件的自动投标金额总额大于当前可投标金额时,系统会自动开启公平的排队系统。</p>
</li>
<li>
<p>为严格保护出资人利益,系统会指定每笔自动投标对于贷款总额的百分比上限,以分散风险,获得更高收益。</p>
</li>
<li>
<p>自动投标为免费业务，点融网不收取任何附加费用。</p>
</li>
</ul>
</div>
</div>
</div>
<div class="col-xs-4">
<div class="status-wrapper">
<div id="auto-switch-wrapper" class="switch switch-square">
<div class="bootstrap-switch bootstrap-switch-wrapper bootstrap-switch-off bootstrap-switch-large bootstrap-switch-animate bootstrap-switch-id-auto-switch">
<div class="bootstrap-switch-container">
<span class="bootstrap-switch-handle-on bootstrap-switch-primary">开启状态</span>
<label class="bootstrap-switch-label" for="auto-switch">开启自动投标</label>
<span class="bootstrap-switch-handle-off bootstrap-switch-default">关闭状态</span>
<input id="auto-switch" type="checkbox" data-off-text="关闭状态" data-on-text="开启状态" data-size="large">
</div>
</div>
</div>
<div class="balance-sheet">
<h4 class="highlighted-sum available-cash ng-binding" ng-bind-html="cart.availableToInvest|slMoney">
0
<small>.00元</small>
</h4>
<p class="highlighted-sum-caption">可用余额</p>
<a class="btn btn-secondary btn-embossed" href="member_pay.jsp">
<span class="sl-icon-piggy-bank"></span>
充值
</a>
</div>
</div>
</div>
</div>
</section>
<section class="summary-section section-block ng-hide" ng-show="form.enabled">
<ul class="nav nav-tabs make-left">
<li class="active">
<a id="invest-tool-a" data-toggle="tab" href="#advanced-invest-tool">自动投标设置</a>
</li>
</ul>
<div class="tab-content">
<div id="advanced-invest-tool" class="tab-pane active">
<div class="auto-invest-option row">
<div class="col-xs-2 text-right">
<label>投资金额区间</label>
</div>
<div class="col-xs-9">
<div id="amount-range" class="amount-range ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false">
<div class="ui-slider-range ui-widget-header ui-corner-all" style="left: 0%; width: 100%;">
<div class="range-bg"></div>
<div class="slider-tip tip-left hidden"></div>
<div class="slider-tip tip-right hidden"></div>
</div>
<a class="ui-slider-handle ui-state-default ui-corner-all left" href="" style="left: 0%;"></a>
<a class="ui-slider-handle ui-state-default ui-corner-all right" href="" style="left: 100%;"></a>
</div>
</div>
</div>
<div class="auto-invest-option row">
<div class="col-xs-2 text-right">
<label>风险利率</label>
</div>
<div class="col-xs-9">
<div id="rate-range" class="rate-range ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false">
<div class="ui-slider-range ui-widget-header ui-corner-all slider-grade-range" style="left: 0%; width: 100%;">
<div class="range-bg"></div>
<div class="slider-tip tip-left hidden"></div>
<div class="slider-tip tip-right hidden"></div>
</div>
<a class="ui-slider-handle ui-state-default ui-corner-all left" href="" style="left: 0%;"></a>
<a class="ui-slider-handle ui-state-default ui-corner-all right" href="" style="left: 100%;"></a>
</div>
<div class="grade-legend">
<ul class="list-inline list-unstyled">
<li class="legend-a">A</li>
<li class="legend-b">B</li>
<li class="legend-c">C</li>
<li class="legend-d">D</li>
<li class="legend-e">E</li>
<li class="legend-f">F</li>
</ul>
</div>
</div>
</div>
<div class="auto-invest-option row">
<div class="col-xs-2 text-right">
<label>借款期限</label>
</div>
<div class="col-xs-9">
<div id="term-range" class="term-range ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false">
<div class="ui-slider-range ui-widget-header ui-corner-all ui-slider-range-min" style="width: 100%;"></div>
<a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 100%;">
<span class="left-arrow"></span>
<span class="text">24个月</span>
<span class="right-arrow"></span>
</a>
</div>
</div>
</div>
<div id="loan-type-option" class="auto-invest-option row">
<div class="col-xs-2 text-right">
<label>投资类型</label>
</div>
<div class="col-xs-9">
<div>
<label class="radio checked">
<span class="icons">
<span class="first-icon sl-icon-radio-unchecked"></span>
<span class="second-icon sl-icon-radio-checked"></span>
</span>
<input type="radio" checked="" data-toggle="radio" value="" name="loanType">
所有
</label>
<label class="radio">
<span class="icons">
<span class="first-icon sl-icon-radio-unchecked"></span>
<span class="second-icon sl-icon-radio-checked"></span>
</span>
<input type="radio" data-toggle="radio" value="BUSINESS" name="loanType">
商业
</label>
<label class="radio">
<span class="icons">
<span class="first-icon sl-icon-radio-unchecked"></span>
<span class="second-icon sl-icon-radio-checked"></span>
</span>
<input type="radio" data-toggle="radio" value="PERSONAL" name="loanType">
个人
</label>
</div>
</div>
</div>
<div id="repayment-method-option" class="auto-invest-option row">
<div class="col-xs-2 text-right">
<label>还款方式</label>
</div>
<div class="col-xs-9">
<div>
<label class="radio checked">
<span class="icons">
<span class="first-icon sl-icon-radio-unchecked"></span>
<span class="second-icon sl-icon-radio-checked"></span>
</span>
<input type="radio" checked="" data-toggle="radio" value="" name="paymentMode">
所有
</label>
<label class="radio">
<span class="icons">
<span class="first-icon sl-icon-radio-unchecked"></span>
<span class="second-icon sl-icon-radio-checked"></span>
</span>
<input type="radio" data-toggle="radio" value="AMORTIZED" name="paymentMode">
等额本息
</label>
<label class="radio">
<span class="icons">
<span class="first-icon sl-icon-radio-unchecked"></span>
<span class="second-icon sl-icon-radio-checked"></span>
</span>
<input type="radio" data-toggle="radio" value="NOT_AMORTIZED" name="paymentMode">
每月还息，按期还本
</label>
</div>
</div>
</div>
<div id="pernote-input" class="auto-invest-option row">
<div class="col-xs-2 text-right">
<label>每笔投资金额</label>
</div>
<div class="col-xs-4">
<input class="form-control input-sm ng-pristine ng-valid" type="text" ng-model="advancedForm.maxPerLoan">
<span class="input-icon">元</span>
</div>
<div class="col-xs-6"> </div>
</div>
<div id="min-balance-input" class="auto-invest-option row">
<div class="col-xs-2 text-right">
<label>账户保留金额</label>
</div>
<div class="col-xs-4">
<input class="form-control input-sm ng-pristine ng-valid" type="text" ng-model="advancedForm.minBalance">
<span class="input-icon">元</span>
</div>
<div class="col-xs-6">
<small class="common-color"> 当你账户的可投资金额大于这个金额时，自动投资才会生效 </small>
</div>
</div>
<div class="auto-invest-option row">
<div class="col-xs-11 text-right">
<a class="btn btn-primary" ng-click="advancedSubmit()">保存</a>
</div>
</div>
</div>
</div>
</section>
<div id="auto-invest-switch" class="modal fade" aria-hidden="true" role="dialog" tabindex="-1">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button class="close sl-icon-cross" aria-hidden="true" data-dismiss="modal" type="button"></button>
<h6 id="myModalLabel" class="modal-title">关闭自动投标</h6>
</div>
<div class="modal-body">
<div class="modal-wrapper">
<div class="summary-section">
<p>自动投标可以帮助你更有效率的进行投资</p>
<h4 class="switch-confirm">确定关闭自动投标功能？</h4>
</div>
</div>
</div>
<div class="modal-footer">
<a class="btn btn-link" ng-click="closeModal()">取消</a>
<a class="btn btn-primary" ng-click="disableTool()">确定</a>
</div>
</div>
</div>
</div>
</div>
</div>
    </div> 
    <div class="modal fade" id="newUserModal" tabindex="-1" role="dialog" aria-hidden="true"> 
     <div class="modal-dialog"> 
      <div class="modal-content"> 
       <div class="modal-body"> 
        <button type="button" class="close sl-icon-cross" data-dismiss="modal" aria-hidden="true"></button> 
        <div class="new-user-title text-center"> 
         <img src="./static/images/new-user-title.png" />
        </div> 
        <div class="row new-user-wrapper"> 
         <div class="col-xs-4 col-xs-offset-1 new-user-text text-center"> 
          <h2 ng-show="!fromLC">一手消息</h2> 
          <h2 ng-show="!fromLC">马上掌握</h2> 
          <div class="bg-new-share-wel" ng-show="fromLC"></div> 
          <div class="info-new-share text-center" ng-show="fromLC">
           14%预期年化收益率 只给首次投资的你哦
          </div> 
          <div class="btn-invest" ng-show="fromLC">
           <a class="btn  btn-action" href="index.html" ng-click="linkToRecharge()">立即充值投资</a>
          </div> 
          <div ng-show="!fromLC">
           <a class="btn btn-block btn-action" href="market.jsp" target="_blank">立即投资</a>
          </div> 
         </div> 
         <div class="col-xs-5 col-xs-offset-1 qr"> 
          <img src="./static/images/qr-sub.png" />
          <p>立即扫描或搜索&quot;dianrongapi&quot;</p> 
          <p>关注点融网官方微信</p> 
         </div> 
        </div> 
        <div class="new-user-footer hidden"> 
         <img src="./static/images/new-user-footer.png" />
        </div> 
       </div> 
      </div> 
     </div> 
    </div> 
   </div> 
   <!--footer--> 
   <div class="bottom-menu bottom-menu-large bottom-menu-inverse sl-footer open-bottom footer-animate  footer-navbar"> 
    <div class="container inside-container"> 
     <div class="row"> 
      <div class="col-xs-4" ng-cloak=""> 
       <div class="navbar-brand">
        <a href="#"><i class="image-sprites logo"></i></a>
       </div> 
       <ul class="bottom-icons social-icons"> 
        <li><a href="#" data-toggle="modal" data-target="#myModal" rel="nofollow"><span class="sl-icon-wechat"></span></a></li> 
        <li><a href="http://weibo.com/dianrongwang" target="_blank" rel="nofollow"><span class="sl-icon-weibo"></span></a></li> 
       </ul> 
       <div class="support-phone"> 
        <span class="phone">咨询电话</span> 
        <h4 class="number">400-921-9218</h4> 
       </div> 
      </div> 
      <div class="col-xs-7 col-xs-offset-1"> 
       <div class="row site-map"> 
        <div class="col-xs-4"> 
         <h6 class="title footer-home">公司信息</h6> 
         <ul class="bottom-links"> 
          <li><a href="/public/about#/company">公司简介</a></li> 
          <li><a href="/public/about#/news">最新动态</a></li> 
          <li><a href="/public/about#/media">媒体报道</a></li> 
          <li><a href="/public/about#/job">招贤纳士</a></li> 
          <li><a href="/public/about#/contact">联系我们</a></li> 
          <li><a href="/blog/devBlog">点融新享</a></li> 
         </ul> 
        </div> 
        <div class="col-xs-4"> 
         <h6 class="title footer-policy">相关政策</h6> 
         <ul class="bottom-links"> 
          <li><a href="/public/rates-and-fees" target="_blank">费率说明</a></li> 
          <li><a href="/public/principal-protection" target="_blank">本金保障</a></li> 
          <li><a href="/public/terms-of-use" target="_blank">使用条款</a></li> 
          <li><a href="/public/terms-of-use?protocol=privacy-and-security" target="_blank">隐私保护</a></li> 
         </ul> 
        </div> 
        <div class="col-xs-4"> 
         <h6 class="title footer-mobile">手机应用</h6> 
         <ul class="bottom-links"> 
          <li><a href="https://itunes.apple.com/us/app/dian-rong-wang/id725186555?mt=8" target="_blank" ga-event="" ga-category="iosAppLink" ga-action="click" ga-label="footer" ga-value="trackValue" rel="nofollow">iPhone版下载</a></li> 
          <li><a href="http://app.mi.com/detail/56106" target="_blank" ga-event="" ga-category="androidAppLink" ga-action="click" ga-label="footer" ga-value="trackValue" rel="nofollow">Android版下载（测试版）</a></li> 
         </ul> 
         <div class="wechat" ng-cloak=""> 
          <i class="image-sprites qr-code"></i> 
          <div class="description"> 
           <span class="name">微信公众号</span> 
           <span>点融网</span> 
          </div> 
         </div> 
        </div> 
       </div> 
      </div> 
     </div> 
    </div> 
    <div class="friend-links"> 
     <div class="container"> 
      <div class="col-xs-2"> 
       <p><span class="sl-icon-branch"></span>友情链接</p> 
      </div> 
      <div class="col-xs-10"> 
       <a href="http://iof.hexun.com/" target="_blank">和讯互联网金融</a> 
       <a href="http://licai.cofool.com/" target="_blank">叩富理财 </a> 
       <a href="http://www.jinfuzi.com/p2p/" target="_blank">金斧子理财</a> 
       <a href="http://www.trustores.cn" target="_blank">香港保险</a> 
       <a href="http://www.asiafinance.cn" target="_blank">金融导航</a> 
       <a href="http://www.fxsol-uk.com" target="_blank">Fxsol官网</a> 
       <a href="http://www.guijinshu.com" target="_blank">贵金属</a> 
       <a href="http://www.dingniugu.com" target="_blank">顶牛股网</a> 
       <a href="http://www.ucai123.com" target="_blank">航运指数</a> 
       <a href="http://www.szjstz.cn/" target="_blank">金苏财富</a> 
       <a href="http://www.myfund.com/" target="_blank">展恒基金</a> 
       <a href="http://www.dianrong.com/caifu/" target="_blank">P2P理财</a> 
      </div> 
     </div> 
    </div> 
    <div class="container inside-container"> 
     <div class="credit" style="margin-top: 0;padding-top: 20px;"> 
      <div class="navbar copyright"> 
       <ul class="nav navbar-nav"> 
        <li>&copy;2015 点融网</li> 
        <li>沪ICP备14028311号</li> 
        <li>上海点荣金融信息服务有限责任公司</li> 
       </ul> 
      </div> 
      <div class="authentication-info"> 
       <a target="_blank" href="https://trustsealinfo.verisign.com/splash?form_file=fdf/splash.fdf&amp;dn=www.dianrong.com&amp;lang=zh_cn" rel="nofollow"><i class="image-sprites norton-logo"></i></a> 
       <a id="__szfw_logo__" href="https://search.szfw.org/cert/l/CX20150107006323006821" target="_blank"><i class="image-sprites credit-logo"></i></a> 
      <a target="_blank" href="http://www.itrust.org.cn/yz/pjwx.asp?wm=1062547634" rel="nofollow"><i class="image-sprites itrust-logo"></i></a> 
      </div> 
     </div> 
    </div> 
   </div> 
   <!-- Modal --> 
   <div class="modal fade wechat-modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
    <div class="modal-dialog modal-sm"> 
     <div class="modal-content"> 
      <div class="modal-header"> 
       <button type="button" class="close sl-icon-cross" data-dismiss="modal" aria-hidden="true"></button> 
       <h6 class="modal-title" id="myModalLabel">关注点融网官方微信</h6> 
      </div> 
      <div class="modal-body"> 
       <div class="wechat-subscription"> 
        <h6>点融网订阅号</h6> 
        <p>了解各种点融咨询</p> 
        <img src="./static/images/qrcode-dianrongapi.jpg" alt="点融网订阅号" />
        <p>dianrongapi</p> 
       </div> 
       <div class="wechat-service"> 
        <h6>点融网服务号</h6> 
        <p>查询投资情况</p> 
        <img src="./static/images/qrcode-dianrongvip.jpg" alt="点融网服务号" />
        <p>dianrongvip</p> 
       </div> 
      </div> 
      <div class="modal-footer">
        添加方式：打开微信，点击″发现″菜单，使用″扫一扫″功能；或者在微信中点击&quot;联系人&quot;，添加以上英文账号名为好友。 
      </div> 
     </div>
     <!-- /.modal-content --> 
    </div>
    <!-- /.modal-dialog --> 
   </div>
   <!-- /.modal --> 
  </div> 
 </body>
</html>