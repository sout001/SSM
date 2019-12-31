<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html dir="ltr" lang="zh-CN" xml:lang="zh-CN">
 <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <meta name="description" content="点融网为广大个人和微小企业提供便利的投融资服务。借款产品灵活、大额、费用低、手续快；投资方式人性友好、回报高、百分百本金保护！Dianrong.com provides online efficient investment and financing services for individuals and SMEs. Better rates, lower cost, faster way to borrowers and more flexible investment, higher returns, 100% principal protection to investors." /> 
  <meta name="keywords" content="P2P网贷,P2P网络贷款平台,P2P网络投资平台,P2P投资理财平台,网络贷款平台,团团赚,点融,点融网,点融官网" /> 
  <link rel="shortcut icon" href="./static/images/favicon.ico" />
  <title>团团赚-member_tuan.html</title> 
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
        <li><a href="member_index.jsp"><span class="sl-icon-account"></span>账户总览</a> </li>
        <li><a href='member_info.jsp'><span class="sl-icon-profile"></span>基本信息</a> </li>
        <li class="divider"></li> 
        <li class="nav-header">我的投资</li> 
        <li class="active"> <a href='member_tuan.jsp'><span class="sl-icon-agreement"></span>团团赚</a> </li>
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
<div class="group-buy content-wrapper ng-scope">
<header class="plans-header plans-subsection" ng-show="showPlanList">
<p class="plans-header-title">团团赚总览</p>
</header>
<h2 class="text-center ng-hide" ng-show="pageLoading">
<i class="spinner sl-icon-loading"></i>
</h2>
<div class="tab-content" ng-show="!pageLoading && showPlanList">
<div class="plans-summary clearfix row">
<div class="col-xs-2 summary-subsection">
<img class="tuan-summary-img" src="./static/images/plan-tuan.png">
<p class="tuan-summary-title text-center">团团赚</p>
</div>
<div class="col-xs-2 text-center summary-subsection highlighted-cont">
<h3 class="highlighted-sum ng-binding" ng-bind-html="allInterestReceived | slMoney">
0
<small>.00元</small>
</h3>
<p class="font-gray">累计利息收益</p>
</div>
<div class="col-xs-2 summary-subsection text-center highlighted-cont">
<h4 class="default-sum ng-binding">
0
<small>元</small>
</h4>
<p class="font-gray">加入总金额</p>
</div>
<div class="col-xs-2 summary-subsection text-center highlighted-cont">
<h4 class="default-sum ng-binding">
0
<small>笔</small>
</h4>
<p class="font-gray">持有标数量</p>
</div>
</div>
<div class="bg-content">
<div class="plan-invest-header row">
<div class="col-xs-1 font-gray text-center">名称</div>
<div class="col-xs-2 font-gray text-left interest-info">累计收益(元)</div>
<div class="col-xs-2 font-gray text-left annual-rate">年化收益</div>
<div class="col-xs-2 font-gray text-left">加入本金(元)</div>
<div class="col-xs-2 font-gray text-left">购买笔数</div>
<div class="col-xs-2 font-gray text-left">担保</div>
<div class="col-xs-1 font-gray text-left"></div>
</div>
<div class="plan-invest-info row ng-scope" ng-repeat="w in linkLoansArray">
<div class="col-xs-1 text-left">
<img class="sl-plan-pic" ng-src="images/liquidity.jpg" src="./static/images/liquidity.jpg">
</div>
<div class="col-xs-2 text-left text-words interest-num">当前未投资</div>
<div class="col-xs-2 text-left text-num rate-red annual-rate ng-binding">5.5%</div>
<div class="col-xs-2 text-left text-words">
<a class="go-invest" href="/market/plan?planId=157001">去投资</a>
</div>
<div class="col-xs-2 text-left">
<p class="value number">
<span>0</span>
笔进行中
</p>
</div>
<div class="col-xs-2 text-left text-words ng-binding">本金保障</div>
<div class="col-xs-1 text-left text-words">
<a ng-click="viewDetail(w.loanId)" href=""> 查看 ></a>
</div>
</div>
<div class="plan-invest-info row ng-scope" ng-repeat="w in linkLoansArray">
<div class="col-xs-1 text-left">
<img class="sl-plan-pic" ng-src="images/newer.jpg" src="./static/images/newer.jpg">
</div>
<div class="col-xs-2 text-left text-words interest-num">当前未投资</div>
<div class="col-xs-2 text-left text-num rate-red annual-rate ng-binding">7%</div>
<div class="col-xs-2 text-left text-words">
<a class="go-invest" href="/market/plan?planId=68201">去投资</a>
</div>
<div class="col-xs-2 text-left">
<p class="value number">
<span>0</span>
笔进行中
</p>
</div>
<div class="col-xs-2 text-left text-words ng-binding">本息有保证</div>
<div class="col-xs-1 text-left text-words">
<a ng-click="viewDetail(w.loanId)" href=""> 查看 ></a>
</div>
</div>
<div class="plan-invest-info row ng-scope" ng-repeat="w in linkLoansArray">
<div class="col-xs-1 text-left">
<img class="sl-plan-pic" ng-src="images/steadiness.jpg" src="./static/images/steadiness.jpg">
</div>
<div class="col-xs-2 text-left text-words interest-num">当前未投资</div>
<div class="col-xs-2 text-left text-num rate-red annual-rate ng-binding">9%</div>
<div class="col-xs-2 text-left text-words">
<a class="go-invest" href="/market/plan?planId=145201">去投资</a>
</div>
<div class="col-xs-2 text-left">
<p class="value number">
<span>0</span>
笔进行中
</p>
</div>
<div class="col-xs-2 text-left text-words ng-binding">本金保障</div>
<div class="col-xs-1 text-left text-words">
<a ng-click="viewDetail(w.loanId)" href=""> 查看 ></a>
</div>
</div>
<div class="plan-invest-info row ng-scope" ng-repeat="w in linkLoansArray">
<div class="col-xs-1 text-left">
<img class="sl-plan-pic" ng-src="images/high.jpg" src="./static/images/high.jpg">
</div>
<div class="col-xs-2 text-left text-words interest-num">当前未投资</div>
<div class="col-xs-2 text-left text-num rate-red annual-rate ng-binding">7-16%</div>
<div class="col-xs-2 text-left text-words">
<a class="go-invest" href="/market/plan?planId=82801">去投资</a>
</div>
<div class="col-xs-2 text-left">
<p class="value number">
<span>0</span>
笔进行中
</p>
</div>
<div class="col-xs-2 text-left text-words ng-binding">本金保障</div>
<div class="col-xs-1 text-left text-words">
<a ng-click="viewDetail(w.loanId)" href=""> 查看 ></a>
</div>
</div>
<div class="plan-invest-info row ng-scope" ng-repeat="w in linkLoansArray">
<div class="col-xs-1 text-left">
<img class="sl-plan-pic" ng-src="images/vip.jpg" src="./static/images/vip.jpg">
</div>
<div class="col-xs-2 text-left text-words interest-num">当前未投资</div>
<div class="col-xs-2 text-left text-num rate-red annual-rate ng-binding">11%</div>
<div class="col-xs-2 text-left text-words">
<a class="go-invest" href="/market/plan?planId=189601">去投资</a>
</div>
<div class="col-xs-2 text-left">
<p class="value number">
<span>0</span>
笔进行中
</p>
</div>
<div class="col-xs-2 text-left text-words ng-binding">本金保障</div>
<div class="col-xs-1 text-left text-words">
<a ng-click="viewDetail(w.loanId)" href=""> 查看 ></a>
</div>
</div>
<div class="plan-invest-info row ng-scope" ng-repeat="w in linkLoansArray">
<div class="col-xs-1 text-left">
<img class="sl-plan-pic" ng-src="images/svip.jpg" src="./static/images/svip.jpg">
</div>
<div class="col-xs-2 text-left text-words interest-num">当前未投资</div>
<div class="col-xs-2 text-left text-num rate-red annual-rate ng-binding">12%</div>
<div class="col-xs-2 text-left text-words">
<a class="go-invest" href="/market/plan?planId=83001">去投资</a>
</div>
<div class="col-xs-2 text-left">
<p class="value number">
<span>0</span>
笔进行中
</p>
</div>
<div class="col-xs-2 text-left text-words ng-binding">本金保障</div>
<div class="col-xs-1 text-left text-words">
<a ng-click="viewDetail(w.loanId)" href=""> 查看 ></a>
</div>
</div>
</div>
</div>
<div class="plan-details-header ng-hide" ng-show="!pageLoading && !showPlanList && !showGradeDetail &&!publishedPageLoading">
<a class="back-btn" ng-click="goBack()" href="">团团赚总览</a>
>
<label class="plan-name ng-binding"></label>
</div>
<div class="tab-content virtual-detail ng-hide" ng-show="!pageLoading && !showPlanList && !showGradeDetail &&!publishedPageLoading">
<div class="plans-summary clearfix row">
<div class="col-xs-2 summary-subsection">
<img class="tuan-summary-img" ng-src="">
</div>
<div class="col-xs-2 text-center summary-subsection highlighted-cont">
<h3 class="highlighted-sum ng-binding" ng-bind-html="currentPlan.InterestReceived | slMoney">
<small>元</small>
</h3>
<p class="font-sec">累计利息收益</p>
</div>
<div class="col-xs-2 summary-subsection text-center highlighted-cont">
<p class="row-number">
<span class="red-rate ng-binding"></span>
</p>
<p class="font-sec ">年化收益率</p>
</div>
<div class="col-xs-2 summary-subsection text-center highlighted-cont">
<h4 class="default-sum ng-binding">
<small>笔</small>
</h4>
<p class="font-sec">持有标数量</p>
</div>
</div>
<div class="row bg-invest-detail">
<div class="row percentage-virtual-loans">
<div class="percentage-header">
<span>团标组成</span>
<span class="pull-right">点击风险等级图标可查看所投散标情况。</span>
</div>
<div id="pie-container" class="col-xs-6 pie-container"></div>
<div class="col-xs-6 grade-link">
<div class="row grade-level">
<div class="col-xs-2 grade-hover">
<p class="percent ng-binding">NaN%</p>
<p class="num ng-binding" ng-bind-html="gradeANum | slSimpleMoney:1">
NaN
<small>元</small>
</p>
<p class="grade-color grade-a " ng-click="linkToGradeDetail('a',virtualLoanId)"> A</p>
</div>
<div class="col-xs-2 grade-hover">
<p class="percent ng-binding">NaN%</p>
<p class="num ng-binding" ng-bind-html="gradeBNum | slSimpleMoney:1">
NaN
<small>元</small>
</p>
<p class="grade-color grade-b" ng-click="linkToGradeDetail('b',virtualLoanId)"> B</p>
</div>
<div class="col-xs-2 grade-hover">
<p class="percent ng-binding">NaN%</p>
<p class="num ng-binding" ng-bind-html="gradeCNum | slSimpleMoney:1">
NaN
<small>元</small>
</p>
<p class="grade-color grade-c" ng-click="linkToGradeDetail('c',virtualLoanId)"> C</p>
</div>
<div class="col-xs-2 grade-hover">
<p class="percent ng-binding">NaN%</p>
<p class="num ng-binding" ng-bind-html="gradeDNum |slSimpleMoney:1">
NaN
<small>元</small>
</p>
<p class="grade-color grade-d" ng-click="linkToGradeDetail('d',virtualLoanId)"> D</p>
</div>
<div class="col-xs-2 grade-hover">
<p class="percent ng-binding">NaN%</p>
<p class="num ng-binding" ng-bind-html="gradeENum | slSimpleMoney:1">
NaN
<small>元</small>
</p>
<p class="grade-color grade-e" ng-click="linkToGradeDetail('e',virtualLoanId)"> E</p>
</div>
<div class="col-xs-2 grade-hover">
<p class="percent ng-binding">NaN%</p>
<p class="num ng-binding" ng-bind-html="gradeFNum | slSimpleMoney:1">
NaN
<small>元</small>
</p>
<p class="grade-color grade-f" ng-click="linkToGradeDetail('f',virtualLoanId)"> F</p>
</div>
</div>
<div class="row grade-words">
<div class="col-xs-1 words low">低</div>
<div class="col-xs-10 line">
<img src="./static/images/level-line.png">
<p>风险评级</p>
</div>
<div class="col-xs-1 words high">高</div>
</div>
</div>
</div>
<div class="row invest-info">
<div class="col-xs-6 invest-general invest-strategy">
<div class="header-divider">投资策略 | 近6个月投资成长（元）</div>
<div id="strategy-chart-container" class="strategy-chart-container"></div>
</div>
<div class="col-xs-6 invest-general invest-benefit">
<div class="header-divider">收益变动 | 近6个月年化收益变动</div>
<div class="chart-container"></div>
</div>
</div>
</div>
</div>
<div class="invest-loan-table ng-hide" ng-show="!pageLoading && !showPlanList && !showGradeDetail &&!publishedPageLoading">
<ul id="groupbuy-tab" class="nav nav-tabs">
<li class="active">
<a data-toggle="tab" href="#in-payment-plans">
投团期数
<span class="badge ng-binding" ng-bind="currentPlan.investCount"></span>
</a>
</li>
<li>
<a data-toggle="tab" href="#selling-plans">
转让中
<span class="badge ng-binding" ng-bind="secNoteCount"></span>
</a>
</li>
<li>
<a data-toggle="tab" href="#selled-plans">
已转让
<span class="badge ng-binding" ng-bind="transferedCount"></span>
</a>
</li>
</ul>
<div class="tab-content">
<div id="in-payment-plans" class="tab-pane active">
<div class="alert alert-warning clearfix ng-hide" ng-show="currentPlan.investCount<=0">
无任何记录
<a class="close sl-icon-cross" aria-hidden="true" data-dismiss="alert"></a>
</div>
<div class="plan-invest-header row header-row ng-hide" ng-show="currentPlan.investCount>0">
<div class="col-xs-3 font-gray text-left">累计收益(元)</div>
<div class="col-xs-3 font-gray text-left">购买日期</div>
<div class="col-xs-3 font-gray text-left">加入本金(元)</div>
<div class="col-xs-3 font-gray text-left"></div>
</div>
<div class="text-right note-buy-page ng-hide" ng-show="currentPlan.investCount>0">
<div class="sl-pagination pagination ng-isolate-scope" total-records="myInvestLoans.totalNotesRecords" page-size="myInvestLoans.pageSize" page="myInvestLoans.page">
<ul>
<li class="previous">
<a ng-click="prev()" href="javascript:;">
<i class="sl-icon-arrow-left"></i>
</a>
</li>
<li class="first ng-hide" ng-show="minPage > 1">
<a ng-click="first()" href="javascript:;">1...</a>
</li>
<li class="last ng-hide" ng-show="maxPage < totalPages - 2">
<a class="ng-binding" ng-click="last()" href="javascript:;">...NaN</a>
</li>
<li class="jump">
<div class="input-group-sm pull-left">
<input class="form-control input-sm btn-embossed page-number ng-pristine ng-valid" type="text" sl-enter="goTo(displayPage-1)" ng-model="displayPage" maxlength="3">
</div>
</li>
<li class="total">
<span class="ng-binding">NaN页</span>
</li>
<li class="next">
<a ng-click="next()" href="javascript:;">
<i class="sl-icon-arrow-right"></i>
</a>
</li>
</ul>
</div>
</div>
</div>
<div id="selling-plans" class="tab-pane">
<div class="alert alert-warning clearfix ng-hide" ng-show="secNoteCount<=0">
无任何记录
<a class="close sl-icon-cross" aria-hidden="true" data-dismiss="alert"></a>
</div>
<div class="plan-invest-header row ng-hide" ng-show="secNoteCount>0">
<div class="col-xs-2 font-gray text-left">项目名称</div>
<div class="col-xs-2 font-gray text-left">加入本金(元)</div>
<div class="col-xs-2 font-gray text-left">购买日期</div>
<div class="col-xs-2 font-gray text-left">状态</div>
<div class="col-xs-3 font-gray text-left"></div>
</div>
</div>
<div id="selled-plans" class="tab-pane">
<div class="alert alert-warning clearfix ng-hide" ng-show="transferedCount<=0">
无任何记录
<a class="close sl-icon-cross" aria-hidden="true" data-dismiss="alert"></a>
</div>
<div class="plan-invest-header row ng-hide" ng-show="transferedCount>0">
<div class="col-xs-2 font-gray text-left">项目名称</div>
<div class="col-xs-2 font-gray text-left">转让价格</div>
<div class="col-xs-2 font-gray text-left">转让日期</div>
<div class="col-xs-3 font-gray text-left">状态</div>
</div>
<div class="text-right ng-hide" ng-show="transferedCount>0">
<div class="sl-pagination pagination ng-isolate-scope" total-records="transferedLoans.totalNotesRecords" page-size="transferedLoans.pageSize" page="transferedLoans.page">
<ul>
<li class="previous">
<a ng-click="prev()" href="javascript:;">
<i class="sl-icon-arrow-left"></i>
</a>
</li>
<li class="first ng-hide" ng-show="minPage > 1">
<a ng-click="first()" href="javascript:;">1...</a>
</li>
<li class="last ng-hide" ng-show="maxPage < totalPages - 2">
<a class="ng-binding" ng-click="last()" href="javascript:;">...NaN</a>
</li>
<li class="jump">
<div class="input-group-sm pull-left">
<input class="form-control input-sm btn-embossed page-number ng-pristine ng-valid" type="text" sl-enter="goTo(displayPage-1)" ng-model="displayPage" maxlength="3">
</div>
</li>
<li class="total">
<span class="ng-binding">NaN页</span>
</li>
<li class="next">
<a ng-click="next()" href="javascript:;">
<i class="sl-icon-arrow-right"></i>
</a>
</li>
</ul>
</div>
</div>
</div>
</div>
</div>
<div class="plan-details-header ng-hide" ng-show="!pageLoading && !showPlanList && showGradeDetail">
<a class="back-btn" ng-click="goBack()" href="">
<span class="padding-sign">团团赚总览</span>
>
</a>
<a class="back-btn" ng-click="goBackSec()" href="">
<label class="plan-name">
<span class="padding-sign ng-binding"></span>
>
</label>
</a>
<label class="loan-detail ng-binding">类标详情</label>
</div>
<h2 class="text-center ng-hide" ng-show="gradePageLoading">
<i class="spinner sl-icon-loading"></i>
</h2>
<div class="plan-summary grade-detail-content clearfix row ng-hide" ng-show="!gradePageLoading && !showPlanList && showGradeDetail">
<div class="col-xs-1"></div>
<div class="col-xs-2 summary-subsection">
<h4 class="grade-level grade-"></h4>
<p class="grade-summary-title text-left ng-binding">类标</p>
</div>
<div class="col-xs-2 text-center">
<p class="row-number">
<span class="red-rate ng-binding"></span>
<span class="sign">%</span>
</p>
<p class="font-sec grade-rate">年化收益率</p>
</div>
<div class="col-xs-1"></div>
<div class="col-xs-2 grade-loans text-center ">
<h4 class="default-sum ng-binding">
<small>笔</small>
</h4>
<p class="font-sec ">持有标数量</p>
</div>
</div>
<div class="grade-detail-table ng-hide" ng-show="!gradePageLoading && !showPlanList && showGradeDetail">
<div class="plans-table ng-hide" ng-show="totalNotesRecords>0">
<div class="data-table-wrapper ng-isolate-scope" params="myNoteParams" data="myNoteData" columns="myNoteColumns" init="myNoteInit(ele)">
<table class="table data-table table-hover table-striped ">
<thead>
<tr>
<th class="ng-scope tc" ng-repeat="a in columns" ng-class="a.headerCssClass">
<span ng-click="sort(a.sortBy ? a.sortBy : a.field)" ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}">
<span class="ng-binding" ng-bind-html="escapeHtml(a.name)">名称</span>
<span ng-class="{'sl-icon-pointer-down-dark':(a.sortable && ((params.sortBy!=a.sortBy && defaultDesc==true)||(params.sortBy==a.sortBy&&params.sortDir=='desc'))), 'sl-icon-pointer-up-dark':a.sortable &&((params.sortBy!=a.sortBy && defaultDesc==false)|| (params.sortBy==a.sortBy&&params.sortDir == 'asc'))}"></span>
</span>
</th>
<th class="ng-scope" ng-repeat="a in columns" ng-class="a.headerCssClass">
<span ng-click="sort(a.sortBy ? a.sortBy : a.field)" ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}">
<span class="ng-binding" ng-bind-html="escapeHtml(a.name)">信用等级</span>
<span ng-class="{'sl-icon-pointer-down-dark':(a.sortable && ((params.sortBy!=a.sortBy && defaultDesc==true)||(params.sortBy==a.sortBy&&params.sortDir=='desc'))), 'sl-icon-pointer-up-dark':a.sortable &&((params.sortBy!=a.sortBy && defaultDesc==false)|| (params.sortBy==a.sortBy&&params.sortDir == 'asc'))}"></span>
</span>
</th>
<th class="ng-scope" ng-repeat="a in columns" ng-class="a.headerCssClass">
<span ng-click="sort(a.sortBy ? a.sortBy : a.field)" ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}">
<span class="ng-binding" ng-bind-html="escapeHtml(a.name)">借款利率</span>
<span ng-class="{'sl-icon-pointer-down-dark':(a.sortable && ((params.sortBy!=a.sortBy && defaultDesc==true)||(params.sortBy==a.sortBy&&params.sortDir=='desc'))), 'sl-icon-pointer-up-dark':a.sortable &&((params.sortBy!=a.sortBy && defaultDesc==false)|| (params.sortBy==a.sortBy&&params.sortDir == 'asc'))}"></span>
</span>
</th>
<th class="ng-scope" ng-repeat="a in columns" ng-class="a.headerCssClass">
<span ng-click="sort(a.sortBy ? a.sortBy : a.field)" ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}">
<span class="ng-binding" ng-bind-html="escapeHtml(a.name)">借款金额</span>
<span ng-class="{'sl-icon-pointer-down-dark':(a.sortable && ((params.sortBy!=a.sortBy && defaultDesc==true)||(params.sortBy==a.sortBy&&params.sortDir=='desc'))), 'sl-icon-pointer-up-dark':a.sortable &&((params.sortBy!=a.sortBy && defaultDesc==false)|| (params.sortBy==a.sortBy&&params.sortDir == 'asc'))}"></span>
</span>
</th>
<th class="ng-scope" ng-repeat="a in columns" ng-class="a.headerCssClass">
<span ng-click="sort(a.sortBy ? a.sortBy : a.field)" ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}">
<span class="ng-binding" ng-bind-html="escapeHtml(a.name)">加入本金</span>
<span ng-class="{'sl-icon-pointer-down-dark':(a.sortable && ((params.sortBy!=a.sortBy && defaultDesc==true)||(params.sortBy==a.sortBy&&params.sortDir=='desc'))), 'sl-icon-pointer-up-dark':a.sortable &&((params.sortBy!=a.sortBy && defaultDesc==false)|| (params.sortBy==a.sortBy&&params.sortDir == 'asc'))}"></span>
</span>
</th>
<th class="ng-scope" ng-repeat="a in columns" ng-class="a.headerCssClass">
<span ng-click="sort(a.sortBy ? a.sortBy : a.field)" ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}">
<span class="ng-binding" ng-bind-html="escapeHtml(a.name)">状态</span>
<span ng-class="{'sl-icon-pointer-down-dark':(a.sortable && ((params.sortBy!=a.sortBy && defaultDesc==true)||(params.sortBy==a.sortBy&&params.sortDir=='desc'))), 'sl-icon-pointer-up-dark':a.sortable &&((params.sortBy!=a.sortBy && defaultDesc==false)|| (params.sortBy==a.sortBy&&params.sortDir == 'asc'))}"></span>
</span>
</th>
<th class="ng-scope" ng-repeat="a in columns" ng-class="a.headerCssClass">
<span ng-click="sort(a.sortBy ? a.sortBy : a.field)" ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}">
<span class="ng-binding" ng-bind-html="escapeHtml(a.name)"></span>
<span ng-class="{'sl-icon-pointer-down-dark':(a.sortable && ((params.sortBy!=a.sortBy && defaultDesc==true)||(params.sortBy==a.sortBy&&params.sortDir=='desc'))), 'sl-icon-pointer-up-dark':a.sortable &&((params.sortBy!=a.sortBy && defaultDesc==false)|| (params.sortBy==a.sortBy&&params.sortDir == 'asc'))}"></span>
</span>
</th>
</tr>
</thead>
<tbody> </tbody>
</table>
</div>
</div>
<h2 class="text-center ng-hide" ng-show="gradePageLoading">
<i class="spinner sl-icon-loading"></i>
</h2>
<div class="alert alert-warning clearfix ng-hide" ng-show="totalNotesRecords<=0">
无任何记录
<a class="close sl-icon-cross" aria-hidden="true" data-dismiss="alert"></a>
</div>
<div class="notes-pagination ng-hide" ng-show="totalNotesRecords>0">
<div class="sl-pagination pagination ng-isolate-scope" total-records="totalNotesRecords" page-size="gradeDetailParams.pageSize" page="gradeDetailParams.page">
<ul>
<li class="previous">
<a ng-click="prev()" href="javascript:;">
<i class="sl-icon-arrow-left"></i>
</a>
</li>
<li class="first ng-hide" ng-show="minPage > 1">
<a ng-click="first()" href="javascript:;">1...</a>
</li>
<li class="last ng-hide" ng-show="maxPage < totalPages - 2">
<a class="ng-binding" ng-click="last()" href="javascript:;">...NaN</a>
</li>
<li class="jump">
<div class="input-group-sm pull-left">
<input class="form-control input-sm btn-embossed page-number ng-pristine ng-valid" type="text" sl-enter="goTo(displayPage-1)" ng-model="displayPage" maxlength="3">
</div>
</li>
<li class="total">
<span class="ng-binding">NaN页</span>
</li>
<li class="next">
<a ng-click="next()" href="javascript:;">
<i class="sl-icon-arrow-right"></i>
</a>
</li>
</ul>
</div>
</div>
</div>
<div id="sellInfoModal" class="modal fade" aria-hidden="true" role="dialog" tabindex="-1">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header clearfix">
<div class="pull-left">
<p class="modal-title ng-binding">
<label class="owned-length ng-binding">持有期0天</label>
</p>
</div>
<div class="pull-right">
<button class="close sl-icon-cross" aria-hidden="true" data-dismiss="modal" type="button"></button>
</div>
</div>
<div class="modal-body">
<h2 class="text-center ng-hide" ng-show="gettingSellInfo">
<i class="spinner sl-icon-loading"></i>
</h2>
<div class="" ng-show="!gettingSellInfo">
<section class="sell-note-wrapper">
<div class="row">
<div class="col-xs-12">
<div class="alert alert-success ng-hide" ng-show="msg.length > 0" timeout="sellNoteTimeout" msg="sellNoteMsg" type="sellNoteMsgType">
<a class="close sl-icon-cross" aria-hidden="true" ng-click="close()" type="button"></a>
</div>
</div>
</div>
<div class="row">
<div class="col-xs-6">
<div class="fee-desc">
<div class="ng-binding" ng-bind-html="fee_tooltip"></div>
</div>
</div>
<div class="col-xs-6 price-form">
<div class="text-right">
<div class="row">
<div class="col-xs-5">
<label>累计收益</label>
</div>
<div class="col-xs-7">
<label class="rt-value pr ng-binding" ng-bind="noteSellInfo.interestReceived | slCurrency">0.00元</label>
</div>
</div>
<div class="row">
<div class="col-xs-5">
<label>债权转让金额</label>
</div>
<div class="col-xs-7">
<label class="rt-value pr ng-binding" ng-bind="noteSellInfo.sellPrice | slCurrency">0.00元</label>
</div>
</div>
<div class="row">
<div class="col-xs-5">
<label>转让手续费</label>
</div>
<div class="col-xs-7">
<label class="rt-value pr ng-binding" ng-bind="noteSellInfo.fee | slCurrency">0.00元</label>
</div>
</div>
<div class="row">
<div class="col-xs-5">
<label>实收转让金额</label>
</div>
<div class="col-xs-7">
<label class="rt-value pr ng-binding" ng-bind="noteSellInfo.actualPrice | slCurrency">0.00元</label>
</div>
</div>
<div class="row">
<div class="col-xs-7 col-xs-offset-5">
<p>
<span class="sl-icon-check agreeDeal"> </span>
同意
<a target="_blank" href="/public/secondary-market-agreement?protocol=secondary-market-agreement">债权转让协议</a>
</p>
</div>
</div>
<div class="row text-right">
<div class="col-xs-12">
<span class="ng-hide" ng-show="sellingNotes">
<i class="spinner sl-icon-loading"></i>
</span>
<a class="btn btn-link" aria-hidden="true" data-dismiss="modal" href="">取消</a>
<a class="btn btn-primary" ng-disabled="sellingNotes || noteSellInfo.sold" ng-click="confirmSellNote()" href="">确认出售债权</a>
</div>
</div>
</div>
</div>
</div>
</section>
</div>
</div>
</div>
</div>
</div>
<div class="ng-hide" ng-show="!pageLoading && !showPlanList && showGradeDetail">
<div class="ng-isolate-scope" is-virtual="true" loan="currentNote" mynote-installment="">
<div id="installmentModal" class="modal fade" aria-hidden="true" role="dialog" tabindex="-1">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<div class="installment-title" style="display: inline-block">
<span class="sl-icon-dart auto-icon ng-hide" title="自动投标" data-toggle="tooltip" ng-hide="!currentLoan.autoInvestOrder"> </span>
<span class="ng-binding">借款编号：</span>
<h5 class="highlight ng-binding"></h5>
</div>
<div class="pull-right">
<button class="close sl-icon-cross" aria-hidden="true" data-dismiss="modal" type="button"></button>
<a class="installment-investment-agreement ng-hide" ng-show="isShowPolicy && showDeal" ng-href="" target="_blank">
<span class="sl-icon-copy"></span>
借款协议
</a>
</div>
</div>
<div class="modal-body">
<div class="installment-wrapper modal-wrapper">
<div class="loading ng-hide" ng-show="singleLoading && singlePage">载入中......</div>
<div class="alert alert- ng-hide" ng-show="msg.length > 0" msg="msg">
<a class="close sl-icon-cross" aria-hidden="true" ng-click="close()" type="button"></a>
</div>
<div class="" ng-hide="singlePage && (singleLoading || alreadySold)">
<div class="row summary-section fields">
<div class="col-xs-8 fields-left">
<ul class="list-inline installment-highlighted">
<li>
<h5 class="highlighted-sum ng-binding">
<small class="small-bold">元</small>
</h5>
<p class="highlighted-sum-caption">借款总额</p>
</li>
<li>
<h5 class="highlighted-sum ng-binding">
0
<small class="small-bold ng-binding">/个月</small>
</h5>
<p class="highlighted-sum-caption">还款进度</p>
</li>
<li>
<h5 class="highlighted-sum text-adjust-chinese ng-binding" ng-bind-html="(currentLoan.paymentMethodLabel?currentLoan.paymentMethodLabel:'')|loanPaymentMethod"></h5>
<p class="highlighted-sum-caption">还款方式</p>
</li>
<li>
<h5 class="highlighted-sum text-adjust-chinese ng-binding"></h5>
<p class="highlighted-sum-caption">还款状态</p>
</li>
</ul>
<ul class="list-inline installment-invest-amount">
<li>投资金额</li>
<li class="ng-binding ng-scope" ng-if="isVirtual">元</li>
</ul>
</div>
<div class="col-xs-4 fields-right">
<div class="int-grade">
<div class="loan-grade-icon grade- pull-left">
<span class="level ng-binding"></span>
</div>
<div class="int-rate">
<h3 class="highlighted-sum ng-binding">
<small>%</small>
</h3>
<p class="highlighted-sum-caption">年化收益率</p>
</div>
</div>
<div class="sell-note">
<div class="alert alert- ng-hide" ng-show="msg.length > 0" timeout="cancelTimeout" msg="cancelMsg" type="cancelType">
<a class="close sl-icon-cross" aria-hidden="true" ng-click="close()" type="button"></a>
</div>
</div>
</div>
</div>
<div class="row summary-section">
<div id="mynote-sellnote" class="hidden">
<h6 class="loading-animation text-center" ng-show="gettingNoteInfo">
<i class="spinner sl-icon-loading"></i>
</h6>
<div class="ng-hide" ng-show="!gettingNoteInfo">
<header class="section-header">
<a id="back-to-details" class="header-label" ng-click="openSellNote=false" href="">
<span class="glyphicon glyphicon-chevron-left"></span>
返回详情
</a>
</header>
<section class="sell-note-wrapper">
<div class="row">
<div class="col-xs-12">
<div class="alert alert-success ng-hide" ng-show="msg.length > 0" timeout="sellNoteTimeout" msg="sellNoteMsg" type="sellNoteMsgType">
<a class="close sl-icon-cross" aria-hidden="true" ng-click="close()" type="button"></a>
</div>
</div>
</div>
<div class="row">
<div class="col-xs-6 calculator">
<div class="sec-add text-right">
<div>
<div class="row prip-wrapper">
<div class="col-xs-3 col-xs-offset-1">
<h5 class="sec-label">剩余本金</h5>
</div>
<div class="col-xs-7 value">
<h5 class="ng-binding" ng-bind-html="sellNoteInfo.remainingPrincipal|slMoney:false:false:2:true">
0
<small>.00</small>
</h5>
</div>
</div>
<div class="row int-wrapper">
<div class="col-xs-1">
<h5 class="plus-sign">+</h5>
</div>
<div class="col-xs-3">
<h5 class="sec-label">剩余利息</h5>
</div>
<div class="col-xs-7 value">
<h5 class="int-value ng-binding" ng-bind-html="sellNoteInfo.remainingInterest|slMoney:false:false:2:true">
0
<small>.00</small>
</h5>
</div>
</div>
</div>
</div>
<div class="sec-total text-right">
<div class="row">
<div class="col-xs-3 col-xs-offset-1">
<h5 class="sec-total-label sec-label">总计</h5>
</div>
<div class="col-xs-7">
<h3 class="sec-total-value ng-binding" ng-bind-html="sellNoteInfo.remainingPrincipal + sellNoteInfo.remainingInterest|slMoney">
0
<small>.00元</small>
</h3>
</div>
</div>
</div>
</div>
<div class="col-xs-6 price-form">
<div class="text-right">
<div class="row">
<label class="col-xs-5"> 转让价 </label>
<div class="col-xs-7">
<input class="form-control pr-input text-right ng-pristine ng-valid" type="text" name="sellPrice" ng-model="sellNoteInfo.sellPrice">
<span class="input-icon pr-icon">元</span>
<div class="alert alert-danger ng-binding ng-hide" ng-show="hasError"></div>
</div>
</div>
<div class="row">
<label class="col-xs-5"> 转让手续费 </label>
<div class="col-xs-7">
<p class="rt-value pr ng-binding" ng-bind="sellNoteInfo.fee | slCurrency">0.00元</p>
</div>
</div>
<div class="row">
<label class="col-xs-5"> 实收转让金额 </label>
<div class="col-xs-7">
<p class="rt-value pr ng-binding" ng-bind="sellNoteInfo.actualPrice | slCurrency">0.00元</p>
</div>
</div>
<div class="row">
<label class="col-xs-5"> 转让挂牌天数 </label>
<div class="col-xs-7">
<div class="day-dropdown">
<div class="btn-group select select-block mbn ng-isolate-scope" btn-style="btn-inverse" selected-name="sellNoteInfo.day" options="sellDays">
<button class="btn dropdown-toggle clearfix btn-inverse" data-toggle="dropdown">
<span class="filter-option pull-left ng-binding"></span>
<span class="caret"></span>
</button>
<ul class="dropdown-menu" role="menu"> </ul>
<select class="form-control hide" name=""> </select>
</div>
</div>
</div>
</div>
<div class="row">
<div class="col-xs-7 col-xs-offset-5">
<label>
<span class="sl-icon-check agreeDeal"> </span>
同意
<a target="_blank" href="/public/terms-of-use?protocol=secondary-market-agreement">借款转让协议</a>
</label>
<div class="alert alert-danger ng-hide" ng-show="!sellNoteInfo.agreeAgreement">请同意我们的协议</div>
</div>
</div>
<div class="row text-right">
<div class="col-xs-12">
<span class="loading-animation ng-hide" ng-show="sellingNotes">
<i class="spinner sl-icon-loading"></i>
</span>
<a class="btn btn-link" data-dismiss="modal" ng-click="openSellNote=false" href="">取消</a>
<a class="btn btn-primary" ng-disabled="sellingNotes || sellNoteInfo.sold" ng-click="sellNoteNow()" href="">确认出售债权</a>
</div>
</div>
</div>
</div>
</div>
</section>
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
           <a class="btn  btn-action" href="index.jsp" ng-click="linkToRecharge()">立即充值投资</a>
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