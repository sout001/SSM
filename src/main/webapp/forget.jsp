<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html dir="ltr" lang="zh-CN" xml:lang="zh-CN">
 <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <meta name="description" content="点融网为广大个人和微小企业提供便利的投融资服务。借款产品灵活、大额、费用低、手续快；投资方式人性友好、回报高、百分百本金保护！Dianrong.com provides online efficient investment and financing services for individuals and SMEs. Better rates, lower cost, faster way to borrowers and more flexible investment, higher returns, 100% principal protection to investors." /> 
  <meta name="keywords" content="P2P网贷,P2P网络贷款平台,P2P网络投资平台,P2P投资理财平台,网络贷款平台,团团赚,点融,点融网,点融官网" /> 
  <link rel="shortcut icon" href="./static/images/favicon.ico" />
  <title>忘记密码-forget.html</title> 
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
        <ul class="dropdown-menu" ng-show="cart.amountSum == 0"> 
         <li class="shopping-cart-empty"> <p>你还没有投标，查看<a href="/market">热投项目</a>，立即开启投资之旅！</p> </li> 
        </ul> 
        <!-- Shopping Cart Widget: Invested --> 
        <ul class="dropdown-menu" ng-show="cart.amountSum != 0" ng-controller="CartCtrl"> 
         <li class="shopping-cart-title"> <span>投标 <strong>{{ cart.itemsCount}}笔</strong> </span> <span class="pull-right"> 总额<span ng-bind-html="cart.amountSum | slMoney"></span> </span> </li> 
         <li class="divider"></li> 
         <li ng-repeat="item in cart.items" class="shopping-cart-item" ng-mouseover="show = true" ng-mouseleave="show = false" ng-init="show = false"> <a href="#"> <span>{{item.loanTitle| slStringTruncate:18}}</span> <span ng-bind-html="item.amount | slMoney" ng-class="{hidden:show}"></span> <span data-toggle="modal" data-target="#deleteCartItem" class="sl-icon-trash hidden" ng-click="transId(item.loanId)" ng-class="{hidden:!show}"></span> </a> </li> 
         <li class="divider"></li> 
         <li class="shopping-cart-checkout"> <a id="checkout-shopping-cart" href="/market/checkout" class="btn btn-sm btn-primary btn-block btn-embossed">查看购物车</a> </li> 
        </ul> </li> 
       <!-- My Account Menu --> 
       <li class="dropdown"> <a href="member_info.jsp" class="dropdown-toggle hoverHeader" ng-show="session.firstLoaded &amp; amp; &amp; amp; session.actor.username" data-toggle="dropdown" data-hover="dropdown">{{session.actor.displayName?session.actor.displayName:session.actor.username}}的账户 <b class="caret"></b></a>
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
          <li class="main-link-list" ng-class="{active:isActive('/market')}"> <a class="main-link" href="/market"> <span class="main-link-text">我要投资</span> </a> </li> 
          <li class="main-link-list" ng-class="{active:isActive('/public/borrower')}"> <a class="main-link" href="/public/borrower"> <span class="main-link-text">我要借款</span> </a> </li> 
          <li class="main-link-list" ng-class="{active:isActive('/public/help-center')}"> <a class="main-link" href="/public/help-center"> <span class="main-link-text">帮助中心</span> </a> </li> 
          <li class="main-link-list" ng-class="{active:isActive('/public/about')}"> <a class="main-link" href="/public/about"> <span class="main-link-text">关于我们</span> </a> </li> 
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
   <div id="notifications" ng-show="notify.messages.msg.length &amp; gt; 0" class="ng-cloak affix-top" data-spy="affix" data-offset-top="0"> 
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
   <div class="container find-pwd-container"> 
    <div class="findPwd-content"> 
     <div class="password-reset-wrapper dialog dialog-default" ng-controller="PasswordResetFormCtrl"> 
      <h4 class="find-pwd">找回密码</h4> 
      <div ng-repeat="error in errors" ng-show="errors.length &amp; gt; 0" class="alert-msg ng-cloak">
        {{error}} 
      </div> 
      <form class="form-horizontal ng-pristine ng-invalid ng-invalid-required" ng-show="firstStep" novalidate="" name="passwordResetForm" role="form"> 
       <div class="form-group description-line">
         请输入您绑定点融账号的手机号码/邮箱 
       </div> 
       <div class="form-group input-row"> 
        <div class="input-group"> 
         <span class="input-group-addon sl-icon-personal personal" ng-class="{active:inputFocus} "></span> 
         <input id="account-email-phone" class="form-control input-phone-email ng-pristine ng-invalid ng-invalid-required" type="text" required="" ng-blur="inputFocus = false" ng-focus="inputFocus = true" placeholder="请输入注册时的手机号或邮箱" ng-model="user.emailOrPhone" name="emailOrPhone" /> 
        </div> 
       </div> 
       <div class="form-group"> 
        <div class="input-group"> 
         <span class="input-group-addon sl-icon-puzzle" ng-class="{active:inputCode} "></span> 
         <input class="form-control input-code ng-pristine ng-invalid ng-invalid-required" type="text" required="" ng-blur="inputCode = false" ng-focus="inputCode = true" placeholder="输入校验码" ng-model="user.captchaVerifyCode" name="captchaCode" /> 
        </div> 
        <span class="captcha-line"> <img class="captcha-img" ng-src="https://www.dianrong.com/images/captcha.jpg" src="https://www.dianrong.com/images/captcha.jpg" /> <a class="btn btn-primary btn-embossed refresh-captcha" ng-click="refreshCaptcha()"> <span class="sl-icon-repayment"></span> </a> </span> 
       </div> 
       <div class="form-group "> 
        <button class="btn btn-wide btn-primary btn-embossed first-step" ng-click="toNextStep()" ng-disabled="passwordResetForm.emailOrPhone.$invalid || passwordResetForm.captchaCode.$invalid || verifying" disabled="disabled">下一步</button> 
       </div> 
      </form> 
      <form class="form-horizontal ng-cloak" role="form" name="verifyCodeForm" ng-submit="verifyCode()" novalidate="" ng-show="secondStep"> 
       <div class="form-group"> 
        <span class="through-type" ng-show="sendByPhone">系统已经发送一条短信到{{hideTxt}}</span> 
        <div ng-show="sendByPhone" class="desc-msg-line">
          请输入短信的验证码 
        </div> 
        <span class="through-type through-type-mail" ng-show="sendByEmail">系统已经发送邮件到{{hideTxt}}</span> 
        <div ng-show="sendByEmail" class="desc-msg-line-mail">
          请输入邮件中的验证码重置您的密码 
        </div> 
       </div> 
       <div class="form-group hidden"> 
        <input type="text" class="form-control" id="account-email-phone2" name="emailOrPhone" ng-model="user.emailOrPhone" placeholder="请输入注册时的手机号或邮箱" required="" /> 
       </div> 
       <div class="form-group input-line"> 
        <div class="input-group"> 
         <span class="input-group-addon sl-icon-eye" ng-class="{active:inputFocus} "></span> 
         <input type="text" class="form-control input-verifyCode" id="confCode" name="confCode" ng-model="user.confCode" placeholder="输入验证码" ng-focus="inputFocus = true" ng-blur="inputFocus = false" required="" /> 
         <button ng-click="submit()" class="btn btn-primary sent-msg" ng-disabled="codeSented || codeSending">{{sendType}}</button> 
        </div> 
       </div> 
       <div class="form-group"> 
        <div ng-repeat="msg in msgs" ng-show="msgs.length &amp; gt; 0" class="notify-msg ng-cloak">
          {{msg}} 
        </div> 
       </div> 
       <div class="form-group first-last-step"> 
        <button type="submit" class="btn  btn-primary btn-embossed" ng-disabled="verifyCodeForm.$invalid || verifyConf">下一步</button> 
       </div> 
      </form> 
      <div ng-show="secondStep" class="choose-other-type" ng-cloak=""> 
       <a href="forget.html" ng-click="toFirstStep()">选择其他方式找回密码 &gt;</a> 
      </div> 
      <form class="form-horizontal ng-cloak" role="form" novalidate="" name="passwordResetCodeForm" ng-show="thirdStep" ng-submit="submitCode()"> 
       <div class="form-group desc-reset-pwd">
         请重设您的账号密码 
       </div> 
       <div class="form-group"> 
        <div class="input-group"> 
         <span class="input-group-addon sl-icon-lock" ng-class="{active:focus} "></span> 
         <input type="password" class="form-control input-phone-email" id="password" name="password" ng-model="user.password" placeholder="请设置新密码（8位以上字母和数字的组合）" ng-focus="focus = true" ng-blur="focus = false" required="" /> 
        </div> 
       </div> 
       <div class="form-group"> 
        <div class="input-group"> 
         <span class="input-group-addon sl-icon-lock" ng-class="{active:focusing} "></span> 
         <input type="password" class="form-control input-phone-email" id="passwordConfirmation" name="passwordConfirmation" ng-model="user.passwordConfirmation" placeholder="请确认新密码" ng-focus="focusing = true" ng-blur="focusing = false" required="" /> 
        </div> 
       </div> 
       <div class="form-group"> 
        <div ng-repeat="msg in messages" ng-show="messages.length &amp; gt; 0" class="reset-msg ng-cloak">
          {{msg}} 
        </div> 
       </div> 
       <div class="form-group"> 
        <button type="submit" class="btn  btn-primary btn-embossed reset-button" ng-disabled="passwordResetCodeForm.$invalid || submitResetPwd">提交</button> 
       </div> 
      </form> 
      <form class="form-horizontal ng-cloak" ng-show="showLast" ng-cloak=""> 
       <div class="reset-successful">
         密码重置成功! 
       </div> 
       <div class="auto-link-home">
         {{CountDown}}s后跳转至点融网主页 
       </div> 
       <div class="manual-link-home"> 
        <a href="index.jsp">立即进入点融网首页</a>
       </div> 
      </form> 
     </div> 
    </div> 
   </div> 
   <!--footer--> 
   <div class="bottom-menu bottom-menu-large bottom-menu-inverse sl-footer open-bottom footer-animate  footer-navbar" ng-cloak=""> 
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