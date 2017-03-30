$->
  # (selector).on("ajax:success", (e, data, status, xhr) ->
  # stuff you want to do)
  # Again, Sabrina saved our lives.
  # form_for has to have remote: true
  console.log('bitches')
  $('form').on("ajax:success", (e, data, status, xhr) ->
    console.log(e)
    )
