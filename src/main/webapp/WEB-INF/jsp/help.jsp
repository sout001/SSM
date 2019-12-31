<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html dir="ltr" lang="zh-CN" xml:lang="zh-CN">
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
        <meta name="description" content="点融网为广大个人和微小企业提供便利的投融资服务。借款产品灵活、大额、费用低、手续快；投资方式人性友好、回报高、百分百本金保护！Dianrong.com provides online efficient investment and financing services for individuals and SMEs. Better rates, lower cost, faster way to borrowers and more flexible investment, higher returns, 100% principal protection to investors." /> 
        <meta name="keywords" content="P2P网贷,P2P网络贷款平台,P2P网络投资平台,P2P投资理财平台,网络贷款平台,团团赚,点融,点融网,点融官网" /> 
        <link rel="shortcut icon" href="static/images/favicon.ico" />
        <title>帮助中心-help.html</title> 
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
        <div class="wrapper help-center"> 
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
                                <ul class="dropdown-menu" ng-show="cart.amountSum == 0"> 
                                    <li class="shopping-cart-empty"> <p>你还没有投标，查看<a href="market.jsp">热投项目</a>，立即开启投资之旅！</p> </li>
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
                            <li class="dropdown"> <a href="member_info.jsp" class="dropdown-toggle hoverHeader" ng-show="session.firstLoaded & amp; & amp; session.actor.username" data-toggle="dropdown" data-hover="dropdown">素材火的账户 <b class="caret"></b></a>
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
                                        <li class="main-link-list active"> <a class="main-link" href="help.jsp"> <span class="main-link-text">帮助中心</span> </a> </li>
                                        <li class="main-link-list"> <a class="main-link" href="about.jsp"> <span class="main-link-text">关于我们</span> </a> </li>
                                    </ul> 
                                </div> 
                                <!-- /.navbar-collapse --> 
                            </div> 
                        </nav> 
                    </div> 
                    <!--secondaryNav--> 
                    <div class="container help-center-header" ng-controller="HelpCenterCtrl"> 
                        <div class="search-box"> 
                            <div class="form-group" ng-controller="FaqSearchCtrl"> 
                                <div class="input-group input-group-lg"> 
                                    <input type="text" ng-model="search" class="form-control input-lg" ng-focus="searchFocus = true" ng-blur="searchFocus = false" placeholder="搜索问题和答案" /> 
                                    <span class="input-group-btn search-addon" ng-class="{active:searchFocus}"> <button class="btn"> <span class="sl-icon-search"></span> </button> </span> 
                                </div> 
                            </div> 
                        </div> 
                    </div> 
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
            <div id="notifications" ng-show="notify.messages.msg.length & gt; 0" class="ng-cloak affix-top" data-spy="affix" data-offset-top="0"> 
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
            <div class="container help-container">
                <div class="ng-scope" autoscroll="false" ui-view="" style="">
                    <div id="faq-main" class="container ng-scope">
                        <div class="row">
                            <div class="col-xs-7">
                                <div class="faq-header">
                                    <h4>问题分类</h4>
                                </div>
                                <div class="faq-content">
                                    <div class="faq-category ng-scope" ng-repeat="cat in faqs">
                                        <div class="row cat-header">
                                            <div class="col-xs-8">
                                                <h6 class="category-header faq-category-icon icon0">关于点融网</h6>
                                            </div>
                                            <div class="col-xs-4 view-all-col">
                                                <a class="view-all ng-binding" ui-sref="faqTopic({ categoryId: cat.cid })" href="#/faq/topic/0">查看所有14个问题</a>
                                            </div>
                                        </div>
                                        <div class="row cat-item">
                                            <ul class="item-ul list-unstyled">
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/0/0">点融网什么时候成立的？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/0/1">点融网和其他P2P网站有什么不同？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/0/2">点融网的合法经营的资质？</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="faq-category ng-scope" ng-repeat="cat in faqs">
                                        <div class="row cat-header">
                                            <div class="col-xs-8">
                                                <h6 class="category-header faq-category-icon icon1">P2P百科与政策</h6>
                                            </div>
                                            <div class="col-xs-4 view-all-col">
                                                <a class="view-all ng-binding" ui-sref="faqTopic({ categoryId: cat.cid })" href="#/faq/topic/1">查看所有9个问题</a>
                                            </div>
                                        </div>
                                        <div class="row cat-item">
                                            <ul class="item-ul list-unstyled">
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/1/0">什么是抵押标？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/1/1">什么是P2P？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/1/2">P2P业务是否是合法的？</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="faq-category ng-scope" ng-repeat="cat in faqs">
                                        <div class="row cat-header">
                                            <div class="col-xs-8">
                                                <h6 class="category-header faq-category-icon icon2">注册与登陆</h6>
                                            </div>
                                            <div class="col-xs-4 view-all-col">
                                                <a class="view-all ng-binding" ui-sref="faqTopic({ categoryId: cat.cid })" href="#/faq/topic/2">查看所有10个问题</a>
                                            </div>
                                        </div>
                                        <div class="row cat-item">
                                            <ul class="item-ul list-unstyled">
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/2/0">注册过程中输入错误信息怎么办？以后可以修改吗？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/2/1">点融网支持哪些网银？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/2/2">点融网支持哪些浏览器？</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="faq-category ng-scope" ng-repeat="cat in faqs">
                                        <div class="row cat-header">
                                            <div class="col-xs-8">
                                                <h6 class="category-header faq-category-icon icon3">利率与费用</h6>
                                            </div>
                                            <div class="col-xs-4 view-all-col">
                                                <a class="view-all ng-binding" ui-sref="faqTopic({ categoryId: cat.cid })" href="#/faq/topic/3">查看所有3个问题</a>
                                            </div>
                                        </div>
                                        <div class="row cat-item">
                                            <ul class="item-ul list-unstyled">
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/3/0">在点融网投资或者贷款，需要支付哪些费用？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/3/1">点融网给投资人提供了什么样的优惠的收益？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/3/2">点融网如何决定借款利率？</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="faq-category ng-scope" ng-repeat="cat in faqs">
                                        <div class="row cat-header">
                                            <div class="col-xs-8">
                                                <h6 class="category-header faq-category-icon icon4">投资团团赚</h6>
                                            </div>
                                            <div class="col-xs-4 view-all-col">
                                                <a class="view-all ng-binding" ui-sref="faqTopic({ categoryId: cat.cid })" href="#/faq/topic/4">查看所有10个问题</a>
                                            </div>
                                        </div>
                                        <div class="row cat-item">
                                            <ul class="item-ul list-unstyled">
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/4/0">团团赚安全吗？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/4/1">什么是团团赚？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/4/2">个标与团团赚有什么不同？</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="faq-category ng-scope" ng-repeat="cat in faqs">
                                        <div class="row cat-header">
                                            <div class="col-xs-8">
                                                <h6 class="category-header faq-category-icon icon5">投资散标</h6>
                                            </div>
                                            <div class="col-xs-4 view-all-col">
                                                <a class="view-all ng-binding" ui-sref="faqTopic({ categoryId: cat.cid })" href="#/faq/topic/5">查看所有22个问题</a>
                                            </div>
                                        </div>
                                        <div class="row cat-item">
                                            <ul class="item-ul list-unstyled">
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/5/0">什么是散标？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/5/1">散标与团团赚有什么不同？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/5/2">投标前我需要注意的事项？</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="faq-category ng-scope" ng-repeat="cat in faqs">
                                        <div class="row cat-header">
                                            <div class="col-xs-8">
                                                <h6 class="category-header faq-category-icon icon6">保障与安全</h6>
                                            </div>
                                            <div class="col-xs-4 view-all-col">
                                                <a class="view-all ng-binding" ui-sref="faqTopic({ categoryId: cat.cid })" href="#/faq/topic/6">查看所有19个问题</a>
                                            </div>
                                        </div>
                                        <div class="row cat-item">
                                            <ul class="item-ul list-unstyled">
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/6/0">本金保障计划是由点融网保障本金吗？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/6/1">点融坏账率是多少？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/6/2">我在点融网的资金安全吗？</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="faq-category ng-scope" ng-repeat="cat in faqs">
                                        <div class="row cat-header">
                                            <div class="col-xs-8">
                                                <h6 class="category-header faq-category-icon icon7">充值、投资与提现</h6>
                                            </div>
                                            <div class="col-xs-4 view-all-col">
                                                <a class="view-all ng-binding" ui-sref="faqTopic({ categoryId: cat.cid })" href="#/faq/topic/7">查看所有9个问题</a>
                                            </div>
                                        </div>
                                        <div class="row cat-item">
                                            <ul class="item-ul list-unstyled">
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/7/0">充值是必须的吗？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/7/1">我们如何充值？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/7/2">手机收不到验证码怎么办？</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="faq-category ng-scope" ng-repeat="cat in faqs">
                                        <div class="row cat-header">
                                            <div class="col-xs-8">
                                                <h6 class="category-header faq-category-icon icon8">借款</h6>
                                            </div>
                                            <div class="col-xs-4 view-all-col">
                                                <a class="view-all ng-binding" ui-sref="faqTopic({ categoryId: cat.cid })" href="#/faq/topic/8">查看所有25个问题</a>
                                            </div>
                                        </div>
                                        <div class="row cat-item">
                                            <ul class="item-ul list-unstyled">
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/8/0">借款申请条件有哪些？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/8/1">借款的申请流程是怎样的？</a>
                                                </li>
                                                <li class="hot-item ng-scope" ng-repeat="item in cat.faq| limitTo:categoryItemLimit">
                                                    <a class="ng-binding" ui-sref="faqArticle({ categoryId: cat.cid, questionId: item.fid })" href="#/faq/article/8/2">借款额度是多少？</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-5">
                                <div class="faq-header">
                                    <h4>新手指南</h4>
                                </div>
                                <div class="faq-content new-user-videos row">
                                    <div class="col-xs-6">
                                        <a class="caption-img text-center" href="/public/video?videoSrc=http://7u2g59.com1.z0.glb.clouddn.com/how_to_top_up.mp4" target="_blank">
                                            <img src="static/images/how-to-recharge.png">
                                            <span>如何充值 》</span>
                                        </a>
                                    </div>
                                    <div class="col-xs-6">
                                        <a class="caption-img text-center" href="/public/video?videoSrc=http://7u2g59.com1.z0.glb.clouddn.com/how_to_invest.mp4" target="_blank">
                                            <img src="static/images/how-to-groupbuy.png">
                                            <span>如何投资团团赚 》</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="faq-header">
                                    <h4>热门问题</h4>
                                </div>
                                <div class="faq-content hot-faq-content">
                                    <ul class="list-unstyled ng-isolate-scope" search="search" simple-limit="10" hot-faq="faqs[0].faq">
                                        <li class="hot-qa ng-scope" ng-repeat="sf in simpleFaq| filter:search| limitTo: simpleLimit">
                                            <span class="hot-qa-ask">
                                                <span class="ask">问：</span>
                                                <a class="ng-binding" ng-bind-html="getHtml(sf.question)" href="#/faq/article/0/0">点融网什么时候成立的？</a>
                                            </span>
                                            <p class="hot-qa-answer">
                                                <span class="ask">答：</span>
                                                <span class="only-answer ng-binding" ng-bind-html="getHtml(sf.answer)">2012年成立，2013年3月正式上线。</span>
                                            </p>
                                        </li>
                                        <li class="hot-qa ng-scope" ng-repeat="sf in simpleFaq| filter:search| limitTo: simpleLimit">
                                            <span class="hot-qa-ask">
                                                <span class="ask">问：</span>
                                                <a class="ng-binding" ng-bind-html="getHtml(sf.question)" href="#/faq/article/0/1">点融网和其他P2P网站有什么不同？</a>
                                            </span>
                                            <p class="hot-qa-answer">
                                                <span class="ask">答：</span>
                                                <span class="only-answer ng-binding" ng-bind-html="getHtml(sf.answer)">1. 我们不参与交易，借款人支付的利息100%会给到平台的投资人。 2. 领先的LendingClub技术，使用团团赚投资，让100元也能极度分散到成千上万的项目里面。</span>
                                            </p>
                                        </li>
                                        <li class="hot-qa ng-scope" ng-repeat="sf in simpleFaq| filter:search| limitTo: simpleLimit">
                                            <span class="hot-qa-ask">
                                                <span class="ask">问：</span>
                                                <a class="ng-binding" ng-bind-html="getHtml(sf.question)" href="#/faq/article/0/2">点融网的合法经营的资质？</a>
                                            </span>
                                            <p class="hot-qa-answer">
                                                <span class="ask">答：</span>
                                                <span class="only-answer ng-binding" ng-bind-html="getHtml(sf.answer)">点融网由上海点荣金融信息服务有限责任公司营运，具有金融信息服务资质，根据我国法律登记成立，完全合法。</span>
                                            </p>
                                        </li>
                                        <li class="hot-qa ng-scope" ng-repeat="sf in simpleFaq| filter:search| limitTo: simpleLimit">
                                            <span class="hot-qa-ask">
                                                <span class="ask">问：</span>
                                                <a class="ng-binding" ng-bind-html="getHtml(sf.question)" href="#/faq/article/0/3">点融网是否有从事借贷业务的资格？</a>
                                            </span>
                                            <p class="hot-qa-answer">
                                                <span class="ask">答：</span>
                                                <span class="only-answer ng-binding" ng-bind-html="getHtml(sf.answer)">我们公司有上海市金融办支持，持有金融信息服务牌照。民间借贷是受到《中华人民共和国民法通则》、《关于贯彻执行〈中华人民共和国民法通则〉若干问题的意见》、《最高人民法院关于人民法院审理借贷案件的若干意见》等法律法规、司法解释保护的一种借贷关系。我们提供的的是金融信息服务，并非借贷业务。</span>
                                            </p>
                                        </li>
                                        <li class="hot-qa ng-scope" ng-repeat="sf in simpleFaq| filter:search| limitTo: simpleLimit">
                                            <span class="hot-qa-ask">
                                                <span class="ask">问：</span>
                                                <a class="ng-binding" ng-bind-html="getHtml(sf.question)" href="#/faq/article/0/4">加入点融网有什么好处？</a>
                                            </span>
                                            <p class="hot-qa-answer">
                                                <span class="ask">答：</span>
                                                <span class="only-answer ng-binding" ng-bind-html="getHtml(sf.answer)">当您需要资金时，点融网利用技术真正降低借贷成本，更容易借到款。 当您有闲余资金时，可以选择适合您的借款标来投资，提高您的投资回报收益。</span>
                                            </p>
                                        </li>
                                        <li class="hot-qa ng-scope" ng-repeat="sf in simpleFaq| filter:search| limitTo: simpleLimit">
                                            <span class="hot-qa-ask">
                                                <span class="ask">问：</span>
                                                <a class="ng-binding" ng-bind-html="getHtml(sf.question)" href="#/faq/article/0/5">点融网的客户是哪些人？</a>
                                            </span>
                                            <p class="hot-qa-answer">
                                                <span class="ask">答：</span>
                                                <span class="only-answer ng-binding" ng-bind-html="getHtml(sf.answer)">点融网借款的客户主要是中小企业，以及有固定收入的个人。点融网的投资者则来自各行各业、五湖四海，他们对互联网理财有着自己见解。</span>
                                            </p>
                                        </li>
                                        <li class="hot-qa ng-scope" ng-repeat="sf in simpleFaq| filter:search| limitTo: simpleLimit">
                                            <span class="hot-qa-ask">
                                                <span class="ask">问：</span>
                                                <a class="ng-binding" ng-bind-html="getHtml(sf.question)" href="#/faq/article/0/6">点融网有线下服务网点吗？</a>
                                            </span>
                                            <p class="hot-qa-answer">
                                                <span class="ask">答：</span>
                                                <span class="only-answer ng-binding" ng-bind-html="getHtml(sf.answer)">点融网目前在13个城市有服务网点，主要服务有贷款需求的企业以及个人，做地面现审工作。总公司位于上海市蒙自路207号1号楼5层，上班时间为周一到周五，上午9:30到下午18:30 。如需咨询网点，请拨打客服电话：400-921-9218；或者发送邮件到：support@dianrong.com</span>
                                            </p>
                                        </li>
                                        <li class="hot-qa ng-scope" ng-repeat="sf in simpleFaq| filter:search| limitTo: simpleLimit">
                                            <span class="hot-qa-ask">
                                                <span class="ask">问：</span>
                                                <a class="ng-binding" ng-bind-html="getHtml(sf.question)" href="#/faq/article/0/7">点融网的诚信怎么体现？点融网的透明高效体现在哪里？</a>
                                            </span>
                                            <p class="hot-qa-answer">
                                                <span class="ask">答：</span>
                                                <span class="only-answer ng-binding" ng-bind-html="getHtml(sf.answer)">点融网的投资标的信息对外公开。投资者可以看到所有投资资金的去向及实时还款情况。</span>
                                            </p>
                                        </li>
                                        <li class="hot-qa ng-scope" ng-repeat="sf in simpleFaq| filter:search| limitTo: simpleLimit">
                                            <span class="hot-qa-ask">
                                                <span class="ask">问：</span>
                                                <a class="ng-binding" ng-bind-html="getHtml(sf.question)" href="#/faq/article/0/8">加入点融网投资人有什么优惠活动吗？</a>
                                            </span>
                                            <p class="hot-qa-answer">
                                                <span class="ask">答：</span>
                                                <span class="only-answer ng-binding" ng-bind-html="getHtml(sf.answer)">我们不定期会举行优惠活动，建议你拨打客服电话400-921-9218，也可关注点融网微信平台（微信搜索点融网或dianrongapi）</span>
                                            </p>
                                        </li>
                                        <li class="hot-qa ng-scope" ng-repeat="sf in simpleFaq| filter:search| limitTo: simpleLimit">
                                            <span class="hot-qa-ask">
                                                <span class="ask">问：</span>
                                                <a class="ng-binding" ng-bind-html="getHtml(sf.question)" href="#/faq/article/0/9">点融网是外资公司吗？</a>
                                            </span>
                                            <p class="hot-qa-answer">
                                                <span class="ask">答：</span>
                                                <span class="only-answer ng-binding" ng-bind-html="getHtml(sf.answer)">点融网是国内合资公司。</span>
                                            </p>
                                        </li>
                                    </ul>
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