
initView = () ->

  controller = controllerMain

  myCommonUITools.addButton(
    ->
      $('.try-list .tb-trial-wd-item-trial')
    ,
    ->
      $(this).parent().remove()
    ,'删除'

  )

  myCommonUITools.addDefaultButton(
    ->
      $('.try-list')
    ,
    ->
      controller.doAction()
    ,"启动"
  )

controllerMain = null

preUrl = 'first'

main = ->

  urlsAll = []

  myChromePlugTools.onReceive("tbtMsg",
    (obj, sender) ->
      if obj['isFinishedToday']
        myCommonUITools.setTextDefault(obj['tip'])

  )

  controllerMain = controller = new PageActionControllerZ

  initView()

  acquireUrlsAction = new PageActionJQ

  acquireUrlsAction.getElement = ->
    $('.try-list a.tb-trial-button')

  acquireUrlsAction.fireActionCus = (eles) ->

    urls = []

    for ele in eles
      url = $(ele).attr('href')

      if urlsAll.indexOf(url) != -1
        continue

      urls.push (url)
      urlsAll.push(url)

    async.mapLimit(urls, 1,
      (url, callback)->
        w = open(url)

        myCommonToolsZ.fireActionByCusCondition(
          ->
          w.closed
        ,
          ->
            callback(null, url)
        )
    ,
      (err, result) ->
        controller.onFinished(result)
    )

  controller.add(acquireUrlsAction)

  myCommonToolsZ.fireActionByCusCondition(
    ->

      urlT = $('.try-list a.tb-trial-button:first').attr("href")
      result = (urlT != preUrl)

      if result
        if preUrl == 'first'
          preUrl = urlT
          return false
        preUrl = urlT

      result

    ->
      initView()
  ,
    false,1000,1000
  )


myCommonToolsZ.fireActionByCusCondition(
  ->
    $('.try-list .tb-trial-wd-item-trial')
,
  ->
    main()
,undefined ,1000,1000
)



