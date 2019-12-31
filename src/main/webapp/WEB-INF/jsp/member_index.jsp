<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html dir="ltr" lang="zh-CN" xml:lang="zh-CN">
 <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <meta name="description" content="点融网为广大个人和微小企业提供便利的投融资服务。借款产品灵活、大额、费用低、手续快；投资方式人性友好、回报高、百分百本金保护！Dianrong.com provides online efficient investment and financing services for individuals and SMEs. Better rates, lower cost, faster way to borrowers and more flexible investment, higher returns, 100% principal protection to investors." /> 
  <meta name="keywords" content="P2P网贷,P2P网络贷款平台,P2P网络投资平台,P2P投资理财平台,网络贷款平台,团团赚,点融,点融网,点融官网" /> 
  <link rel="shortcut icon" href="static/images/favicon.ico" />
  <title>账户总览-member_index.html</title> 
  <link href="static/css/bootstrap.min.css" rel="stylesheet" />
  <link href="static/css/components.css?ver=142682356" rel="stylesheet" />
  <link href="static/css/main.css?ver=142682356" rel="stylesheet" />
  <link href="static/css/new-home.css?ver=142682356" rel="stylesheet" />
  <style type="text/css">
    @media (min-width: 992px) {
      @font-face {
        font-family: 'proxima-nova';
        src: url('static/fonts/proximanova-regular-webfont.eot');
        src: url('static/fonts/proximanova-regular-webfont.eot?#iefix') format('embedded-opentype'),
          url('static/fonts/proximanova-regular-webfont.woff') format('woff'),
          url('static/fonts/proximanova-regular-webfont.ttf') format('truetype');
        font-weight: normal;
        font-style: normal;
      }

      @font-face {
        font-family: 'proxima-nova';
        src: url('static/fonts/proximanova-bold-webfont.eot');
        src: url('static/fonts/proximanova-bold-webfont.eot?#iefix') format('embedded-opentype'),
          url('static/fonts/proximanova-bold-webfont.woff') format('woff'),
          url('static/fonts/proximanova-bold-webfont.ttf') format('truetype');
        font-weight: bold;
        font-style: normal;
      }
    }
  </style> 
  <!-- Add support for bootstrap in IE8 --> 
  <!--[if lt IE 9]>
  <link href="static/css/ie8.css?ver=142682356" rel="stylesheet">
  <![endif]--> 
  <!--[if IE 9]>
  <link href="static/css/ie9.css?ver=142682356" rel="stylesheet">
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
    <nav class="navbar navbar-inverse navbar-static-top site-nav" role="navigation"> 
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
          <p><img src="static/images/qr-code.jpg" /></p>
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
      <nav class="navbar navbar-static-top sl-navbar" role="navigation"> 
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
          <li class="main-link-list" ng-class="{active:isActive('/public/help-center')}"> <a class="main-link" href="help.html"> <span class="main-link-text">帮助中心</span> </a> </li> 
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
         <a href="index.html" class="profile-avatar"> 
            <img width="100%" ng-src="images/green-head.jpg" ng-clock="" src="static/images/green-head.jpg">
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
        <li class="active"> <a href="member_index.jsp"><span class="sl-icon-account"></span>账户总览</a> </li>
        <li><a href='member_info.jsp'><span class="sl-icon-profile"></span>基本信息</a> </li>
        <li class="divider"></li> 
        <li class="nav-header">我的投资</li> 
        <li><a href='member_tuan.jsp'><span class="sl-icon-agreement"></span>团团赚</a> </li>
        <li ng-class="{active:isTabActive('invest-history')}"> <a href='member_bid_record.jsp'><span class="sl-icon-details-more"></span>投标记录</a> </li>
        <li ng-class="{active:isTabActive('auto-invest')}"> <a href='member_bid_auto.jsp'><span class="sl-icon-dart"></span>自动投标</a> </li>
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
<div class="account-summary content-wrapper ng-scope">
<section class="row simple-summary">
<div class="col-xs-7 simple-summary-section total-net-income">
<div id="column-chart" class="total-interest">
<div class="text-center ng-hide" ng-show="!gotSummary">
<h4 class="loading-animation summary-loading">
<i class="spinner sl-icon-loading"></i>
</h4>
</div>
<div class="monthly-income" ng-show="gotSummary">
<ul class="list-inline monthly-income-bars" ng-class="{invisible:loadingColumn}">
<li class="every-month ng-scope" ng-style="{left:m.left}" ng-class="{noMargin:$last}" ng-repeat="m in monthlyIncome" style="left: 0px;">
<a ng-style="{width:m.width,height:m.height}" href="" style="width: 33.9167px; height: 8px;">
<div class="income-info">
<span class="ng-binding">2014-04净收入</span>
<br>
<span class="ng-binding" ng-bind="m.interest | slCurrency">0.00元</span>
</div>
</a>
</li>
<li class="every-month ng-scope" ng-style="{left:m.left}" ng-class="{noMargin:$last}" ng-repeat="m in monthlyIncome" style="left: 38.9167px;">
<a ng-style="{width:m.width,height:m.height}" href="" style="width: 33.9167px; height: 8px;">
<div class="income-info">
<span class="ng-binding">2014-05净收入</span>
<br>
<span class="ng-binding" ng-bind="m.interest | slCurrency">0.00元</span>
</div>
</a>
</li>
<li class="every-month ng-scope" ng-style="{left:m.left}" ng-class="{noMargin:$last}" ng-repeat="m in monthlyIncome" style="left: 77.8333px;">
<a ng-style="{width:m.width,height:m.height}" href="" style="width: 33.9167px; height: 8px;">
<div class="income-info">
<span class="ng-binding">2014-06净收入</span>
<br>
<span class="ng-binding" ng-bind="m.interest | slCurrency">0.00元</span>
</div>
</a>
</li>
<li class="every-month ng-scope" ng-style="{left:m.left}" ng-class="{noMargin:$last}" ng-repeat="m in monthlyIncome" style="left: 116.75px;">
<a ng-style="{width:m.width,height:m.height}" href="" style="width: 33.9167px; height: 8px;">
<div class="income-info">
<span class="ng-binding">2014-07净收入</span>
<br>
<span class="ng-binding" ng-bind="m.interest | slCurrency">0.00元</span>
</div>
</a>
</li>
<li class="every-month ng-scope" ng-style="{left:m.left}" ng-class="{noMargin:$last}" ng-repeat="m in monthlyIncome" style="left: 155.667px;">
<a ng-style="{width:m.width,height:m.height}" href="" style="width: 33.9167px; height: 8px;">
<div class="income-info">
<span class="ng-binding">2014-08净收入</span>
<br>
<span class="ng-binding" ng-bind="m.interest | slCurrency">0.00元</span>
</div>
</a>
</li>
<li class="every-month ng-scope" ng-style="{left:m.left}" ng-class="{noMargin:$last}" ng-repeat="m in monthlyIncome" style="left: 194.583px;">
<a ng-style="{width:m.width,height:m.height}" href="" style="width: 33.9167px; height: 8px;">
<div class="income-info">
<span class="ng-binding">2014-09净收入</span>
<br>
<span class="ng-binding" ng-bind="m.interest | slCurrency">0.00元</span>
</div>
</a>
</li>
<li class="every-month ng-scope" ng-style="{left:m.left}" ng-class="{noMargin:$last}" ng-repeat="m in monthlyIncome" style="left: 233.5px;">
<a ng-style="{width:m.width,height:m.height}" href="" style="width: 33.9167px; height: 8px;">
<div class="income-info">
<span class="ng-binding">2014-10净收入</span>
<br>
<span class="ng-binding" ng-bind="m.interest | slCurrency">0.00元</span>
</div>
</a>
</li>
<li class="every-month ng-scope" ng-style="{left:m.left}" ng-class="{noMargin:$last}" ng-repeat="m in monthlyIncome" style="left: 272.417px;">
<a ng-style="{width:m.width,height:m.height}" href="" style="width: 33.9167px; height: 8px;">
<div class="income-info">
<span class="ng-binding">2014-11净收入</span>
<br>
<span class="ng-binding" ng-bind="m.interest | slCurrency">0.00元</span>
</div>
</a>
</li>
<li class="every-month ng-scope" ng-style="{left:m.left}" ng-class="{noMargin:$last}" ng-repeat="m in monthlyIncome" style="left: 311.333px;">
<a ng-style="{width:m.width,height:m.height}" href="" style="width: 33.9167px; height: 8px;">
<div class="income-info">
<span class="ng-binding">2014-12净收入</span>
<br>
<span class="ng-binding" ng-bind="m.interest | slCurrency">0.00元</span>
</div>
</a>
</li>
<li class="every-month ng-scope" ng-style="{left:m.left}" ng-class="{noMargin:$last}" ng-repeat="m in monthlyIncome" style="left: 350.25px;">
<a ng-style="{width:m.width,height:m.height}" href="" style="width: 33.9167px; height: 8px;">
<div class="income-info">
<span class="ng-binding">2015-01净收入</span>
<br>
<span class="ng-binding" ng-bind="m.interest | slCurrency">0.00元</span>
</div>
</a>
</li>
<li class="every-month ng-scope" ng-style="{left:m.left}" ng-class="{noMargin:$last}" ng-repeat="m in monthlyIncome" style="left: 389.167px;">
<a ng-style="{width:m.width,height:m.height}" href="" style="width: 33.9167px; height: 8px;">
<div class="income-info">
<span class="ng-binding">2015-02净收入</span>
<br>
<span class="ng-binding" ng-bind="m.interest | slCurrency">0.00元</span>
</div>
</a>
</li>
<li class="every-month ng-scope noMargin" ng-style="{left:m.left}" ng-class="{noMargin:$last}" ng-repeat="m in monthlyIncome" style="left: 428.083px;">
<a ng-style="{width:m.width,height:m.height}" href="" style="width: 33.9167px; height: 8px;">
<div class="income-info">
<span class="ng-binding">月净收入</span>
<br>
<span class="ng-binding" ng-bind="m.interest | slCurrency">0.00元</span>
</div>
</a>
</li>
<div class="sum-number inside-column">
<h3 class="highlighted-sum">
<abbr class="ng-binding ng-scope" ng-bind-html="summary.interestReceived|slMoney" tooltip-placement="right" tooltip="=已收利息+已收罚息" title="">
0
<small>.00元</small>
</abbr>
</h3>
<p class="highlighted-sum-caption">累计净收益</p>
</div>
</ul>
</div>
</div>
</div>
<div class="col-xs-5 simple-summary-section balance-sheet">
<div class="text-center ng-hide" ng-show="!gotSummary">
<h4 class="loading-animation summary-loading">
<i class="spinner sl-icon-loading"></i>
</h4>
</div>
<div class="sum-number" ng-show="gotSummary">
<h3 class="highlighted-sum ng-binding" ng-bind-html="summary.availableCash|slMoney">
0
<small>.00元</small>
</h3>
<p class="highlighted-sum-caption">可用余额</p>
<a class="btn btn-secondary btn-embossed" href="member_pay.jsp">
<span class="sl-icon-piggy-bank"></span>
充值
</a>
</div>
</div>
</section>
<section class="summary-section my-asset">
<div class="asset-content">
<div class="ng-scope" ng-if="gotSummary">
<div class="asset-chart">
<div id="asset-chart" data-highcharts-chart="0">
<div id="highcharts-0" class="highcharts-container asset-chart-div" style="position: relative; overflow: hidden; width: 300px; height: 300px; text-align: left; line-height: normal; z-index: 0; font-family: "Lucida Grande","Lucida Sans Unicode",Verdana,Arial,Helvetica,sans-serif; font-size: 12px; left: 0.633301px; top: 0px;">
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="300" height="300">
<desc>Created with Highcharts 3.0.9</desc>
<defs>
<clipPath id="highcharts-1">
<rect fill="none" x="0" y="0" width="280" height="275">
</clipPath>
</defs>
<rect rx="5" ry="5" fill="#FFFFFF" x="0" y="0" width="300" height="300">
<g class="highcharts-series-group" zIndex="3">
<g class="highcharts-series highcharts-tracker" visibility="visible" zIndex="0.1" transform="translate(10,10) scale(1 1)" style="">
<path fill="#ff9311" d="M 139.97403166652887 10.000002644526859 A 127.5 127.5 0 0 1 267.4999362500053 137.37250002125 L 252.7999436000047 137.3872000188 A 112.8 112.8 0 0 0 139.9770256626232 24.70000233962847 Z" stroke="#FFFFFF" stroke-width="1" stroke-linejoin="round" transform="translate(0,0)" visibility="visible">
<path fill="#141d26" d="M 267.5 137.5 A 127.5 127.5 0 0 1 29.645175264213577 201.35971075360317 L 42.36843741022189 193.9970617490701 A 112.8 112.8 0 0 0 252.8 137.5 Z" stroke="#FFFFFF" stroke-width="1" stroke-linejoin="round" transform="translate(0,0)" visibility="visible">
<path fill="#0dba8f" d="M 29.581370741511023 201.24932401740716 A 127.5 127.5 0 0 1 139.82290505789587 10.000122990720172 L 139.84332306298552 24.700108810613614 A 112.8 112.8 0 0 0 42.311989173666234 193.89940195422372 Z" stroke="#FFFFFF" stroke-width="1" stroke-linejoin="round" transform="translate(0,0)" visibility="visible">
</g>
<g class="highcharts-markers" visibility="visible" zIndex="0.1" transform="translate(10,10) scale(1 1)">
</g>
<g class="highcharts-legend" zIndex="7">
<rect rx="5" ry="5" fill="none" x="0.5" y="0.5" width="7" height="7" stroke="#909090" stroke-width="1" visibility="hidden">
<g zIndex="1">
<g>
</g>
</g>
</svg>
</div>
</div>
<div class="con-top con-top-a loaded" ng-class="{loaded:loaded}">
<div class="top">
<span class="text">可用余额</span>
<span class="value ng-binding" ng-bind-html="summary.availableCash | slMoney" title="0.00元">
0
<small>.00元</small>
</span>
</div>
<div>
<a class="link" href="market.jsp">查看热投项目</a>
<a class="link" href="#/auto-invest">设置自动投标</a>
</div>
</div>
<div class="con-top con-top-b loaded" ng-class="{loaded:loaded}">
<div class="top">
<span class="text">冻结金额</span>
<span class="value ng-binding" ng-bind-html="summary.inFundingAmount | slMoney" title="0.00元">
0
<small>.00元</small>
</span>
</div>
<div>
<a class="link" href="#/invest-history?sub=bidding">查看正在投标项目</a>
</div>
</div>
<div class="con-top con-top-c loaded" ng-class="{loaded:loaded}">
<div class="top">
<span class="text">待收本金</span>
<span class="value ng-binding" ng-bind-html="chartSummary.OutstandingCash.value | slMoney" title="0">
0
<small>.00元</small>
</span>
</div>
<div>
<a class="link" href="#/invest-history">查看还款列表</a>
</div>
</div>
</div>
<div id="total-asset" class="total-asset text-center loaded" ng-class="{loaded:loaded}">
<h3 class="ng-binding" ng-bind-html="chartSummary.totalAssets|slMoney">
0
<small>.00元</small>
</h3>
<h6 class="text">总资产 </h6>
<a class="btn btn-sm btn-outline-primary view-statistics" data-target="#statisticsModal" data-toggle="modal" href="">投资统计</a>
</div>
<div class="date-widget">
<span class="plans">团团赚</span>
<div>
<span>持有</span>
<span class="periodNumber">
<a class="ng-binding" href="#/group-buy">0期</a>
</span>
</div>
</div>
</div>
</div>
</section>
<section class="summary-section asset-activity">
<header class="section-border"> </header>
<div class="alert alert-warning text-center ng-binding ng-hide" ng-show="!calLoaded && !calLoading"></div>
<div class="text-center ng-hide hidden" ng-show="calLoading" ng-class="{hidden:firstLoaded}">
<h4 class="loading-animation">
<i class="spinner sl-icon-loading"></i>
</h4>
</div>
<div class="tab-content" ng-class="{invisible:!firstLoaded}">
<div id="asset-activity" class="tab-pane active tab-activity">
<div class="row">
<div class="col-xs-5 calendarCol">
<div class="row day-events">
<div class="col-xs-6 no-events" ng-class="{'no-events':selectedDay.events.length == 0}">
<div class="text-center pager-tool">
<a class="glyphicon sl-icon-arrow-left left" ng-click="prevEvent()"></a>
<a class="glyphicon sl-icon-arrow-right right" ng-click="nextEvent()"></a>
</div>
<div id="calendar-day" class="calendar-day-container flip-clock-wrapper pull-left alt">
<h4>- 无资产活动! -</h4>
</div>
</div>
</div>
<div id="full-calendar" class="full-calendar fc fc-ltr">
<div class="fc-content" style="position: relative;">
<div class="fc-view fc-view-month fc-grid" style="position: relative; -moz-user-select: none;" unselectable="on">
<div class="fc-event-container" style="position:absolute;z-index:8;top:0;left:0"></div>
<table class="fc-border-separate" cellspacing="0" style="width:100%">
<thead>
<tr class="fc-first fc-last">
<th class="fc-day-header fc-sun fc-widget-header fc-first" style="width: 44px;">日</th>
<th class="fc-day-header fc-mon fc-widget-header" style="width: 44px;">一</th>
<th class="fc-day-header fc-tue fc-widget-header" style="width: 44px;">二</th>
<th class="fc-day-header fc-wed fc-widget-header" style="width: 44px;">三</th>
<th class="fc-day-header fc-thu fc-widget-header" style="width: 44px;">四</th>
<th class="fc-day-header fc-fri fc-widget-header" style="width: 44px;">五</th>
<th class="fc-day-header fc-sat fc-widget-header fc-last">六</th>
</tr>
</thead>
<tbody>
<tr class="fc-week fc-first">
<td class="fc-day fc-sun fc-widget-content fc-past fc-first" data-date="2015-03-01">
<div style="min-height: 34px;">
<div class="fc-day-number">1</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-mon fc-widget-content fc-past" data-date="2015-03-02">
<div>
<div class="fc-day-number">2</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-tue fc-widget-content fc-past" data-date="2015-03-03">
<div>
<div class="fc-day-number">3</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-wed fc-widget-content fc-past" data-date="2015-03-04">
<div>
<div class="fc-day-number">4</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-thu fc-widget-content fc-past" data-date="2015-03-05">
<div>
<div class="fc-day-number">5</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-fri fc-widget-content fc-past" data-date="2015-03-06">
<div>
<div class="fc-day-number">6</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-sat fc-widget-content fc-past fc-last" data-date="2015-03-07">
<div>
<div class="fc-day-number">7</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
</tr>
<tr class="fc-week">
<td class="fc-day fc-sun fc-widget-content fc-past fc-first" data-date="2015-03-08">
<div style="min-height: 33px;">
<div class="fc-day-number">8</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-mon fc-widget-content fc-past" data-date="2015-03-09">
<div>
<div class="fc-day-number">9</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-tue fc-widget-content fc-past" data-date="2015-03-10">
<div>
<div class="fc-day-number">10</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-wed fc-widget-content fc-past" data-date="2015-03-11">
<div>
<div class="fc-day-number">11</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-thu fc-widget-content fc-past" data-date="2015-03-12">
<div>
<div class="fc-day-number">12</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-fri fc-widget-content fc-past" data-date="2015-03-13">
<div>
<div class="fc-day-number">13</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-sat fc-widget-content fc-past fc-last" data-date="2015-03-14">
<div>
<div class="fc-day-number">14</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
</tr>
<tr class="fc-week">
<td class="fc-day fc-sun fc-widget-content fc-past fc-first" data-date="2015-03-15">
<div style="min-height: 33px;">
<div class="fc-day-number">15</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-mon fc-widget-content fc-past" data-date="2015-03-16">
<div>
<div class="fc-day-number">16</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-tue fc-widget-content fc-past" data-date="2015-03-17">
<div>
<div class="fc-day-number">17</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-wed fc-widget-content fc-past" data-date="2015-03-18">
<div>
<div class="fc-day-number">18</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-thu fc-widget-content fc-past" data-date="2015-03-19">
<div>
<div class="fc-day-number">19</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-fri fc-widget-content fc-past" data-date="2015-03-20">
<div>
<div class="fc-day-number">20</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-sat fc-widget-content fc-past fc-last" data-date="2015-03-21">
<div>
<div class="fc-day-number">21</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
</tr>
<tr class="fc-week">
<td class="fc-day fc-sun fc-widget-content fc-past fc-first" data-date="2015-03-22">
<div style="min-height: 33px;">
<div class="fc-day-number">22</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-mon fc-widget-content fc-past" data-date="2015-03-23">
<div>
<div class="fc-day-number">23</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-tue fc-widget-content fc-today fc-state-highlight" data-date="2015-03-24">
<div>
<div class="fc-day-number">24</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;">
<span class="tday">今天</span>
</div>
</div>
</div>
</td>
<td class="fc-day fc-wed fc-widget-content fc-future" data-date="2015-03-25">
<div>
<div class="fc-day-number">25</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-thu fc-widget-content fc-future" data-date="2015-03-26">
<div>
<div class="fc-day-number">26</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-fri fc-widget-content fc-future" data-date="2015-03-27">
<div>
<div class="fc-day-number">27</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-sat fc-widget-content fc-future fc-last" data-date="2015-03-28">
<div>
<div class="fc-day-number">28</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
</tr>
<tr class="fc-week">
<td class="fc-day fc-sun fc-widget-content fc-future fc-first" data-date="2015-03-29">
<div style="min-height: 33px;">
<div class="fc-day-number">29</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-mon fc-widget-content fc-future" data-date="2015-03-30">
<div>
<div class="fc-day-number">30</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-tue fc-widget-content fc-future" data-date="2015-03-31">
<div>
<div class="fc-day-number">31</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-wed fc-widget-content fc-other-month fc-future" data-date="2015-04-01">
<div>
<div class="fc-day-number">1</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-thu fc-widget-content fc-other-month fc-future" data-date="2015-04-02">
<div>
<div class="fc-day-number">2</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-fri fc-widget-content fc-other-month fc-future" data-date="2015-04-03">
<div>
<div class="fc-day-number">3</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-sat fc-widget-content fc-other-month fc-future fc-last" data-date="2015-04-04">
<div>
<div class="fc-day-number">4</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
</tr>
<tr class="fc-week fc-last">
<td class="fc-day fc-sun fc-widget-content fc-other-month fc-future fc-first" data-date="2015-04-05">
<div style="min-height: 34px;">
<div class="fc-day-number">5</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-mon fc-widget-content fc-other-month fc-future" data-date="2015-04-06">
<div>
<div class="fc-day-number">6</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-tue fc-widget-content fc-other-month fc-future" data-date="2015-04-07">
<div>
<div class="fc-day-number">7</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-wed fc-widget-content fc-other-month fc-future" data-date="2015-04-08">
<div>
<div class="fc-day-number">8</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-thu fc-widget-content fc-other-month fc-future" data-date="2015-04-09">
<div>
<div class="fc-day-number">9</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-fri fc-widget-content fc-other-month fc-future" data-date="2015-04-10">
<div>
<div class="fc-day-number">10</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
<td class="fc-day fc-sat fc-widget-content fc-other-month fc-future fc-last" data-date="2015-04-11">
<div>
<div class="fc-day-number">11</div>
<div class="fc-day-content">
<div style="position: relative; height: 0px;"> </div>
</div>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
<div class="calendar-footer text-center pager-tool">
<a class="glyphicon glyphicon-chevron-left" ng-click="prevMonth()"></a>
<span class="ng-binding" ng-bind="currentDate.year">2015</span>
<span>/</span>
<span class="ng-binding" ng-bind="currentDate.month">3</span>
<div class="input-group input-group-sm ng-isolate-scope" sl-popover="calendarPopoverMessage" data-original-title="" title="">
<span class="input-icon sl-icon-search" ng-class="{focus:calFocus}"></span>
<input class="input-sm form-control ng-pristine ng-valid" type="text" ng-blur="calFocus=false" ng-focus="calFocus=true" sl-enter="gotoCalendar()" ng-model="gotoDate">
</div>
<a class="glyphicon glyphicon-chevron-right" ng-click="nextMonth()"></a>
<span class="loading-animation common-color ng-hide" ng-show="!calLoaded">
<i class="spinner sl-icon-loading"></i>
</span>
</div>
</div>
<div class="col-xs-7 rightDetail">
<div class="space"></div>
<div class="col-xs-6 ng-hide" ng-hide="normalLoanlength == 0">
<div class="part">散标投资</div>
<div class="alignLeft"> </div>
<div>
<a class="view-event-details" ng-click="viewEventDay()" href="">查看详情</a>
</div>
</div>
<div class="col-xs-6 ng-hide" ng-hide="virtualLoanLength == 0">
<div class="part">团团赚</div>
<div class="alignLeft"> </div>
<div>
<a class="view-event-details" href="#/group-buyin">查看详情</a>
</div>
</div>
</div>
</div>
<div id="trade-history" class="tab-pane"></div>
</div>
</div>
</section>
<div>
<div id="statisticsModal" class="modal fade" aria-hidden="true" role="dialog" tabindex="-1">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button class="close sl-icon-cross" aria-hidden="true" data-dismiss="modal" type="button"></button>
<h4 id="myModalLabel" class="modal-title">投资统计</h4>
</div>
<div class="modal-body">
<div class="statistics-wrapper modal-wrapper">
<div class="row summary-section section-block fields">
<ul class="list-unstyled list-inline">
<li class="statistics-fields">
<h4 class="ng-binding" ng-bind-html="summary.availableCash|slMoney">
0
<small>.00元</small>
</h4>
<h6>账户余额</h6>
</li>
<li class="statistics-fields">
<h4>
<abbr class="ng-binding ng-scope" ng-bind-html="chartSummary.totalAssets|slMoney" tooltip-placement="bottom" tooltip="=待收本金+可用账户余额+投标中冻结金额" title="">
0
<small>.00元</small>
</abbr>
</h4>
<h6>账户总资产</h6>
</li>
<li class="statistics-fields">
<h4>
<abbr class="ng-binding ng-scope" ng-bind-html="summary.interestReceived|slMoney" tooltip-placement="bottom" tooltip="=已收利息+已收罚金" title="">
0
<small>.00元</small>
</abbr>
</h4>
<h6>累计净收益</h6>
</li>
</ul>
</div>
<div class="row summary-section">
<header class="common-color clearfix">
<span class="pull-left">账户统计</span>
</header>
<section class="statistics-equation">
<div class="row"> </div>
<table class="table table-hover statistics-table">
<thead>
<tr>
<th class="repayment-table-col-period text-right">名称</th>
<th class="repayment-table-col-interests">交易金额</th>
</tr>
</thead>
<tbody class="">
<tr>
<td class="text-right">待收本金</td>
<td class="ng-binding" ng-bind="summary.outstandingPrincipal | slCurrency">0.00元</td>
</tr>
<tr>
<td class="text-right">可用账户余额</td>
<td class="ng-binding" ng-bind="summary.availableCash | slCurrency">0.00元</td>
</tr>
<tr>
<td class="text-right">投标中冻结金额</td>
<td class="ng-binding" ng-bind="summary.inFundingAmount | slCurrency">0.00元</td>
</tr>
<tr>
<td colspan="2"> </td>
</tr>
<tr>
<td class="text-right">净充值本金</td>
<td>
<abbr class="ng-binding ng-scope" ng-bind="summary.retainedPrincipal | slCurrency" tooltip-placement="bottom" tooltip="累计充值-累计取现" title="">0.00元</abbr>
</td>
</tr>
<tr>
<td class="text-right">已收利息</td>
<td class="ng-binding" ng-bind="summary.interestEarned | slCurrency">0.00元</td>
</tr>
<tr>
<td class="text-right">已收罚息</td>
<td class="ng-binding" ng-bind="summary.lateFeePending | slCurrency">0.00元</td>
</tr>
<tr>
<td class="text-right">累计礼金</td>
<td>-</td>
</tr>
<tr>
<td colspan="2"> </td>
</tr>
<tr>
<td class="text-right">已收本金</td>
<td class="ng-binding" ng-bind="summary.principalReceived | slCurrency">0.00元</td>
</tr>
<tr>
<td class="text-right">累计充值</td>
<td class="ng-binding" ng-bind="summary.addedFunds | slCurrency">0.00元</td>
</tr>
<tr>
<td class="text-right">累计取现</td>
<td class="ng-binding" ng-bind="summary.withdrawFunds | slCurrency">0.00元</td>
</tr>
</tbody>
</table>
</section>
</div>
</div>
</div>
</div>
</div>
</div>
<div id="eventDetailsModal" class="modal fade" aria-hidden="true" role="dialog" tabindex="-1">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button class="close sl-icon-cross" aria-hidden="true" data-dismiss="modal" type="button"></button>
<h5>当日资产动态详情</h5>
</div>
<div class="modal-body">
<div class="row summary-section section-block fields">
<div class="data-table-wrapper ng-isolate-scope" data="eventDayData" columns="eventDayColumns">
<table class="table data-table table-hover table-striped ">
<thead>
<tr>
<th class="ng-scope" ng-repeat="a in columns" ng-class="a.headerCssClass">
<span ng-click="sort(a.sortBy ? a.sortBy : a.field)" ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}">
<span class="ng-binding" ng-bind-html="escapeHtml(a.name)">日期</span>
<span ng-class="{'sl-icon-pointer-down-dark':(a.sortable && ((params.sortBy!=a.sortBy && defaultDesc==true)||(params.sortBy==a.sortBy&&params.sortDir=='desc'))), 'sl-icon-pointer-up-dark':a.sortable &&((params.sortBy!=a.sortBy && defaultDesc==false)|| (params.sortBy==a.sortBy&&params.sortDir == 'asc'))}"></span>
</span>
</th>
<th class="ng-scope" ng-repeat="a in columns" ng-class="a.headerCssClass">
<span ng-click="sort(a.sortBy ? a.sortBy : a.field)" ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}">
<span class="ng-binding" ng-bind-html="escapeHtml(a.name)">活动名称</span>
<span ng-class="{'sl-icon-pointer-down-dark':(a.sortable && ((params.sortBy!=a.sortBy && defaultDesc==true)||(params.sortBy==a.sortBy&&params.sortDir=='desc'))), 'sl-icon-pointer-up-dark':a.sortable &&((params.sortBy!=a.sortBy && defaultDesc==false)|| (params.sortBy==a.sortBy&&params.sortDir == 'asc'))}"></span>
</span>
</th>
<th class="ng-scope" ng-repeat="a in columns" ng-class="a.headerCssClass">
<span ng-click="sort(a.sortBy ? a.sortBy : a.field)" ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}">
<span class="ng-binding" ng-bind-html="escapeHtml(a.name)">活动描述</span>
<span ng-class="{'sl-icon-pointer-down-dark':(a.sortable && ((params.sortBy!=a.sortBy && defaultDesc==true)||(params.sortBy==a.sortBy&&params.sortDir=='desc'))), 'sl-icon-pointer-up-dark':a.sortable &&((params.sortBy!=a.sortBy && defaultDesc==false)|| (params.sortBy==a.sortBy&&params.sortDir == 'asc'))}"></span>
</span>
</th>
<th class="ng-scope" ng-repeat="a in columns" ng-class="a.headerCssClass">
<span ng-click="sort(a.sortBy ? a.sortBy : a.field)" ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}">
<span class="ng-binding" ng-bind-html="escapeHtml(a.name)">金额</span>
<span ng-class="{'sl-icon-pointer-down-dark':(a.sortable && ((params.sortBy!=a.sortBy && defaultDesc==true)||(params.sortBy==a.sortBy&&params.sortDir=='desc'))), 'sl-icon-pointer-up-dark':a.sortable &&((params.sortBy!=a.sortBy && defaultDesc==false)|| (params.sortBy==a.sortBy&&params.sortDir == 'asc'))}"></span>
</span>
</th>
<th class="ng-scope" ng-repeat="a in columns" ng-class="a.headerCssClass">
<span ng-click="sort(a.sortBy ? a.sortBy : a.field)" ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}">
<span class="ng-binding" ng-bind-html="escapeHtml(a.name)">贷款详情</span>
<span ng-class="{'sl-icon-pointer-down-dark':(a.sortable && ((params.sortBy!=a.sortBy && defaultDesc==true)||(params.sortBy==a.sortBy&&params.sortDir=='desc'))), 'sl-icon-pointer-up-dark':a.sortable &&((params.sortBy!=a.sortBy && defaultDesc==false)|| (params.sortBy==a.sortBy&&params.sortDir == 'asc'))}"></span>
</span>
</th>
</tr>
</thead>
<tbody> </tbody>
</table>
</div>
</div>
</div>
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
         <img src="static/images/new-user-title.png" />
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
           <a class="btn  btn-action" href="index.jsp" ng-click="linkToRecharge()">立即充值投资</a>
          </div> 
          <div ng-show="!fromLC">
           <a class="btn btn-block btn-action" href="market.jsp" target="_blank">立即投资</a>
          </div> 
         </div> 
         <div class="col-xs-5 col-xs-offset-1 qr"> 
          <img src="images/qr-sub.png" /> 
          <p>立即扫描或搜索&quot;dianrongapi&quot;</p> 
          <p>关注点融网官方微信</p> 
         </div> 
        </div> 
        <div class="new-user-footer hidden"> 
         <img src="static/images/new-user-footer.png" />
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
        <img src="static/images/qrcode-dianrongapi.jpg" alt="点融网订阅号" />
        <p>dianrongapi</p> 
       </div> 
       <div class="wechat-service"> 
        <h6>点融网服务号</h6> 
        <p>查询投资情况</p> 
        <img src="static/images/qrcode-dianrongvip.jpg" alt="点融网服务号" />
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