<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html dir="ltr" lang="zh-CN" xml:lang="zh-CN">
 <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <meta name="description" content="点融网为广大个人和微小企业提供便利的投融资服务。借款产品灵活、大额、费用低、手续快；投资方式人性友好、回报高、百分百本金保护！Dianrong.com provides online efficient investment and financing services for individuals and SMEs. Better rates, lower cost, faster way to borrowers and more flexible investment, higher returns, 100% principal protection to investors." /> 
  <meta name="keywords" content="P2P网贷,P2P网络贷款平台,P2P网络投资平台,P2P投资理财平台,网络贷款平台,团团赚,点融,点融网,点融官网" /> 
  <link rel="shortcut icon" href="./static/images/favicon.ico" />
  <title>我要投资- market.html</title> 
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
         <li><a href="index.jsp" ng-click="logout()">退出</a></li>
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
          <li class="main-link-list" ng-class="{active:isActive('/public/help-center')}"> <a class="main-link" href="help.html"> <span class="main-link-text">帮助中心</span> </a> </li> 
          <li class="main-link-list"> <a class="main-link" href="about.jsp"> <span class="main-link-text">关于我们</span> </a> </li>
         </ul> 
        </div> 
        <!-- /.navbar-collapse --> 
       </div> 
      </nav> 
     </div>

     <!--secondaryNav--> 
     <div class="browse-tabs clearfix container"> 
      <div class="row"> 
       <div class="browse-tab col-xs-9"> 
        <ul id="market-type-bar" class="nav nav-tabs"> 
         <li class="active"><a data-toggle="tab" >团团赚<span class="badge">新</span></a></li> 
         <!--
        <li><a class="gm" data-toggle="tab" href="#guarantee-market">保障标<span
            class="badge" ng-bind="guar_number"></span></a></li>
        --> 
         <li><a class="pm" data-toggle="tab" >投标列表<span class="badge" ng-bind="pri_number"></span></a></li> 
         <li><a class="sm secTitle" data-toggle="tab" >债权转让列表 
           <!--<span class="badge" ng-bind="sec_number"></span>--> </a> </li> 
        </ul> 
       </div> 
       <div class="recharge-tab col-xs-3"> 
        <div class="recharge-ctrl" ng-if="isAuthenticated()" ng-cloak="">
          可投资金额
         <span class="avail-amount" ng-bind="cart.availableToInvest|slCurrency"></span> 
         <a href="member_pay.jsp"><span class="recharge-icon"></span></a>
        </div> 
        <div class="calculator-ctrl"> 
         <a ng-show="showCalculator" data-toggle="modal" data-target="#calModal"><span class="sl-icon-calculator"></span></a> 
        </div> 
       </div>

       <!-- Modal --> 
       <div class="modal fade lender-calculator" id="calModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <div class="modal-dialog"> 
         <div class="modal-content"> 
          <div class="modal-header"> 
           <button type="button" class="close sl-icon-cross" data-dismiss="modal" aria-hidden="true"></button> 
           <h4 class="modal-title" id="myModalLabel">还款计算器</h4> 
          </div> 
          <div class="modal-body"> 
           <div sl-loan-calculator=""></div> 
          </div> 
         </div> 
         <!-- /.modal-content --> 
        </div> 
        <!-- /.modal-dialog --> 
       </div> 
       <!-- /.modal --> 
      </div> 
     </div> 
     <a class="sl-icon-arrow-up clickToTop" id="scrollToTop"> </a> 
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
   <div id="loan-list" class="container loan-list" ng-controller="BrowseCtrl"> 
    <div class="row"> 
     <div class="tab-content"> 
      <!-- plan market --> 
      <div class="tab-pane active fade in" id="plan-market"> 
       <div id="plan-market-banner" class="clearfix"> 
        <div class="col-xs-6"> 
         <a class="words" href="/market/groupLanding" target="_blank"> </a> 
        </div> 
        <div class="col-xs-6"> 
         <a class="video" href="/video/groupVideo" target="_blank"></a> 
        </div> 
       </div> 
       <div class="row"> 
        <div class="col-xs-9">
  <p class="loading text-center ng-hide" ng-show="loadingPlan">
  <i class="spinner sl-icon-loading"></i>
  </p>
  <div class="" ng-show="!loadingPlan">
  <div class="plan-item ng-scope" ng-repeat="p in plans | orderBy:'orderIndex'" style="">
  <div class="sl-plan-card ng-isolate-scope" ng-class="{ openCard: isOpen==true}" ng-mouseleave="hover = false" ng-mouseenter="hover = true" plan="p">
  <div class="left-time-open ng-hide" ng-show="isOpen">
  <span class="sl-icon-b-clock open-clock"></span>
  距下一场发布还有：
  <span class="time ng-binding">00</span>
  天
  <span class="time ng-binding">12</span>
  时
  <span class="time ng-binding">32</span>
  分
  <span class="time ng-binding">42</span>
  秒
  </div>
  <div class="sl-plan-pic col-xs-2 sl-plan-link" ng-click="toDetail()">
  <div>
  <img class="sl-plan-pic" ng-src="images/liquidity.jpg" src="./static/images/liquidity.jpg">
  <span class="new-share-icon ng-hide" ng-show="plan.id == 185001"></span>
  </div>
  </div>
  <div class="sl-plan-basic-info col-xs-7 sl-plan-link" ng-click="toDetail()">
  <h4 class="title ng-binding">活期投资团</h4>
  <p class="desc ng-binding">
  收益秒杀余额宝，资金存取很灵活。
  <a class="view-details-link ng-animate ng-hide" title="查看详情" ng-show="hover" style=""> 查看详情</a>
  </p>
  <div class="sl-plan-pay-info">
  <div class="col-xs-4 sl-plan-rate">
  <label class="name col-xs-6">预计年化收益率</label>
  <label class="value col-xs-6 ng-binding">
  5.5
  <span>%</span>
  </label>
  </div>
  <div class="col-xs-5 sl-plan-method">
  <p class="value ng-binding">本金保障</p>
  <p class="name" ng-show="plan.safeguardWay">保障级别</p>
  </div>
  <div class="col-xs-3 sl-plan-amount">
  <p class="value number ng-binding" ng-show="plan.minInvestAmount">100元</p>
  <p class="name" ng-show="plan.minInvestAmount">起投金额</p>
  </div>
  </div>
  </div>
  <div class="sl-plan-active-info col-xs-3">
  <div>
  <span class="sl-icon-account"></span>
  <label>
   已投金额
  <span class="amount-text ng-binding">1,939.66</span>
  <span>万元</span>
  </label>
  </div>
  <div>
  <span class="sl-icon-personal"></span>
  <label>
   加入人数
  <span class="member-num-text ng-binding">4,881</span>
  <span>人</span>
  </label>
  </div>
  <a class="btn btn-block btn-secondary btn-embossed" href="market/plan?planId=157001" ng-show="!isOpen && plan.openAmount>0 ">立即加入</a>
  <div class="repayment-status ng-hide" ng-show="isOpen || !plan.openAmount ">
  <span>已满额</span>
  </div>
  </div>
  </div>
  </div>

</div>
</div>
        <div class="col-xs-3 plan-info-col">
         <div class="plan-info-ctn new-year">
          <a class="bg-new-year" target="_blank" href="http://www.dianrong.com/landing/new-year/"> </a>
         </div>
         <div class="plan-info-ctn">
          <div class="clearfix">
           <label class="plan-info-title">投资效果</label>
          </div>
          <div class="plan-info-item clearfix">
           <img class="pull-left plan-info-icon" src="./static/images/goup_buy_info_people.png" width="40" height="40" />
           <div class="pull-left">
            <div class="plan-info-num" ng-cloak="">
             <span id="joinedMembers">{{ planStatis.joinedMembers | number }}</span>
            </div>
            <p><small>加入用户数</small></p>
           </div>
          </div>
          <div class="plan-info-item clearfix">
           <img class="pull-left plan-info-icon" src="./static/images/goup_buy_info_money.png" width="40" height="40" />
           <div class="pull-left">
            <div class="plan-info-num" ng-cloak="">
             <span id="accumulateAmount">{{ planStatis.accumulateAmount | slCurrency:false:true:true }}</span>
            </div>
            <p><small>累计投资(元)</small></p>
           </div>
          </div>
          <div class="plan-info-item clearfix">
           <img class="pull-left plan-info-icon" src="./static/images/goup_buy_info_earn.png" width="40" height="40" />
           <div class="pull-left">
            <div class="plan-info-num" ng-cloak="">
             <span id="userInvestTimes">{{ planStatis.userInvestTimes | number }}</span>
            </div>
            <p><small>用户投标次数</small></p>
           </div>
          </div>
          <div class="plan-info-item clearfix">
           <img class="pull-left plan-info-icon" src="./static/images/goup_buy_info_usage.png" width="40" height="40" />
           <div class="pull-left">
            <div class="plan-info-num" ng-cloak="">
             <span id="accumulateEarnForUser">555</span>
            </div>
            <p><small>累计赚取(元)</small></p>
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>

      <%--标的绑定 --%>
      <!-- primary market -->
  <div id="primary-market" class="tab-pane active" style="display:none">
  <div class="row">
  <div class="col-xs-9">
  <p class="loading text-center ng-hide" ng-show="loading">
  <i class="spinner sl-icon-loading"></i>
  </p>
  <div class="results" ng-show="!loading">
  <div class="result-item ng-scope" ng-repeat="item in loans" style="">
  <div class="sl-loan-card ng-isolate-scope ng-animate" ng-class="{ 'already-invested' : loan.alreadyInvestedIn && (!hover || !isCheckout), 'active' : hover}" ng-mouseleave="hover = false" ng-mouseenter="hover = true" ng-click="toMarket()" on-toggle-details="onToggleDetails()" detail-tabs="primaryLoanDetailTabs" enable-bulk="enableBulk" loan="item" style="">
  <div class="row">
  <div class="col-xs-8 card-divider" ng-click="toggleDetails($event)">
  <div>
  <header class="sl-loan-card-header">
  <small>
  <span class="sl-icon-loan-id loan-id"></span>
  <span class="ng-binding">234769</span>
  <span class="loan-type ng-hide" ng-show="isBusiness">
  <span class="sl-icon-loan-type-business icon"></span>
  中小企业贷
  </span>
  <span class="loan-type" ng-show="!isBusiness">
  <span class="sl-icon-loan-type-personal icon"></span>
  个人贷
  </span>
  <div class="tags">
  <span class="ng-scope" tooltip-placement="top" tooltip="100% 担保本金, 利息" ng-if="loan.isGuranteed">
  <span class="tag sl-icon-loan-tag-guarantee"></span>
  担保
  </span>
  <span class="remaining-time ng-binding ng-hide" ng-show="showRemainingTime">剩余时间14天</span>
  </div>
  </small>
  <div class="sl-loan-card-title" title="本地知名汽车融资租赁公司优质债权转让，100%本息回购保证！">
  <div class="ng-binding">借他妈几十万去读书。。。。</div>
  </div>
  </header>
  <ul class="list-inline sl-loan-card-highlighted ng-scope" ng-if="!secondaryMarket">
  <li class="col-xs-3">
  <div class="sl-loan-card-rate">
  <div class="loan-grade-icon grade-A">
  A
  <span class="level ng-binding">1</span>
  </div>
  <h4 class="highlighted-title ng-binding">
  7.80
  <small>%</small>
  </h4>
  </div>
  </li>
  <li class="col-xs-3">
  <span class="sl-icon-b-clock icon"></span>
  <h5 class="highlighted-title ng-binding">
  9
  <small>个月</small>
  </h5>
  </li>
  <li class="col-xs-3">
  <span class="sl-icon-account icon"></span>
  <h5 class="highlighted-title ng-binding" title="2,305,400.00元" ng-bind-html="loan.loanAmountRequested | slMoney:true">
  230
  <small>.54万元</small>
  </h5>
  </li>
  <li class="col-xs-3">
  <span class="sl-icon-repayment icon"></span>
  <h5 class="highlighted-title text-adjust-chinese ">
  <span class="ng-scope" ng-if="loan.repaymentMethod=='等额本息'">
  <abbr class="initialism ng-scope" tooltip-placement="right" tooltip="借款人每月按相等的金额偿还贷款本息，本金比重逐月递增、利息比重逐月递减。" title="">
  <span class="ng-binding" ng-bind-html="loan.repaymentMethod | loanPaymentMethod">等额本息</span>
  </abbr>
  </span>
  </h5>
  </li>
  </ul>
  </div>
  </div>
  <div class="col-xs-4 rightRow">
  <div class="ng-scope" ng-if="!secondaryMarket">
  <ul class="list-unstyled sl-loan-card-status">
  <li>
  <span class="sl-icon-account surplus"></span>
  剩余金额
  <span id="#" class="pull-right ng-binding">0元</span>
  </li>
  </ul>
  </div>
  <div class="ng-scope" ng-if="!secondaryMarket && !isCheckout">
  <div class="sl-progress ng-isolate-scope" formatted-percentage="100%" percentage="100">
  <div class="sl-progress-bar fullInvested" ng-style="{width:formattedPercentage}" ng-class="{narrow:percentage<20,fullInvested:percentage==100}" style="width: 100%;"></div>
  <span class="ng-binding" style="position:relative;left: 103%;top: -10px;">100%</span>
  </div>
  </div>
  <div class="ng-hide" ng-show="per<100 && loan.maxInvestAmount">
  <ul class="list-unstyled sl-loan-card-status item">
  <li>
  <span class="sl-icon-money-tag surplus"></span>
  可加入上限
  <span class="pull-right ng-binding">元</span>
  </li>
  </ul>
  </div>
  <div class="ng-scope" ng-if="paying">
  <div class="repayment-status">
  <span>还款中</span>
  </div>
  </div>
  </div>
  </div>
  </div>
  </div>
  </div>

<%-- 右侧条件筛选--%>
<div class="loan-list-footer row">
<div class="text-right">
<div class="sl-pagination pagination ng-isolate-scope" total-records="loansCount" page-size="params.pageSize" page="params.page">
<ul>
<li class="previous">
<a ng-click="prev()" href="javascript:;">
<i class="sl-icon-arrow-left"></i>
</a>
</li>
<li class="first ng-hide" ng-show="minPage > 1">
<a ng-click="first()" href="javascript:;">1...</a>
</li>
<li class="ng-scope active" ng-class="{ active: p == displayPage - 1 }" ng-repeat="p in pages" style="">
<a class="ng-binding" ng-click="goTo(p)" href="javascript:;">1</a>
</li>
<li class="last ng-hide" ng-show="maxPage < totalPages - 2">
<a class="ng-binding" ng-click="last()" href="javascript:;">...1</a>
</li>
<li class="jump">
<div class="input-group-sm pull-left">
<input class="form-control input-sm btn-embossed page-number ng-pristine ng-valid" type="text" sl-enter="goTo(displayPage-1)" ng-model="displayPage" maxlength="1" style="">
</div>
</li>
<li class="total">
<span class="ng-binding">1页</span>
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
<div class="col-xs-3 p-filter">
<div class="browse-filter" style="top: 10px;">
<div class="clearfix">
<div class="col-xs-6 btn-container">
<a class="pull-left btn btn-sm btn-outline-inverse" href="/public/help-center#/faq/article/5/5" target="_blank">信用等级说明</a>
</div>
<div class="col-xs-6 btn-container">
<a class="pull-right btn btn-sm btn-outline-inverse" href="/public/lender?force=true">新手指南</a>
</div>
</div>
<div class="filters">
<div class="clearfix search-bar">
<form class="ng-pristine ng-valid" ng-submit="search()">
<div class="input-group input-group-sm">
<input class="form-control ng-pristine ng-valid" type="text" placeholder="搜索贷款编号" ng-model="queryString">
<span class="sl-icon-search" ng-click="search()"></span>
</div>
</form>
</div>
<div class="clearfix">
<h6 class="pull-left">筛选条件</h6>
<label class="pull-right reset-btn btn btn-link" ng-click="reset()">重置</label>
</div>
<div class="ng-hide" ng-show="showSecTab">
<span class="filter-name clearfix">转让价</span>
<div class="list-dots">
<div class="default-option">
<span class="option active" ng-click="filters['salePrice'] = 'ALL';uniqueOrderBy('salePrice');" ng-class="{ active: filters['salePrice'] == 'ALL'}">不限</span>
</div>
<div class="custom-options">
<span class="option" ng-click="filters['salePrice'] = 'LOW';uniqueOrderBy('salePrice');" ng-class="{ active: filters['salePrice'] == 'LOW'}">从低到高</span>
<span class="option" ng-click="filters['salePrice'] = 'HIGH';uniqueOrderBy('salePrice');" ng-class="{ active: filters['salePrice'] == 'HIGH'}">从高到低</span>
</div>
</div>
</div>
<div>
<span class="filter-name clearfix">类型</span>
<div class="list-dots">
<div class="default-option">
<span class="option active" ng-click="filters['loanType'] = 'ALL'" ng-class="{ active: filters['loanType'] == 'ALL'}">不限</span>
</div>
<div class="custom-options">
<span class="option" ng-click="filters['loanType'] = 'BUSINESS'" ng-class="{ active: filters['loanType'] == 'BUSINESS'}">中小企业贷</span>
<span class="option" ng-click="filters['loanType'] = 'PERSONAL'" ng-class="{ active: filters['loanType'] == 'PERSONAL'}">个人贷</span>
</div>
</div>
</div>
<div>
<span class="filter-name clearfix">利率</span>
<div class="list-dots">
<div class="default-option">
<span class="option active" ng-click="filters['riskLevel'] = 'ALL';uniqueOrderBy('riskLevel');" ng-class="{ active: filters['riskLevel'] == 'ALL'}">不限</span>
</div>
<div class="custom-options">
<span class="option" ng-click="filters['riskLevel'] = 'HIGH';uniqueOrderBy('riskLevel');" ng-class="{ active: filters['riskLevel'] == 'HIGH'}">从高到低</span>
<span class="option" ng-click="filters['riskLevel'] = 'LOW';uniqueOrderBy('riskLevel');" ng-class="{ active: filters['riskLevel'] == 'LOW'}">从低到高</span>
</div>
</div>
</div>
<div>
<span class="filter-name clearfix">期限</span>
<div class="list-dots">
<div class="default-option">
<span class="option active" ng-click="filters['maturity'] = 'ALL'" ng-class="{ active: filters['maturity'] == 'ALL'}">不限</span>
</div>
<div class="custom-options">
<span class="option" ng-click="filters['maturity'] = 'LE12'" ng-class="{ active: filters['maturity'] == 'LE12'}">12个月及以下</span>
<span class="option" ng-click="filters['maturity'] = 'GT12'" ng-class="{ active: filters['maturity'] == 'GT12'}">12个月以上</span>
</div>
</div>
</div>
<div>
<span class="filter-name clearfix">剩余时间</span>
<div class="list-dots">
<div class="default-option">
<span class="option active" ng-click="filters['leftTime'] = 'ALL';uniqueOrderBy('leftTime');" ng-class="{ active: filters['leftTime'] == 'ALL'}">不限</span>
</div>
<div class="custom-options">
<span class="option" ng-click="filters['leftTime'] = 'HIGH';uniqueOrderBy('leftTime');" ng-class="{ active: filters['leftTime'] == 'HIGH'}">从高到低</span>
<span class="option" ng-click="filters['leftTime'] = 'LOW';uniqueOrderBy('leftTime');" ng-class="{ active: filters['leftTime'] == 'LOW'}">从低到高</span>
</div>
</div>
</div>
<div>
<span class="filter-name clearfix">还款方式</span>
<div class="list-dots">
<div class="default-option">
<span class="option active" ng-click="filters['loanRepayment'] = 'ALL'" ng-class="{ active: filters['loanRepayment'] == 'ALL'}">不限</span>
</div>
<div class="custom-options">
<span class="option" ng-click="filters['loanRepayment'] = 'Amortization'" ng-class="{ active: filters['loanRepayment'] == 'Amortization'}">等额本息</span>
<span class="option" ng-click="filters['loanRepayment'] = 'Session_Period'" ng-class="{ active: filters['loanRepayment'] == 'Session_Period'}">每月还息,按季度还本</span>
<span class="option" ng-click="filters['loanRepayment'] = 'Equal_Principal_Interest'" ng-class="{ active: filters['loanRepayment'] == 'Equal_Principal_Interest'}">等本等息</span>
<span class="option" ng-click="filters['loanRepayment'] = 'Half_Year_Period'" ng-class="{ active: filters['loanRepayment'] == 'Half_Year_Period'}">每月还息,按半年还本</span>
<span class="option" ng-click="filters['loanRepayment'] = 'DAILY'" ng-class="{ active: filters['loanRepayment'] == 'DAILY'}">天天还</span>
<span class="option" ng-click="filters['loanRepayment'] = 'Pay_At_The_End'" ng-class="{ active: filters['loanRepayment'] == 'Pay_At_The_End'}">每月还息,到期一次性还本</span>
</div>
</div>
</div>
<div class="" ng-show="!onlyGuaranteed">
<span class="filter-name clearfix">特色标</span>
<div class="list-dots">
<div class="default-option">
<span class="option active" ng-click="filters['loanFlag'] = 'ALL'" ng-class="{ active: filters['loanFlag'] == 'ALL'}">不限</span>
</div>
<div class="custom-options">
<span class="option" ng-click="filters['loanFlag'] = 'TRANSFERABLE'" ng-class="{ active: filters['loanFlag'] == 'TRANSFERABLE'}">本息回购</span>
<span class="option" ng-click="filters['loanFlag'] = 'COLLATERALIZED'" ng-class="{ active: filters['loanFlag'] == 'COLLATERALIZED'}">抵押</span>
<span class="option" ng-click="filters['loanFlag'] = 'GURANTEED'" ng-class="{ active: filters['loanFlag'] == 'GURANTEED'}">担保</span>
<span class="option" ng-click="filters['loanFlag'] = 'CASH_GURANTEED'" ng-class="{ active: filters['loanFlag'] == 'CASH_GURANTEED'}">现金担保</span>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
      <!-- Secondary Market  -->

      <div id="secondary-market" class="tab-pane active" style="display:none">
<div class="row">
<div class="col-xs-9">
<p class="loading text-center ng-hide" ng-show="secloading">
<i class="spinner sl-icon-loading"></i>
</p>
<div class="results" ng-show="!secloading">
<div class="ng-scope" ng-if="showSecondaryForPublic">
<div class="alert alert-warning text-center" ng-show="secLoansCount==0">暂无债权转让</div>
</div>
</div>
<div class="text-right">
<div class="sl-pagination pagination ng-isolate-scope" total-records="secLoansCount" page-size="secParams.pageSize" page="secParams.page">
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
<a class="ng-binding" ng-click="last()" href="javascript:;">...0</a>
</li>
<li class="jump">
<div class="input-group-sm pull-left">
<input class="form-control input-sm btn-embossed page-number ng-pristine ng-valid" type="text" sl-enter="goTo(displayPage-1)" ng-model="displayPage" maxlength="1" style="">
</div>
</li>
<li class="total">
<span class="ng-binding">0页</span>
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
<div class="col-xs-3 s-filter">
<div class="browse-filter">
<div class="clearfix">
<div class="col-xs-6 btn-container">
<a class="pull-left btn btn-sm btn-outline-inverse" href="/public/help-center#/faq/article/5/5" target="_blank">信用等级说明</a>
</div>
<div class="col-xs-6 btn-container">
<a class="pull-right btn btn-sm btn-outline-inverse" href="/public/lender?force=true">新手指南</a>
</div>
</div>
<div class="filters">
<div class="clearfix search-bar">
<form class="ng-pristine ng-valid" ng-submit="search()">
<div class="input-group input-group-sm">
<input class="form-control ng-pristine ng-valid" type="text" placeholder="搜索贷款编号" ng-model="queryString">
<span class="sl-icon-search" ng-click="search()"></span>
</div>
</form>
</div>
<div class="clearfix">
<h6 class="pull-left">筛选条件</h6>
<label class="pull-right reset-btn btn btn-link" ng-click="reset()">重置</label>
</div>
<div class="" ng-show="showSecTab">
<span class="filter-name clearfix">转让价</span>
<div class="list-dots">
<div class="default-option">
<span class="option active" ng-click="filters['salePrice'] = 'ALL';uniqueOrderBy('salePrice');" ng-class="{ active: filters['salePrice'] == 'ALL'}">不限</span>
</div>
<div class="custom-options">
<span class="option" ng-click="filters['salePrice'] = 'LOW';uniqueOrderBy('salePrice');" ng-class="{ active: filters['salePrice'] == 'LOW'}">从低到高</span>
<span class="option" ng-click="filters['salePrice'] = 'HIGH';uniqueOrderBy('salePrice');" ng-class="{ active: filters['salePrice'] == 'HIGH'}">从高到低</span>
</div>
</div>
</div>
<div>
<span class="filter-name clearfix">类型</span>
<div class="list-dots">
<div class="default-option">
<span class="option active" ng-click="filters['loanType'] = 'ALL'" ng-class="{ active: filters['loanType'] == 'ALL'}">不限</span>
</div>
<div class="custom-options">
<span class="option" ng-click="filters['loanType'] = 'BUSINESS'" ng-class="{ active: filters['loanType'] == 'BUSINESS'}">中小企业贷</span>
<span class="option" ng-click="filters['loanType'] = 'PERSONAL'" ng-class="{ active: filters['loanType'] == 'PERSONAL'}">个人贷</span>
</div>
</div>
</div>
<div>
<span class="filter-name clearfix">利率</span>
<div class="list-dots">
<div class="default-option">
<span class="option active" ng-click="filters['riskLevel'] = 'ALL';uniqueOrderBy('riskLevel');" ng-class="{ active: filters['riskLevel'] == 'ALL'}">不限</span>
</div>
<div class="custom-options">
<span class="option" ng-click="filters['riskLevel'] = 'HIGH';uniqueOrderBy('riskLevel');" ng-class="{ active: filters['riskLevel'] == 'HIGH'}">从高到低</span>
<span class="option" ng-click="filters['riskLevel'] = 'LOW';uniqueOrderBy('riskLevel');" ng-class="{ active: filters['riskLevel'] == 'LOW'}">从低到高</span>
</div>
</div>
</div>
<div>
<span class="filter-name clearfix">期限</span>
<div class="list-dots">
<div class="default-option">
<span class="option active" ng-click="filters['maturity'] = 'ALL'" ng-class="{ active: filters['maturity'] == 'ALL'}">不限</span>
</div>
<div class="custom-options">
<span class="option" ng-click="filters['maturity'] = 'LE12'" ng-class="{ active: filters['maturity'] == 'LE12'}">12个月及以下</span>
<span class="option" ng-click="filters['maturity'] = 'GT12'" ng-class="{ active: filters['maturity'] == 'GT12'}">12个月以上</span>
</div>
</div>
</div>
<div>
<span class="filter-name clearfix">剩余时间</span>
<div class="list-dots">
<div class="default-option">
<span class="option active" ng-click="filters['leftTime'] = 'ALL';uniqueOrderBy('leftTime');" ng-class="{ active: filters['leftTime'] == 'ALL'}">不限</span>
</div>
<div class="custom-options">
<span class="option" ng-click="filters['leftTime'] = 'HIGH';uniqueOrderBy('leftTime');" ng-class="{ active: filters['leftTime'] == 'HIGH'}">从高到低</span>
<span class="option" ng-click="filters['leftTime'] = 'LOW';uniqueOrderBy('leftTime');" ng-class="{ active: filters['leftTime'] == 'LOW'}">从低到高</span>
</div>
</div>
</div>
<div>
<span class="filter-name clearfix">还款方式</span>
<div class="list-dots">
<div class="default-option">
<span class="option active" ng-click="filters['loanRepayment'] = 'ALL'" ng-class="{ active: filters['loanRepayment'] == 'ALL'}">不限</span>
</div>
<div class="custom-options">
<span class="option" ng-click="filters['loanRepayment'] = 'Amortization'" ng-class="{ active: filters['loanRepayment'] == 'Amortization'}">等额本息</span>
<span class="option" ng-click="filters['loanRepayment'] = 'Session_Period'" ng-class="{ active: filters['loanRepayment'] == 'Session_Period'}">每月还息,按季度还本</span>
<span class="option" ng-click="filters['loanRepayment'] = 'Equal_Principal_Interest'" ng-class="{ active: filters['loanRepayment'] == 'Equal_Principal_Interest'}">等本等息</span>
<span class="option" ng-click="filters['loanRepayment'] = 'Half_Year_Period'" ng-class="{ active: filters['loanRepayment'] == 'Half_Year_Period'}">每月还息,按半年还本</span>
<span class="option" ng-click="filters['loanRepayment'] = 'DAILY'" ng-class="{ active: filters['loanRepayment'] == 'DAILY'}">天天还</span>
<span class="option" ng-click="filters['loanRepayment'] = 'Pay_At_The_End'" ng-class="{ active: filters['loanRepayment'] == 'Pay_At_The_End'}">每月还息,到期一次性还本</span>
</div>
</div>
</div>
<div class="" ng-show="!onlyGuaranteed">
<span class="filter-name clearfix">特色标</span>
<div class="list-dots">
<div class="default-option">
<span class="option active" ng-click="filters['loanFlag'] = 'ALL'" ng-class="{ active: filters['loanFlag'] == 'ALL'}">不限</span>
</div>
<div class="custom-options">
<span class="option" ng-click="filters['loanFlag'] = 'TRANSFERABLE'" ng-class="{ active: filters['loanFlag'] == 'TRANSFERABLE'}">本息回购</span>
<span class="option" ng-click="filters['loanFlag'] = 'COLLATERALIZED'" ng-class="{ active: filters['loanFlag'] == 'COLLATERALIZED'}">抵押</span>
<span class="option" ng-click="filters['loanFlag'] = 'GURANTEED'" ng-class="{ active: filters['loanFlag'] == 'GURANTEED'}">担保</span>
<span class="option" ng-click="filters['loanFlag'] = 'CASH_GURANTEED'" ng-class="{ active: filters['loanFlag'] == 'CASH_GURANTEED'}">现金担保</span>
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
    <div class="modal fade multiple-order-modal" id="multipleOrderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
     <div class="modal-dialog"> 
      <div class="modal-content"> 
       <div class="modal-header"> 
        <button type="button" class="close sl-icon-cross" data-dismiss="modal" aria-hidden="true"></button> 
        <h4 class="modal-title">批量投标</h4> 
       </div> 
       <div class="modal-body"> 
        <div class="before-multiple hidden"> 
         <div class="row"> 
          <div class="col-xs-1 col-xs-offset-2"> 
           <span class="sl-icon-warning lead"></span> 
          </div> 
          <div class="col-xs-9"> 
           <p>你的购物车里已有其他的贷款标， </p> 
           <p>此操作（批量创建订单）将会把购物车已有的标一同提交，</p> 
           <p>你确定要继续？</p> 
          </div> 
         </div> 
        </div> 
        <div class="start-multiple"> 
         <div class="progress"> 
          <div class="progress-bar" id="batch-investment"></div> 
         </div> 
         <p id="batch-loading" class="text-center"><i class="spinner sl-icon-loading"></i>批量投标中......<span class="times-text"></span></p> 
         <div id="batch-success" class="text-center hidden"> 
          <p>投标完成（成功<span class="success-num"></span>，失败<span class="error-num"></span>)<span class="times-text"></span></p> 
          <div class="bulk-option text-center"> 
           <span>再来</span>
           <input type="text" name="bulkTimes" placeholder="最多再来20次" class="times-again" />
           <span>遍</span> 
           <a href="index.jsp" class="btn btn-action continue-bulk">确定</a>
          </div> 
         </div> 
        </div> 
       </div> 
       <div class="modal-footer hidden"> 
        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button> 
        <button type="button" class="btn btn-action yes">确认投标</button> 
       </div> 
      </div>
      <!-- /.modal-content --> 
     </div>
     <!-- /.modal-dialog --> 
    </div>
    <!-- /.modal --> 
    <div class="modal fade" id="diversificationModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
     <div class="modal-dialog"> 
      <div class="modal-content"> 
       <div class="modal-header"> 
        <button type="button" class="close sl-icon-cross" data-dismiss="modal" aria-hidden="true"></button> 
        <h4 class="modal-title">分散投资提醒</h4> 
       </div> 
       <div class="modal-body"> 
        <p class="text-center"><span class="sl-icon-warning lead"></span>你的投资金额已超过此贷款标的10%，建议分散投标！</p> 
       </div> 
       <div class="modal-footer"> 
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button> 
        <button type="button" class="btn btn-action yes">确认投标</button> 
       </div> 
      </div>
      <!-- /.modal-content --> 
     </div>
     <!-- /.modal-dialog --> 
    </div>
    <!-- /.modal --> 
    <div id="invest-wizard" class="modal fade" role="dialog" aria-labelledby="loadMoneyWizardLabel" aria-hidden="true"> 
     <div class="modal-dialog modal-sm" ng-controller="CartCtrl"> 
      <div class="modal-content"> 
       <div> 
        <div class="modal-header text-center"> 
         <button type="button" class="close sl-icon-cross" data-dismiss="modal" aria-hidden="true"></button> 
         <h5 class="modal-title"><span class="sl-icon-check"></span> 恭喜你投资成功! </h5> 
        </div> 
        <div class="modal-body"> 
         <div class="clearfix investment-result text-center"> 
          <p>本次共投资<span class="signName" ng-if="!tabSwitch">散标项目(</span><span class="signName" ng-if="tabSwitch">债权项目(</span> <span class="signName">ID:{{bidId}})</span><span class="amount">&nbsp;{{bidAmount}}元</span>。 </p> 
          <div class="clearfix other-options"> 
           <div class="col-xs-6"> 
            <a href="/account/my-account#/invest-history" class="btn checkDetail">查看投资详情</a> 
           </div> 
           <div class="col-xs-6"> 
            <a href="market.html" class="btn  btn-secondary btn-embossed continueInvest" data-dismiss="modal">继续投资</a> 
           </div> 
          </div> 
         </div> 
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
    <script src="./static/js/jquery.js" type="text/javascript"></script>
    <script src="./static/js/common.js" type="text/javascript"></script>
 </body>
</html>