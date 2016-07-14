onReady = ->
  setTimeout(->
    $('.J_TryApply')[0]?.click()
  , 100)

  myCommonToolsZ.fireActionByCusCondition(
    ->
      $('.apply-try-address-submit').length != 0
  ,
  ->
    $('.apply-try-address-submit')[0].click()
    setTimeout(
      ->
        close()
    , 3000
    )
  )


myCommonToolsZ.fireActionByCusCondition(
  ->
    $('.J_TryApply').length != 0
,
->
  onReady.call()
)


myCommonToolsZ.fireActionInCondition(
  ->
    $('.apply-try-errmsg .t1').text() == '您已经申请过该试用品,看看其他试用品吧' or $('.apply-try-msg').text() == "申请结果已公布，报告收集中..."
,
->
  close()
,
  1000
)


