onReady = ->
  mainItems = $('.tb-trial-button')

  effectiveUrls = []

  for ele in mainItems
    do (ele) ->
      if ($(ele).attr('href') != '')
        effectiveUrls.push($(ele).attr('href'))


  async.mapLimit(effectiveUrls, 1,
  (url, callback)->
    w = open(url)

    myCommonToolsZ.fireActionByCusCondition(
      ->
        w.closed
        
    ,
    ->
      callback(null, url)
    )

  , (err, result)->
    $("body").prepend("done,count is #{result.length}");
  )



main = ->
  $("body").prepend('<button id = "myActionBtn">action</button>');


  setTimeout(
    ->
      $('button#myActionBtn').on('click',
      ->
        onReady()
      )
  , 3000)


outDate = new Date('2020-12-11')

if (outDate > new Date())
  main()
