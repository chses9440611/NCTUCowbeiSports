document.addEventListener("turbolinks:load", function() {
  var destroyLink = document.getElementById("anncs-bulk-destroy")
  destroyLink.addEventListener("click", function() {
    var form = document.getElementById("anncs-bulk-destroy-form")
    if (confirm("確定一次刪除選擇的公告？")) {
      form.submit()
    }
  })
})
