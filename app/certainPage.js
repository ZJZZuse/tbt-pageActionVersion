// Generated by CoffeeScript 1.10.0
(function() {
  var main;

  main = function() {
    var controller;
    myCommonToolsZ.fireActionByCusCondition(function() {
      var text;
      text = $('.apply-try-errmsg .t1').text();
      switch (text) {
        case '您已经申请过该试用品,看看其他试用品吧':
        case "申请结果已公布，报告收集中...":
          return true;
        case '啊哦！对不起，您今天申请的次数已经达到上限！':
          myChromePlugTools.sendMsg("tbtMsg", {
            isFinishedToday: true,
            tip: '啊哦！对不起，您今天申请的次数已经达到上限！'
          });
          return true;
      }
      return false;
    }, function() {
      return close();
    }, void 0, 1000);
    controller = new PageActionControllerZ();
    controller.add(new PageActionJQ(function() {
      return $('.J_TryApply');
    }, function(ele) {
      var ref;
      return (ref = ele[0]) != null ? ref.click() : void 0;
    }), new PageActionJQ(function() {
      return $('.apply-try-address-submit');
    }, function(ele) {
      var ref;
      return (ref = ele[0]) != null ? ref.click() : void 0;
    }), new PageActionJQ(function() {
      return $('.apply-try-address-submit');
    }, function(ele) {
      var ref;
      if ((ref = ele[0]) != null) {
        ref.click();
      }
      return setTimeout(function() {
        return close();
      }, 3000);
    }));
    return controller.doAction();
  };

  main();

}).call(this);

//# sourceMappingURL=certainPage.js.map