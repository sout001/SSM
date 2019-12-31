<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html dir="ltr" lang="zh-CN" xml:lang="zh-CN">
 <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <meta name="description" content="点融网为广大个人和微小企业提供便利的投融资服务。借款产品灵活、大额、费用低、手续快；投资方式人性友好、回报高、百分百本金保护！Dianrong.com provides online efficient investment and financing services for individuals and SMEs. Better rates, lower cost, faster way to borrowers and more flexible investment, higher returns, 100% principal protection to investors." /> 
  <meta name="keywords" content="P2P网贷,P2P网络贷款平台,P2P网络投资平台,P2P投资理财平台,网络贷款平台,团团赚,点融,点融网,点融官网" /> 
  <link rel="shortcut icon" href="./static/images/favicon.ico" />
  <title>我要借款- borrow.html</title> 
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
  <div class="wrapper borrower-landing"> 
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
       <li class="dropdown"> <a href="member_info.html" class="dropdown-toggle hoverHeader" ng-show="session.firstLoaded &amp;&amp; session.actor.username" data-toggle="dropdown" data-hover="dropdown">素材火的账户 <b class="caret"></b></a> 
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
     <div class="jumbotron"> 
      <div id="borrower-banner" class="container hero" ng-controller="LandingCtrl"> 
       <div class="row"> 
        <div class="col-xs-8 invisible"> 
         <h5 class="slogan">一笔资金，一些梦想</h5> 
         <div id="carousel-borrower" class="carousel slide" data-ride="carousel" data-interval="1000000" data-pause="hover"> 
          <div class="carousel-inner"> 
           <div class="item" style="display: block"> 
            <span class="carousel-caption-icon"></span> 
            <h3>申请，审核，放款，24小时搞定</h3> 
            <h6>开放透明的平台，行业最低借款费用，拒绝利差！</h6> 
            <div class="actions"> 
             <a sl-old-href="" url="/borrower/create-account" class="btn btn-secondary btn-embossed" target="_blank">立即注册申请贷款</a> 
            </div> 
           </div> 
          </div> 
         </div> 
        </div> 
        <div class="col-xs-4 check-rate-form"> 
         <h5 class="slogan check-rate-form-title">我需要资金</h5> 
         <div class="select-loan" ng-cloak=""> 
          <div class="tab-content" id="container"> 
           <div class="tab-pane active" id="business-loan" ng-controller="SelectLoanFormCtrl" ng-init="loanType = 'BUSINESS'"> 
            <form name="verifyBusinessLoanForm" class="form-vertical" role="form" ng-submit="submit()" ng-hide="content" novalidate=""> 
             <div class="form-group" sl-popover="popoverMessage"> 
              <input type="text" name="username" ng-model="username" required="" placeholder="真实姓名" class="form-control flat" value="" /> 
              <div sl-validation-errors="" name="username" ng-class="ng-hide" ng-cloak=""> 
               <span sl-error-message="" for="required">请输入真实姓名！</span> 
              </div> 
             </div> 
             <div class="form-group" sl-popover="popoverMessage"> 
              <input type="text" name="mobile" ng-model="mobile" required="" placeholder="手机号码" class="form-control flat" value="" sl-mobile-phone="" /> 
              <div sl-validation-errors="" name="mobile" ng-class="ng-hide" ng-cloak=""> 
               <span sl-error-message="" for="required">请输入手机号</span> 
               <span sl-error-message="" for="mobilePhone">手机号输入有误</span> 
              </div> 
             </div> 
             <div class="form-group"> 
              <button class="btn btn-block btn-action btn-embossed" type="submit">即刻申请</button> 
             </div> 
            </form> 
            <div class="form-group" ng-hide="!content"> 
             <div id="regist-success">
              注册成功，稍后会有工作人员与您联系。谢谢！
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
   <div class="borrower-content" ng-controller="BorrowerCtrl"> 
    <nav id="borrower-nav" class="landing-nav clearfix affix-top" data-spy="affix" data-offset-top="390"> 
     <div class="container"> 
      <ul class="nav navbar-nav navbar-left"> 
       <li class="active"> <a sl-scroll-to="" enable-old-ie="true" anchor="borrower-what-is-dianrong" data-target="#borrower-what-is-dianrong"> <span class="link-text">什么是点融网</span> </a> </li> 
       <li> <a sl-scroll-to="" enable-old-ie="true" anchor="borrower-testimony" data-target="#borrower-testimony"> <span class="link-text">为什么选择点融网</span> </a> </li> 
       <li> <a sl-scroll-to="" enable-old-ie="true" anchor="four-steps-borrow" data-target="#four-steps-borrow"> <span class="link-text">点融网贷款流程</span> </a> </li> 
       <li> <a sl-scroll-to="" enable-old-ie="true" anchor="borrower-simple-faq" data-target="#borrower-simple-faq"> <span class="link-text">常见问题</span> </a> </li> 
      </ul> 
      <div class="nav navbar-nav navbar-right landing-nav-actions"> 
       <a href="/account/create?type=borrower" class="btn navbar-btn btn-action btn-embossed">立即申请贷款</a> 
      </div> 
     </div> 
    </nav> 
    <div id="tutorial"> 
     <section id="borrower-what-is-dianrong" class="container landing-about-us"> 
      <div id="borrower-what-is-dianrong-header"> 
       <h5 class="tutorial-section-title">什么是点融网?</h5> 
       <h6 class="tutorial-section-subtitle">借贷也可以很幸福哦!</h6> 
      </div> 
      <div class="row"> 
       <div class="col-xs-5"> 
        <img src="./static/images/tutorial-boss-heads.png" />
       </div> 
       <div class="col-xs-7 tutorial-content"> 
        <h3>最好的<span>管理团队</span></h3> 
        <ul class="list-inline tutorial-content-point"> 
         <li>出色的专业素养</li> 
         <li>毕业于世界著名学府, 8人出自美国常青藤学院</li> 
         <li>各自专业领域中的佼佼者</li> 
        </ul> 
        <ul class="list-inline tutorial-content-point"> 
         <li>丰富的实践经验</li> 
         <li>平均拥有15年以上国际知名企业的工作经验</li> 
         <li>6人曾经自主创业</li> 
         <li>4人曾经从事国内银行相关金融管理</li> 
        </ul> 
        <a href="/public/about#/leadership" class="btn btn-outline-action">了解详情</a> 
       </div> 
      </div> 
      <div class="row"> 
       <div class="col-xs-7 tutorial-content technology"> 
        <h3>强大的<span>技术平台</span></h3> 
        <ul class="list-inline tutorial-content-point"> 
         <li>领先的P2P技术</li> 
         <li>创始人来自全球最大网络借贷平台Lending Club</li> 
         <li>引进Lending Club的先进技术和管理经验</li> 
         <li>P2P技术鼻祖, 只做纯正的P2P网贷</li> 
        </ul> 
        <ul class="list-inline tutorial-content-point"> 
         <li>透明的自主借贷</li> 
         <li>简易高效的操作, 自助式借贷轻松借款投标</li> 
         <li>先进技术实现最低的审核成本</li> 
        </ul> 
       </div> 
       <div class="col-xs-5"> 
        <img src="./static/images/tutorial-radish.png" />
       </div> 
      </div> 
      <div class="row tutorial-risk-control-bg"> 
       <div class="col-xs-5"> 
       </div> 
       <div class="col-xs-7 tutorial-content riskmanagement"> 
        <h3>严格的<span>风险控制</span></h3> 
        <ul class="list-inline tutorial-content-point"> 
         <li>完备的校验流程</li> 
         <li>基于多家商业银行7年数据研发的近100个风险模型</li> 
         <li>互联网信息源、多个第三方信息源、50多条信息校验规则及人工深层排查防止欺诈风险</li> 
         <li>历史坏账率1%以下，历史年化收益率达15-18%</li> 
        </ul> 
        <ul class="list-inline tutorial-content-point"> 
         <li>切实的法律保障</li> 
         <li>共同创始人拥有数十年法律金融行业经验</li> 
         <li>律师团队全程控制合约风险及合规监控</li> 
         <li>国资企业东方资产为合作伙伴</li> 
        </ul> 
       </div> 
      </div> 
     </section> 
     <section id="borrower-testimony" class="landing-testimony"> 
      <div class="container"> 
       <h5 class="tutorial-section-title">为什么选择点融网?</h5> 
       <ul class="list-inline"> 
        <li> 
         <div class="landing-testimony-item1"> 
          <img src="./static/images/tutorial-free-charge.png" />
         </div> <h5><span>1</span> 无手续费</h5> 
         <ul class="list-unstyled"> 
          <li>我们最大的特色在于去掉了借</li> 
          <li>款的中间环节，不收取手续费</li> 
         </ul> </li> 
        <li> 
         <div class="landing-testimony-item2"> 
          <img src="./static/images/tutorial-low-interest.png" />
         </div> <h5><span>2</span> 超低利息</h5> 
         <ul class="list-unstyled"> 
          <li>绝大数借款利息在12-18%</li> 
          <li>远低于民间利息</li> 
         </ul> </li> 
        <li> 
         <div class="landing-testimony-item3"> 
          <img src="./static/images/tutorial-quick-progress.png" />
         </div> <h5><span>3</span> 快速审批</h5> 
         <ul class="list-unstyled"> 
          <li>审批直接在网上完成，无需出</li> 
          <li>门，大大减少时间精力</li> 
         </ul> </li> 
        <li> 
         <div class="landing-testimony-item4"> 
          <img src="./static/images/tutorial-quick-funding.png" />
         </div> <h5><span>4</span> 迅速筹标</h5> 
         <ul class="list-unstyled"> 
          <li>历史筹标时间基本在24小时满</li> 
          <li>标，第三方支持系统马上转账</li> 
         </ul> </li> 
       </ul> 
      </div> 
     </section> 
     <section id="four-steps-borrow" class="clearfix"> 
      <div class="col-xs-8 col-xs-offset-2"> 
       <h5 class="tutorial-section-title">轻松四步，借款无烦恼!</h5> 
       <div class="row"> 
        <div class="four-steps-borrow-col1 col-xs-6"> 
         <div class="four-steps-borrow-item1"> 
          <figure> 
           <img src="./static/images/tutorial-apply-loan-progress-01.png" />
           <figcaption> 
            <span>1</span> 
            <div> 
             <h4>完成<span>注册</span>成为借款人</h4> 
             <p>超轻松注册</p> 
            </div> 
           </figcaption> 
          </figure> 
         </div> 
         <div class="four-steps-borrow-item3"> 
          <figure> 
           <img src="./static/images/tutorial-apply-loan-progress-04.png" />
           <figcaption> 
            <span>3</span> 
            <div> 
             <h4>快速审批</h4> 
             <p>1-3个工作日内完成审批</p> 
            </div> 
           </figcaption> 
          </figure> 
         </div> 
        </div> 
        <div class="four-steps-borrow-col2  col-xs-6"> 
         <div class="four-steps-borrow-item2"> 
          <figure> 
           <img src="./static/images/tutorial-apply-loan-progress-02.png" />
           <figcaption> 
            <span>2</span> 
            <div> 
             <h4>提交审批材料</h4> 
             <p>降低借贷成本</p> 
            </div> 
           </figcaption> 
          </figure> 
         </div> 
         <div class="four-steps-borrow-item4"> 
          <figure> 
           <img src="./static/images/tutorial-apply-loan-progress-03.png" />
           <figcaption> 
            <span>4</span> 
            <div> 
             <h4>出资人投标</h4> 
             <p>迅速取得融资</p> 
            </div> 
           </figcaption> 
          </figure> 
         </div> 
        </div> 
       </div> 
      </div> 
     </section> 
     <section id="borrower-simple-faq" class="landing-section landing-simple-faq" ng-controller="LandingFaqCtrl"> 
      <div class="container"> 
       <span class="icon-landing-section-dianrong-logo"></span> 
       <header> 
        <span class="faq-icon">FAQ</span> 
        <h4 class="faq-icon-title">常见问题</h4> 
        <h6>你有问题，我们有解答</h6> 
       </header> 
       <div class="row"> 
        <sl-faq faq="borrowerFaq"></sl-faq> 
       </div> 
       <div class="more"> 
        <span>有更多问题？请查看<a href="/public/help-center#/faq">帮助中心</a></span> 
       </div> 
      </div> 
     </section> 
    </div> 
   </div> 
   <div id="call-to-action"> 
    <div class="container footer-decor"> 
     <h4>实现梦想的路上需要各种助力</h4> 
     <p><a class="btn btn-lg btn-action btn-embossed" href="/account/create?type=borrower">立即申请贷款</a></p> 
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
 </body>
</html>