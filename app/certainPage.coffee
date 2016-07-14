
main = ->

  myCommonToolsZ.fireActionByCusCondition(
    ->

      text = $('.apply-try-errmsg .t1').text()

      switch text
        when  '您已经申请过该试用品,看看其他试用品吧' , "申请结果已公布，报告收集中..."
          return true
        when '啊哦！对不起，您今天申请的次数已经达到上限！'
          myChromePlugTools.sendMsg("tbtMsg",{isFinishedToday : true, tip:'啊哦！对不起，您今天申请的次数已经达到上限！'})
          return true


      false
  ,
    ->
      close()
  ,undefined ,
    1000
  )
  
  controller = new PageActionControllerZ()

  controller.add(new PageActionJQ(
    ->
      $('.J_TryApply')
  ,
    (ele) ->
      ele[0]?.click()
  ),
    new PageActionJQ(
      ->
        $('.apply-try-address-submit')
    ,
      (ele) ->
        ele[0]?.click()
    )
    ,
    new PageActionJQ(
      ->
        $('.apply-try-address-submit')
    ,
      (ele) ->
        ele[0]?.click()

        setTimeout(
          ->
            close()
        , 3000
        )
    )
  )

  controller.doAction()


main()