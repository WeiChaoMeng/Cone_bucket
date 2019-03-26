<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2019/3/14
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>浏览器版本验证</title>
</head>
<body>

</body>
<script src="../../static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
    (function ($) {
        //存入全局Ajax地址
        // localStorage.setItem('ajaxUrl', 'http://localhost:8080');
        localStorage.setItem('ajaxUrl', 'http://39.105.60.246');

        var BrowserMatch = {
            init: function () {
                this.browser = this.getBrowser().browser || "未知浏览器";  //获取浏览器名
                this.version = this.getBrowser().version || "未知浏览器版本号";  //获取浏览器版本
            },
            getBrowser: function () {  // 获取浏览器名
                var rMsie = /(msie\s|trident\/7)([\w\.]+)/;
                var rTrident = /(trident)\/([\w.]+)/;
                var rEdge = /(chrome)\/([\w.]+)/;//IE

                var rFirefox = /(firefox)\/([\w.]+)/;  //火狐
                var rOpera = /(opera).+version\/([\w.]+)/;  //旧Opera
                var rNewOpera = /(opr)\/(.+)/;  //新Opera 基于谷歌
                var rChrome = /(chrome)\/([\w.]+)/; //谷歌
                var rUC = /(chrome)\/([\w.]+)/;//UC
                var rMaxthon = /(chrome)\/([\w.]+)/;//遨游
                var r2345 = /(chrome)\/([\w.]+)/;//2345
                var rQQ = /(chrome)\/([\w.]+)/;//QQ
                //var rMetasr =  /(metasr)\/([\w.]+)/;//搜狗
                var rSafari = /version\/([\w.]+).*(safari)/;

                var ua = navigator.userAgent.toLowerCase();


                var matchBS, matchBS2;

                //IE 低版
                matchBS = rMsie.exec(ua);
                if (matchBS != null) {
                    matchBS2 = rTrident.exec(ua);
                    if (matchBS2 != null) {
                        switch (matchBS2[2]) {
                            case "4.0":
                                return {
                                    browser:
                                        "Microsoft IE",
                                    version: "8"  //内核版本号
                                };
                                break;
                            case "5.0":
                                return {
                                    browser:
                                        "Microsoft IE",
                                    version: "9"
                                };
                                break;
                            case "6.0":
                                return {
                                    browser:
                                        "Microsoft IE",
                                    version: "10"
                                };
                                break;
                            case "7.0":
                                return {
                                    browser:
                                        "Microsoft IE",
                                    version: "11"
                                };
                                break;
                            default:
                                return {
                                    browser:
                                        "Microsoft IE",
                                    version: "Undefined"
                                };
                        }
                    } else {
                        return {
                            browser: "Microsoft IE",
                            version: "IE:" + matchBS[2] || "0"
                        };
                    }
                }
                //IE最新版
                matchBS = rEdge.exec(ua);
                if ((matchBS != null) && (!(window.attachEvent))) {
                    return {
                        browser: "Microsoft Edge",
                        version: "Chrome/" + matchBS[2] || "0"
                    };
                }
                //UC浏览器
                matchBS = rUC.exec(ua);
                if ((matchBS != null) && (!(window.attachEvent))) {
                    return {
                        browser: "UC",
                        version: "Chrome/" + matchBS[2] || "0"
                    };
                }
                //火狐浏览器
                matchBS = rFirefox.exec(ua);
                if ((matchBS != null) && (!(window.attachEvent))) {
                    return {
                        browser: "火狐",
                        version: "Firefox/" + matchBS[2] || "0"
                    };
                }
                //Oper浏览器
                matchBS = rOpera.exec(ua);
                if ((matchBS != null) && (!(window.attachEvent))) {
                    return {
                        browser: "Opera",
                        version: "Chrome/" + matchBS[2] || "0"
                    };
                }
                //遨游
                matchBS = rMaxthon.exec(ua);
                if ((matchBS != null) && (!(window.attachEvent))) {
                    return {
                        browser: "遨游",
                        version: "Chrome/" + matchBS[2] || "0"
                    };
                }
                //2345浏览器
                matchBS = r2345.exec(ua);
                if ((matchBS != null) && (!(window.attachEvent))) {
                    return {
                        browser: "2345",
                        version: "Chrome/ " + matchBS[2] || "0"
                    };
                }
                //QQ浏览器
                matchBS = rQQ.exec(ua);
                if ((matchBS != null) && (!(window.attachEvent))) {
                    return {
                        browser: "QQ",
                        version: "Chrome/" + matchBS[2] || "0"
                    };
                }
                //Safari（苹果）浏览器
                matchBS = rSafari.exec(ua);
                if ((matchBS != null) && (!(window.attachEvent)) && (!(window.chrome)) && (!(window.opera))) {
                    return {
                        browser: "Safari",
                        version: "Safari/" + matchBS[1] || "0"
                    };
                }
                //谷歌浏览器
                matchBS = rChrome.exec(ua);
                if ((matchBS != null) && (!(window.attachEvent))) {
                    matchBS2 = rNewOpera.exec(ua);
                    if (matchBS2 == null) {
                        return {
                            browser: "谷歌",
                            version: "Chrome/" + matchBS[2] || "0"
                        };
                    } else {
                        return {
                            browser: "Opera",
                            version: "opr/" + matchBS2[2] || "0"
                        };
                    }
                }
            }
        };
        BrowserMatch.init();
        console.log("当前浏览器为：" + BrowserMatch.browser + "\n版本为：" + BrowserMatch.version);
        if (BrowserMatch.browser === 'Microsoft IE') {
            if (BrowserMatch.version < 10) {
                window.location.href = localStorage.getItem("ajaxUrl") + "/version.do";
                return;
            } else {
                window.location.href = localStorage.getItem("ajaxUrl") + "/login.do";
            }
        } else {
            window.location.href = localStorage.getItem("ajaxUrl") + "/login.do";
        }
    })(jQuery);
</script>
</html>