$(document).ready(function(){
  const formIsValid = () => {
    let errCount = 0;
    $(".input-sm").each(function (index,value) {
        if($(this).val() === "") {
          $(this).addClass("error");
          $(this).parent().find(".error-empty").slideDown("fast");
          errCount++;
        }
      });
      var phoneNum = $("#user_cell").val().replace(/\D+/g,"");
      if(phoneNum.length !== 10 && !$("#user_cell").hasClass("error")) {
        $("#user_cell").addClass("error");
        $(".error-phone-length").slideDown("fast");
        errCount++
      }

      if($("#user_password").val() !== $("#user_password_confirmation").val()){
        $('#user_password').addClass("error")
        $('#user_password_confirmation').addClass("error")
        $('.error-matching').slideDown("fast");
        errCount++
      }
    if(errCount === 0) {
      $("#new_user input[type='submit']").attr("disabled", false);
    }
    return errCount === 0;
  }
  $(".input-sm").on("blur", function() {
    var $this = $(this)
    if ($this.val() === "") {
        $this.addClass("error");
        $this.parent().find("error-empty").slideDown("fast")
    } else if ($this.hasClass("error")) {
      if($this.attr("id")  === "user_cell"){
        var phoneNum = $("#user_cell").val().replace(/\D+/g,"");
        if(phoneNum.length === 10) {
          $(".error-phone-length").slideUp("fast");
        } 
        else if($("#user_password").val() === $("#user_password_confirmation").val()) {
          $(".error-matching").slideUp('fast');
        } else {
          $this.parent().find("error-empty").slideUp("fast")
        }
      }
      $this.removeClass("error");    
    }
    // formIsValid()
  });
  $("#new_user").on("submit", function (e){
    return formIsValid();
  });

  $('#user_cell.error').on("focusout", function() {
    if(phoneNum.length === 10) {
      $("#user_cell").removeClass("error");
      $(".error-phone-length").slideUp("fast");
    }
  });

  $(".input-sm").on("input", function() {
    if($(this).val().length > 0) {
      $(this).removeClass("error");
      $(this).parent().find(".error-empty").slideUp("fast");
    }
  });

});