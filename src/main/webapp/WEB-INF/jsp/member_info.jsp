<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html dir="ltr" lang="zh-CN" xml:lang="zh-CN">
 <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <meta name="description" content="点融网为广大个人和微小企业提供便利的投融资服务。借款产品灵活、大额、费用低、手续快；投资方式人性友好、回报高、百分百本金保护！Dianrong.com provides online efficient investment and financing services for individuals and SMEs. Better rates, lower cost, faster way to borrowers and more flexible investment, higher returns, 100% principal protection to investors." /> 
  <meta name="keywords" content="P2P网贷,P2P网络贷款平台,P2P网络投资平台,P2P投资理财平台,网络贷款平台,团团赚,点融,点融网,点融官网" /> 
  <link rel="shortcut icon" href="static/images/favicon.ico" />
  <title>基本信息-member_info.html</title> 
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
         <a href="index.jsp" class="profile-avatar">
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
        <li><a href="member_index.jsp"><span class="sl-icon-account"></span>账户总览</a> </li>
        <li class="active"> <a href='member_info.jsp'><span class="sl-icon-profile"></span>基本信息</a> </li>
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
<div class="account-profile content-wrapper ng-scope">
<header class="section-header">
<h6 class="section-header-title">基本信息</h6>
</header>
<section class="basic summary-section">
<div class="basic-profile clearfix">
<div class="pull-left">
<a class="profile-header" data-toggle="modal" data-target="#upload-profile-image-modal" href="">
<img width="100%" ng-src="images/green-head.jpg" src="static/images/green-head.jpg">
</a>
</div>
<div class="pull-left">
<div class="field">
<h6 class="username ng-binding" ng-bind="basicProfile.name">Member_11501404</h6>
</div>
<div class="field clearfix">
<span class="pull-left">资料完整度</span>
<div class="pull-left">
<div class="progress">
<div id="security-tooltip" class="progress-bar" ng-style="{width:basicProfile.securityLevel + '%'}" data-original-title="" title="" style="width: 44.4444%;"></div>
</div>
<div class="verify-icons">
<ul class="list-unstyled list-inline">
<li class="ng-scope" ng-repeat="v in basicProfile.securityIcons">
<a class="verify-icon sl-icon-email" ng-class="{active:v.active}" title="" data-toggle="tooltip" href="" data-original-title="邮件认证"></a>
</li>
<li class="ng-scope" ng-repeat="v in basicProfile.securityIcons">
<a class="verify-icon sl-icon-profile" ng-class="{active:v.active}" title="" data-toggle="tooltip" href="" data-original-title="身份认证"></a>
</li>
<li class="ng-scope" ng-repeat="v in basicProfile.securityIcons">
<a class="verify-icon sl-icon-mobile active" ng-class="{active:v.active}" title="" data-toggle="tooltip" href="" data-original-title="手机号码验证"></a>
</li>
</ul>
</div>
</div>
<div class="pull-left">
<span class="security-level ng-binding" ng-bind="basicProfile.securityText">中</span>
</div>
</div>
</div>
</div>
</section>
<section class="summary-section">
<ul id="account-tabs" class="nav nav-tabs section-nav-tabs">
<li class="active">
<a data-toggle="tab" href="#personalInfo">个人信息</a>
</li>
<li>
<a data-toggle="tab" href="#bindAccount">关联账户</a>
</li>
</ul>
<div class="tab-content">
<div id="personalInfo" class="tab-pane active personal-info">
<div class="alert alert- ng-hide" ng-show="msg.length > 0" timeout="msgTimeout" msg="msg" type="msgType">
<a class="close sl-icon-cross" aria-hidden="true" ng-click="close()" type="button"></a>
</div>
<div class="info-content row">
<div class="col-xs-9">
<div class="info-row" ng-class="{editing:username.editing}">
<div class="row">
<div class="col-xs-3 info-value text-center">用户名</div>
<div class="col-xs-5" ng-show="!username.editing">
<span class="ng-binding" ng-bind="basicProfile.profile.userName">Member_11501404</span>
</div>
<div class="col-xs-8 ng-hide" ng-show="username.editing">
<input class="form-control input-sm ng-pristine ng-valid" maxlength="24" placeholder="输入用户名，可用用户名直接登录" ng-model="username.userName" ng-class="{inputError:username.userNameError}">
</div>
<div class="col-xs-4" ng-show="!username.editing && !basicProfile.profile.isUserNameSet">
<div>
<a class="btn btn-secondary bind-blue btn-hollow" href="" ng-click="username.editing=true">修改</a>
</div>
</div>
</div>
<div class="row ng-hide" ng-show="username.editing">
<div class="col-xs-3"></div>
<div class="col-xs-8">
<span class="display-block ng-binding bind-blue" ng-bind="username.msg | addAsterisk" ng-class="{'bind-red': username.userNameError, 'bind-blue': !username.userNameError}">*用户名仅可修改一次</span>
<span class="btn-group">
<a class="btn btn-secondary btn-confirm" href="" ng-click="changeUserName()">确定</a>
</span>
<span class="btn-group">
<a class="btn btn-secondary bind-blue btn-hollow" ng-click="cancelChangeUserName()" href="">取消</a>
</span>
</div>
</div>
</div>
<div class="info-row" ng-show="showId">
<div class="row">
<div class="col-xs-3 info-value text-center">用户ID</div>
<div class="col-xs-9">
<span class="ng-binding" ng-bind="actorId">11501404</span>
</div>
</div>
</div>
<div class="info-row row-line">
<div class="row" ng-show="!pwdChange.editing && !pwdSet.editing">
<div class="col-xs-3 info-value text-center">登录密码</div>
<div class="col-xs-5">
<span class="bind-gray ng-hide" ng-show="!isLandingPwdSet(basicProfile.profile)">未设置</span>
<span class="" ng-show="isLandingPwdSet(basicProfile.profile)">*********</span>
</div>
<div class="col-xs-4">
<div class="ng-hide" ng-show="!isLandingPwdSet(basicProfile.profile)">
<a class="btn btn-secondary bind-blue btn-hollow btn-bg-blue" ng-click="pwdSet.editing = true" href="">设置</a>
</div>
<div class="sl-icons" ng-show="isLandingPwdSet(basicProfile.profile)">
<a class="btn btn-secondary bind-blue btn-hollow" ng-click="pwdChange.editing = true" href="">修改</a>
</div>
</div>
</div>
<div class="row editing ng-hide" ng-show="pwdChange.editing">
<form class="ng-pristine ng-invalid ng-invalid-required" role="form" name="pwdForm">
<div class="row">
<div class="col-xs-3 info-value text-center">修改登录密码</div>
<div class="col-xs-8">
<input class="form-control input-sm ng-pristine ng-invalid ng-invalid-required" type="password" sl-atmost-forty-chars="" sl-atleast-eight-chars="" sl-contains-digits="" sl-contains-letters="" required="" ng-model="pwdChange.oldpwd" placeholder="输入原有登录密码" name="oldpwd" ng-class="{inputError:pwdMsg.oldpwdError}">
<div class="ng-hide ng-scope" name="oldpwd" sl-validation-errors="">
<span class="hide" ng-transclude="">
<span class="ng-scope" for="required" sl-error-message="">对不起，请输入密码</span>
<span class="ng-scope" for="containsLetters" sl-error-message="">你的密码必须包括至少一个字母</span>
<span class="ng-scope" for="containsDigits" sl-error-message="">你的密码必须包括至少一个数字</span>
<span class="ng-scope" for="atleastEightChars" sl-error-message="">你的密码必须至少为8个字符长</span>
<span class="ng-scope" for="atmostFortyChars" sl-error-message="">你的密码最多为40个字符长</span>
</span>
</div>
</div>
</div>
<div class="row">
<div class="col-xs-3"></div>
<div class="col-xs-8">
<input class="form-control input-sm ng-pristine ng-invalid ng-invalid-required" type="password" sl-atmost-forty-chars="" sl-atleast-eight-chars="" sl-contains-digits="" sl-contains-letters="" required="" ng-model="pwdChange.newpwd" placeholder="输入新登录密码（8位以上字母和数字组合）" name="newpwd" ng-class="{inputError:pwdMsg.newpwdError}">
<div class="ng-hide ng-scope" name="newpwd" sl-validation-errors="">
<span class="hide" ng-transclude="">
<span class="ng-scope" for="required" sl-error-message="">对不起，请输入密码"</span>
<span class="ng-scope" for="containsLetters" sl-error-message="">你的密码必须包括至少一个字母</span>
<span class="ng-scope" for="containsDigits" sl-error-message="">你的密码必须包括至少一个数字</span>
<span class="ng-scope" for="atleastEightChars" sl-error-message="">你的密码必须至少为8个字符长</span>
<span class="ng-scope" for="atmostFortyChars" sl-error-message="">你的密码最多为40个字符长</span>
</span>
</div>
</div>
</div>
<div class="row">
<div class="col-xs-3"></div>
<div class="col-xs-8">
<input class="form-control input-sm ng-pristine ng-invalid ng-invalid-required" type="password" sl-atmost-forty-chars="" sl-atleast-eight-chars="" sl-contains-digits="" sl-contains-letters="" required="" ng-model="pwdChange.newpwd2" placeholder="确认新密码" name="newpwd2" ng-class="{inputError:pwdMsg.newpwd2Error}">
<div class="ng-hide ng-scope" name="newpwd2" sl-validation-errors="">
<span class="hide" ng-transclude="">
<span class="ng-scope" for="required" sl-error-message="">对不起，请输入密码</span>
<span class="ng-scope" for="containsLetters" sl-error-message="">你的密码必须包括至少一个字母</span>
<span class="ng-scope" for="containsDigits" sl-error-message="">你的密码必须包括至少一个数字</span>
<span class="ng-scope" for="atleastEightChars" sl-error-message="">你的密码必须至少为8个字符长</span>
<span class="ng-scope" for="atmostFortyChars" sl-error-message="">你的密码最多为40个字符长</span>
</span>
</div>
</div>
</div>
<div class="row">
<div class="col-xs-3"></div>
<div class="col-xs-8">
<span class="display-block bind-red ng-binding" ng-bind="pwdMsg.msg | addAsterisk"></span>
<span class="btn-group">
<a class="btn btn-secondary btn-confirm" href="" ng-click="pwdChangeSubmit()">确定</a>
</span>
<span class="btn-group">
<a class="btn btn-secondary bind-blue btn-hollow" href="" ng-click="cancelChangePwd()">取消</a>
</span>
</div>
</div>
</form>
</div>
<div class="row editing ng-hide" ng-show="pwdSet.editing">
<form class="ng-pristine ng-invalid ng-invalid-required" role="form" name="pwdSetForm">
<div class="row">
<div class="col-xs-3 info-value text-center">修改登录密码</div>
<div class="col-xs-8">
<input class="form-control input-sm ng-pristine ng-invalid ng-invalid-required" type="password" sl-atmost-forty-chars="" sl-atleast-eight-chars="" sl-contains-digits="" sl-contains-letters="" required="" ng-model="pwdSet.newpwd" placeholder="输入新登录密码（8位以上字母和数字组合）" name="newpwdSet" ng-class="{inputError:pwdMsg.newpwdError}">
<div class="ng-hide ng-scope" name="newpwdSet" sl-validation-errors="">
<span class="hide" ng-transclude="">
<span class="ng-scope" for="required" sl-error-message="">对不起，请输入密码</span>
<span class="ng-scope" for="containsLetters" sl-error-message="">你的密码必须包括至少一个字母</span>
<span class="ng-scope" for="containsDigits" sl-error-message="">你的密码必须包括至少一个数字</span>
<span class="ng-scope" for="atleastEightChars" sl-error-message="">你的密码必须至少为8个字符长</span>
<span class="ng-scope" for="atmostFortyChars" sl-error-message="">你的密码最多为40个字符长</span>
</span>
</div>
</div>
</div>
<div class="row editing">
<div class="col-xs-3"></div>
<div class="col-xs-8">
<input class="form-control input-sm ng-pristine ng-invalid ng-invalid-required" type="password" sl-atmost-forty-chars="" sl-atleast-eight-chars="" sl-contains-digits="" sl-contains-letters="" required="" ng-model="pwdSet.newpwd2" placeholder="确认新密码" name="newpwd2Set" ng-class="{inputError:pwdMsg.newpwd2Error}">
<div class="ng-hide ng-scope" name="newpwd2Set" sl-validation-errors="">
<span class="hide" ng-transclude="">
<span class="ng-scope" for="required" sl-error-message="">对不起，请输入密码</span>
<span class="ng-scope" for="containsLetters" sl-error-message="">你的密码必须包括至少一个字母</span>
<span class="ng-scope" for="containsDigits" sl-error-message="">你的密码必须包括至少一个数字</span>
<span class="ng-scope" for="atleastEightChars" sl-error-message="">你的密码必须至少为8个字符长</span>
<span class="ng-scope" for="atmostFortyChars" sl-error-message="">你的密码最多为40个字符长</span>
</span>
</div>
</div>
</div>
<div class="row editing">
<div class="col-xs-3"></div>
<div class="col-xs-8">
<span class="display-block bind-red ng-binding" ng-bind="pwdMsg.msg | addAsterisk"></span>
<span class="btn-group">
<a class="btn btn-secondary btn-confirm" href="" ng-click="pwdSetSubmit()">确定</a>
</span>
<span class="btn-group">
<a class="btn btn-secondary bind-blue btn-hollow" href="" ng-click="cancelChangePwd()">取消</a>
</span>
</div>
</div>
</form>
</div>
</div>
<div class="info-row row-line" ng-class="{editing:userIdentity.editing}">
<div class="ng-scope" ng-if="!basicProfile.profile.isForeigner && !basicProfile.profile.isEnterprise">
<div class="row">
<div class="col-xs-3 info-value text-center">真实姓名</div>
<div class="col-xs-5" ng-show="!userIdentity.editing">
<span class="bind-gray ng-scope" ng-if="!basicProfile.profile.realName">未验证</span>
</div>
<div class="col-xs-8 ng-hide" ng-show="userIdentity.editing">
<input class="form-control input-sm ng-pristine ng-valid" ng-focus="userIdentity.realNameError = false" placeholder="输入您的真实姓名" ng-model="userIdentity.realName" ng-class="{inputError:userIdentity.realNameError}">
</div>
<div class="col-xs-4" ng-show="!userIdentity.editing && !basicProfile.securityIcons.idCard.active && !basicProfile.securityIcons.idCard.isNeedVerify">
<div class="sl-icons">
<a class="btn btn-secondary bind-blue btn-hollow btn-bg-blue" href="" ng-click="userIdentity.editing=true">立即验证</a>
</div>
</div>
<div class="col-xs-4 ng-hide" ng-show="!userIdentity.editing && !basicProfile.securityIcons.idCard.active && basicProfile.securityIcons.idCard.isNeedVerify">
<div class="sl-icons">
<a class="btn btn-secondary bind-blue btn-hollow btn-bg-blue" href="" data-target="#informationModal" data-toggle="modal">完善信息</a>
</div>
</div>
</div>
<div class="row">
<div class="col-xs-3 info-value text-center">身份证号</div>
<div class="col-xs-5" ng-show="!userIdentity.editing">
<span class="bind-gray ng-scope" ng-if="!basicProfile.profile.idCard">未验证</span>
</div>
<div class="col-xs-8 ng-hide" ng-show="userIdentity.editing">
<input class="form-control input-sm ng-pristine ng-valid" maxlength="18" ng-focus="userIdentity.idNumberError = false" placeholder="输入18位身份证号" ng-model="userIdentity.idNumber" ng-class="{inputError:userIdentity.idNumberError}">
</div>
</div>
<div class="row ng-hide" ng-show="userIdentity.editing">
<div class="col-xs-3"></div>
<div class="col-xs-8">
<span class="bind-red display-block ng-binding" ng-bind="userIdentity.msg | addAsterisk"></span>
<span class="btn-group">
<a class="btn btn-secondary btn-confirm" href="" ng-click="bindIDAndName()">立即验证</a>
</span>
<span class="btn-group">
<a class="btn btn-secondary bind-blue btn-hollow" href="" ng-click="cancelBindIDAndName()">取消</a>
</span>
</div>
</div>
</div>
</div>
<div class="info-row">
<form class="ng-pristine ng-valid ng-valid-required" name="verifyEmailForm">
<div class="row" ng-class="{editing:(userEmail.editing),'close-edit':userEmail.emailSent}">
<div class="col-xs-3 info-value text-center">绑定邮箱</div>
<div class="col-xs-5">
<div class="" ng-show="!userEmail.editing">
<span class="ng-binding ng-scope" ng-bind="userEmail.email" ng-if="!userEmail.isVerified && userEmail.email">416148489@qq.com</span>
</div>
</div>
<div class="col-xs-8 ng-hide" ng-show="userEmail.editing">
<input id="account-email" class="form-control email input-sm ng-pristine ng-valid ng-valid-required" type="text" sl-email="" autocomplete="off" placeholder="输入绑定的邮箱地址，提升安全等级" required="" ng-model="userEmail.email" ng-class="{inputError:userEmail.emailError}" name="email">
<div class="ng-hide ng-scope" name="email" sl-validation-errors="">
<span class="hide" ng-transclude="">
<span class="ng-scope" for="email" sl-error-message="">请输入有效的邮箱地址</span>
</span>
</div>
</div>
<div class="col-xs-4" ng-show="!userEmail.emailSent">
<div class="sl-icons" ng-show="!userEmail.isVerified && !userEmail.editing">
<a class="btn btn-secondary bind-blue btn-hollow btn-bg-blue ng-scope" ng-click="sendVerifyEmail()" ng-if="userEmail.email" ng-href="http://mail.qq.com" target="_blank" href="http://mail.qq.com">登录邮箱绑定</a>
</div>
<div class="sl-icons ng-hide" ng-show="userEmail.isVerified && !userEmail.editing">
<a class="btn btn-secondary bind-blue btn-hollow" ng-click="userEmail.editing = true" href="">修改</a>
</div>
</div>
</div>
<div class="row editing ng-hide" ng-show="userEmail.editing">
<div class="col-xs-3"></div>
<div class="col-xs-8">
<span class="bind-red display-block ng-binding" ng-bind="userEmail.msg | addAsterisk"></span>
<span class="ng-hide" ng-show="userEmail.emailSent">
验证邮件已发送，立即
<a target="_blank" ng-href="http://mail.qq.com" href="http://mail.qq.com">登录邮箱</a>
进行绑定
</span>
<span class="btn-group" ng-show="!userEmail.emailSent">
<a class="btn btn-secondary btn-confirm" ng-click="sendVerifyEmail()" href="">立即绑定</a>
</span>
<span class="btn-group" ng-show="!userEmail.emailSent">
<a class="btn btn-secondary bind-blue btn-hollow" ng-click="cancelSendVerifyEmail()" href="">取消</a>
</span>
</div>
</div>
</form>
</div>
<div class="info-row">
<div class="row" ng-show="!cellphoneVerification.phoneEditing">
<div class="col-xs-3 info-value text-center">绑定手机</div>
<div class="col-xs-5">
<span class="ng-binding ng-scope" ng-if="cellphoneVerification.isVerified">180****1538</span>
</div>
<div class="col-xs-3">
<div class="sl-icons bind-green ng-scope" ng-if="cellphoneVerification.isVerified">
<a class="btn btn-secondary bind-blue btn-hollow" href="" ng-click="cellphoneVerification.phoneEditing=true">修改</a>
</div>
</div>
</div>
<div class="row editing ng-hide" ng-show="cellphoneVerification.phoneEditing">
<form class="form-horizontal verifyCellphoneForm ng-pristine ng-invalid ng-invalid-required" novalidate="" role="form" name="verifyCellphoneForm">
<div class="row">
<div class="col-xs-3 info-value text-center">绑定手机</div>
<div class="col-xs-8">
<input class="form-control phone input-sm ng-pristine ng-invalid ng-invalid-required" type="text" sl-mobile-phone="" autocomplete="off" placeholder="输入新的手机号码" maxlength="11" required="" ng-model="verificationInfo.phone" ng-class="{inputError:cellphoneVerification.phoneError}" name="phone">
<div class="ng-hide ng-scope" name="phone" sl-validation-errors="">
<span class="hide" ng-transclude="">
<span class="ng-scope" for="mobilePhone" sl-error-message="">手机号码格式不正确</span>
</span>
</div>
</div>
</div>
<div class="row">
<div class="col-xs-3 info-value text-center"></div>
<div class="col-xs-5">
<input class="form-control phone-verify-input input-sm ng-pristine ng-invalid ng-invalid-required" type="text" placeholder="输入验证码" ng-model="verificationInfo.phoneVerifyCode" maxlength="6" required="" ng-class="{inputError:cellphoneVerification.verifyCodeError}" name="phoneVerifyCode">
</div>
<div class="col-xs-3">
<a class="btn btn-secondary btn-bg-blue verifyPhoneSubmit ng-binding" ng-disabled="verifyCellphoneForm.phone.$invalid|| cellphoneVerification.phoneCodeSent || cellphoneVerification.phoneCodeSending" title="点击发送验证码" ng-click="sendPhoneCode()" disabled="disabled">
发送验证码
<span class="phoneCountDown ng-binding ng-hide" ng-show="cellphoneVerification.phoneCodeSent">（60）</span>
</a>
<small class="phone-code-info ng-binding ng-hide" ng-bind="cellphoneVerification.codemsg" ng-show="cellphoneVerification.phoneCodeSent"></small>
</div>
</div>
<div class="row">
<div class="col-xs-3"></div>
<div class="col-xs-8">
<span class="bind-red display-block ng-binding" ng-bind="cellphoneVerification.msg | addAsterisk"></span>
<span class="btn-group">
<a class="btn btn-secondary btn-confirm" ng-click="submitVerificationCode()" href="">立即绑定</a>
</span>
<span class="btn-group">
<a class="btn btn-secondary bind-blue btn-hollow" ng-click="cancelVerifyPhone()" href="">取消</a>
</span>
</div>
</div>
</form>
</div>
</div>
</div>
</div>
</div>
<div id="bindAccount" class="tab-pane social-account-panel">
<span class="field">关联第三方账号，快速登录点融网，获取第一手新鲜资讯！</span>
<div class="social-account clearfix">
<div class="social-account-col pull-left">
<div class="social-icon-div">
<img class="img-rounded binding-img" ng-class="{active: isWechatBound(basicProfile.profile)}" src="/static/images/account/bind-wechat.png">
</div>
</div>
<div class="social-account-col erweima-content pull-left ng-scope" ng-if="!isWechatBound(basicProfile.profile)">
<img src="/static/images/account/erweima-small.png">
</div>
<div class="social-account-col pull-left ng-scope" ng-if="!isWechatBound(basicProfile.profile)">
<div class="wechat-desc">
<h6>微信</h6>
<ul class="wechat-bind-step">
<li>关注点融网微信服务号：dianrongvip</li>
<li>根据微信提示，用点融网账户与微信号关联</li>
</ul>
</div>
</div>
</div>
<div class="social-account clearfix">
<div class="social-account-col pull-left">
<div class="social-icon-div">
<img class="img-rounded binding-img" ng-class="{active: isWeiboBound(basicProfile.profile)}" src="/static/images/account/bind-weibo.png">
</div>
</div>
<div class="social-account-col weibo-content pull-left">
<h6>新浪微博</h6>
<p>http://weibo.com</p>
<a class="btn btn-sm btn-secondary btn-embossed btn-smaller ng-scope" ng-click="weiboBind()" ng-if="!isWeiboBound(basicProfile.profile)" href="">马上关联</a>
</div>
</div>
<div class="social-account clearfix">
<div class="social-account-col pull-left">
<div class="social-icon-div">
<img class="img-rounded binding-img" ng-class="{active: isQQBound(basicProfile.profile)}" src="/static/images/account/bind-qq.png">
</div>
</div>
<div class="social-account-col weibo-content pull-left">
<h6>QQ</h6>
<p>http://www.qq.com</p>
<a class="btn btn-sm btn-secondary btn-embossed btn-smaller ng-scope" ng-click="qqBind()" ng-if="!isQQBound(basicProfile.profile)" href="">马上关联</a>
</div>
</div>
</div>
</div>
</section>
<div id="upload-profile-image-modal" class="modal fade" aria-hidden="true" role="dialog" tabindex="-1">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<span style="font-size: 20px;">修改头像</span>
<button class="close sl-icon-cross" aria-hidden="true" data-dismiss="modal" type="button"></button>
</div>
<div class="modal-body">
<div class="modal-wrapper">
<div class="row summary-section fields">
<div class="col-xs-10 col-xs-offset-1 uploadfile-wrapper">
<div>
<span id="fileinput-button" class="btn btn-success fileinput-button">
<i class="glyphicon glyphicon-plus"></i>
<span>选择文件...</span>
<input id="fileupload" type="file" name="pictureFile">
</span>
<a id="reselect-image" class="" href="" style="margin-left: 20px">取消</a>
<p class="bg-success">你可以上传JPG，GIF或PNG文件（文件大小限制为4 MB）</p>
<div id="files" class="files"></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div id="informationModal" class="modal fade information-modal ng-scope" aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button class="close sl-icon-cross" ng-click="cancelVerifyPhone()" aria-hidden="true" data-dismiss="modal" type="button"></button>
<h4 class="modal-title">完善个人信息</h4>
</div>
<div class="modal-body">
<div class="row ng-binding"> 用户： </div>
<div class="row">
您还未验证您的
<span class="ng-hide" ng-show="basicProfile.profile.realName">身份证号</span>
<span class="" ng-show="!basicProfile.profile.realName">真实姓名</span>
，请致电客服电话
</div>
<div class="row telephone"> 400-921-9218 </div>
<div class="row"> 完善个人信息，继续赚钱投资 </div>
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
           <a class="btn  btn-action" href="index.html" ng-click="linkToRecharge()">立即充值投资</a>
          </div> 
          <div ng-show="!fromLC">
           <a class="btn btn-block btn-action" href="market.html" target="_blank">立即投资</a>
          </div> 
         </div> 
         <div class="col-xs-5 col-xs-offset-1 qr"> 
          <img src="static/images/qr-sub.png" />
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